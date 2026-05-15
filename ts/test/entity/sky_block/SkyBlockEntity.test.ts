
const envlocal = __dirname + '/../../../.env.local'
require('dotenv').config({ quiet: true, path: [envlocal] })

import Path from 'node:path'
import * as Fs from 'node:fs'

import { test, describe, afterEach } from 'node:test'
import assert from 'node:assert'


import { HypixelSDK, BaseFeature, stdutil } from '../../..'

import {
  envOverride,
  liveDelay,
  makeCtrl,
  makeMatch,
  makeReqdata,
  makeStepData,
  makeValid,
  maybeSkipControl,
} from '../../utility'


describe('SkyBlockEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when HYPIXEL_TEST_LIVE=TRUE.
  afterEach(liveDelay('HYPIXEL_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = HypixelSDK.test()
    const ent = testsdk.SkyBlock()
    assert(null != ent)
  })


  test('basic', async (t) => {

    const live = 'TRUE' === process.env.HYPIXEL_TEST_LIVE
    for (const op of ['list', 'load']) {
      if (maybeSkipControl(t, 'entityOp', 'sky_block.' + op, live)) return
    }

    const setup = basicSetup()
    // The basic flow consumes synthetic IDs and field values from the
    // fixture (entity TestData.json). Those don't exist on the live API.
    // Skip live runs unless the user provided a real ENTID env override.
    if (setup.syntheticOnly) {
      t.skip('live entity test uses synthetic IDs from fixture — set HYPIXEL_TEST_SKY_BLOCK_ENTID JSON to run live')
      return
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select

    let sky_block_ref01_data = Object.values(setup.data.existing.sky_block)[0] as any

    // LIST
    const sky_block_ref01_ent = client.SkyBlock()
    const sky_block_ref01_match: any = {}

    const sky_block_ref01_list = await sky_block_ref01_ent.list(sky_block_ref01_match)


    // LOAD
    const sky_block_ref01_match_dt0: any = {}
    sky_block_ref01_match_dt0.id = sky_block_ref01_data.id
    const sky_block_ref01_data_dt0 = await sky_block_ref01_ent.load(sky_block_ref01_match_dt0)
    assert(sky_block_ref01_data_dt0.id === sky_block_ref01_data.id)


  })
})



function basicSetup(extra?: any) {
  // TODO: fix test def options
  const options: any = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname, 
      '../../../../.sdk/test/entity/sky_block/SkyBlockTestData.json')

  // TODO: file ready util needed?
  const entityDataSource = Fs.readFileSync(entityDataFile).toString('utf8')

  // TODO: need a xlang JSON parse utility in voxgig/struct with better error msgs
  const entityData = JSON.parse(entityDataSource)

  options.entity = entityData.existing

  let client = HypixelSDK.test(options, extra)
  const struct = client.utility().struct
  const merge = struct.merge
  const transform = struct.transform

  let idmap = transform(
    ['sky_block01','sky_block02','sky_block03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  // Detect whether the user provided a real ENTID JSON via env var. The
  // basic flow consumes synthetic IDs from the fixture file; without an
  // override those synthetic IDs reach the live API and 4xx. Surface this
  // to the test so it can skip rather than fail.
  const idmapEnvVal = process.env['HYPIXEL_TEST_SKY_BLOCK_ENTID']
  const idmapOverridden = null != idmapEnvVal && idmapEnvVal.trim().startsWith('{')

  const env = envOverride({
    'HYPIXEL_TEST_SKY_BLOCK_ENTID': idmap,
    'HYPIXEL_TEST_LIVE': 'FALSE',
    'HYPIXEL_TEST_EXPLAIN': 'FALSE',
    'HYPIXEL_APIKEY': 'NONE',
  })

  idmap = env['HYPIXEL_TEST_SKY_BLOCK_ENTID']

  const live = 'TRUE' === env.HYPIXEL_TEST_LIVE

  if (live) {
    client = new HypixelSDK(merge([
      {
        apikey: env.HYPIXEL_APIKEY,
      },
      extra
    ]))
  }

  const setup = {
    idmap,
    env,
    options,
    client,
    struct,
    data: entityData,
    explain: 'TRUE' === env.HYPIXEL_TEST_EXPLAIN,
    live,
    syntheticOnly: live && !idmapOverridden,
    now: Date.now(),
  }

  return setup
}
  
