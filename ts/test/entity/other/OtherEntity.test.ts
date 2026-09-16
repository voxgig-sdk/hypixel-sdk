

import Path from 'node:path'
import * as Fs from 'node:fs'

import { test, describe, afterEach } from 'node:test'
import assert from 'node:assert'
import { createLiveTransport } from '../../live-runner'
import { runLiveEntity } from '../../live-entity'


import { HypixelSDK, BaseFeature, stdutil } from '../../..'

import {
  envOverride,
  liveClientOptions,
  liveDelay,
  loadEnvLocal,
  makeCtrl,
  makeMatch,
  makeReqdata,
  makeStepData,
  makeValid,
  maybeSkipControl,
} from '../../utility'


// AFTER the imports on purpose: TypeScript hoists `import` above any
// statement in the emitted CommonJS, so a loader placed above them would
// run only after every imported module had already been evaluated - and
// anything reading process.env at module scope would miss these values.
loadEnvLocal(__dirname + '/../../../.env.local')


describe('OtherEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when HYPIXEL_TEST_LIVE=TRUE.
  afterEach(liveDelay('HYPIXEL_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = HypixelSDK.test()
    const ent = testsdk.Other()
    assert(null != ent)
  })


  test('basic', async (t) => {

    const live = 'TRUE' === process.env.HYPIXEL_TEST_LIVE
    for (const op of ['list', 'load']) {
      if (!live && maybeSkipControl(t, 'entityOp', 'other.' + op, live)) return
    }

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":[{"active":true,"name":"boosterState","req":false,"type":"`$OBJECT`","index$":0},{"active":true,"name":"boosters","req":false,"type":"`$ARRAY`","index$":1},{"active":true,"name":"staff_rollingDaily","req":false,"type":"`$INTEGER`","index$":2},{"active":true,"name":"staff_total","req":false,"type":"`$INTEGER`","index$":3},{"active":true,"name":"success","req":false,"type":"`$BOOLEAN`","index$":4},{"active":true,"name":"watchdog_lastMinute","req":false,"type":"`$INTEGER`","index$":5},{"active":true,"name":"watchdog_rollingDaily","req":false,"type":"`$INTEGER`","index$":6},{"active":true,"name":"watchdog_total","req":false,"type":"`$INTEGER`","index$":7}],"name":"other","op":{"list":{"input":"data","name":"list","points":[{"active":true,"args":{},"contract":{"id":"GET /v2/boosters","json":"{\"operationId\":\"getBoosters\",\"parameters\":[],\"protocol\":\"http\",\"responses\":{\"200\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"boosterState\":{\"type\":\"object\"},\"boosters\":{\"items\":{\"type\":\"object\"},\"type\":\"array\"},\"success\":{\"type\":\"boolean\"}},\"type\":\"object\"}}},\"description\":\"A successful response\"}},\"security\":[{\"ApiKey\":[]}],\"securitySchemes\":{\"ApiKey\":{\"description\":\"Obtained via the Hypixel Developer Dashboard when creating an application. You can also request higher limits for production applications in this dashboard.\",\"in\":\"header\",\"name\":\"API-Key\",\"type\":\"apiKey\"}},\"securitySource\":\"operation\"}","source":"openapi3","version":1},"kind":"http","method":"GET","orig":"/v2/boosters","segments":[{"lit":"v2"},{"lit":"boosters"}],"select":{},"transform":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"list"},"load":{"input":"data","name":"load","points":[{"active":true,"args":{},"contract":{"id":"GET /v2/counts","json":"{\"operationId\":\"getPlayerCounts\",\"parameters\":[],\"protocol\":\"http\",\"responses\":{\"200\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"games\":{\"additionalProperties\":{\"type\":\"integer\"},\"type\":\"object\"},\"playerCount\":{\"type\":\"integer\"},\"success\":{\"type\":\"boolean\"}},\"type\":\"object\"}}},\"description\":\"A successful response\"}},\"security\":[{\"ApiKey\":[]}],\"securitySchemes\":{\"ApiKey\":{\"description\":\"Obtained via the Hypixel Developer Dashboard when creating an application. You can also request higher limits for production applications in this dashboard.\",\"in\":\"header\",\"name\":\"API-Key\",\"type\":\"apiKey\"}},\"securitySource\":\"operation\"}","source":"openapi3","version":1},"kind":"http","method":"GET","orig":"/v2/counts","segments":[{"lit":"v2"},{"lit":"counts"}],"select":{},"transform":{"req":"`reqdata`","res":"`body.games`"},"index$":0},{"active":true,"args":{},"contract":{"id":"GET /v2/leaderboards","json":"{\"operationId\":\"getLeaderboards\",\"parameters\":[],\"protocol\":\"http\",\"responses\":{\"200\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"leaderboards\":{\"type\":\"object\"},\"success\":{\"type\":\"boolean\"}},\"type\":\"object\"}}},\"description\":\"A successful response\"}},\"security\":[{\"ApiKey\":[]}],\"securitySchemes\":{\"ApiKey\":{\"description\":\"Obtained via the Hypixel Developer Dashboard when creating an application. You can also request higher limits for production applications in this dashboard.\",\"in\":\"header\",\"name\":\"API-Key\",\"type\":\"apiKey\"}},\"securitySource\":\"operation\"}","source":"openapi3","version":1},"kind":"http","method":"GET","orig":"/v2/leaderboards","segments":[{"lit":"v2"},{"lit":"leaderboards"}],"select":{},"transform":{"req":"`reqdata`","res":"`body.leaderboards`"},"index$":1},{"active":true,"args":{},"contract":{"id":"GET /v2/punishmentstats","json":"{\"operationId\":\"getPunishmentStats\",\"parameters\":[],\"protocol\":\"http\",\"responses\":{\"200\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"staff_rollingDaily\":{\"type\":\"integer\"},\"staff_total\":{\"type\":\"integer\"},\"success\":{\"type\":\"boolean\"},\"watchdog_lastMinute\":{\"type\":\"integer\"},\"watchdog_rollingDaily\":{\"type\":\"integer\"},\"watchdog_total\":{\"type\":\"integer\"}},\"type\":\"object\"}}},\"description\":\"A successful response\"}},\"security\":[{\"ApiKey\":[]}],\"securitySchemes\":{\"ApiKey\":{\"description\":\"Obtained via the Hypixel Developer Dashboard when creating an application. You can also request higher limits for production applications in this dashboard.\",\"in\":\"header\",\"name\":\"API-Key\",\"type\":\"apiKey\"}},\"securitySource\":\"operation\"}","source":"openapi3","version":1},"kind":"http","method":"GET","orig":"/v2/punishmentstats","segments":[{"lit":"v2"},{"lit":"punishmentstats"}],"select":{},"transform":{"req":"`reqdata`","res":"`body`"},"index$":2}],"key$":"load"}},"relations":{"ancestors":[]},"key$":"other","name__orig":"other","Name":"Other","name_":"other","name-":"other","NAME":"OTHER","index$":2}, {"active":true,"entity":"other","key$":"BasicOtherFlow","kind":"basic","name":"BasicOtherFlow","param":{},"step":[{"active":true,"data":{},"input":{},"match":{},"op":"list","spec":[],"valid":[{"apply":"ItemExists","def":{"ref":"other_ref01"}}],"index$":0},{"active":true,"data":{},"input":{"ref":"other_ref01","srcdatavar":"other_ref01_data","suffix":"_dt0"},"match":{},"op":"load","spec":[],"valid":[{"apply":"TextFieldMark","def":{"mark":"Mark01-other_ref01"}}],"index$":1}]}, 'Other')
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select

    let other_ref01_data = Object.values(setup.data.existing.other)[0] as any

    // LIST
    const other_ref01_ent = client.Other()
    const other_ref01_match: any = {}

    const other_ref01_list = (await other_ref01_ent.list(other_ref01_match)).map((e: any) => e.data())


    // LOAD
    const other_ref01_match_dt0: any = {}
    const other_ref01_data_dt0 = (await other_ref01_ent.load(other_ref01_match_dt0)).data()
    assert(null != other_ref01_data_dt0)


  })
})



function basicSetup(extra?: any) {
  // TODO: fix test def options
  const options: any = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname, 
      '../../../../.sdk/test/entity/other/OtherTestData.json')

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
    ['other01','other02','other03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'HYPIXEL_TEST_OTHER_ENTID': idmap,
    'HYPIXEL_TEST_LIVE': 'FALSE',
    'HYPIXEL_TEST_EXPLAIN': 'FALSE',
    'HYPIXEL_APIKEY': '',
  })

  idmap = env['HYPIXEL_TEST_OTHER_ENTID']

  const live = 'TRUE' === env.HYPIXEL_TEST_LIVE

  const transport = createLiveTransport()
  if (live) {
    const rawIds = process.env['HYPIXEL_TEST_OTHER_ENTID']
    idmap = rawIds && rawIds.trim() ? JSON.parse(rawIds) : {}
    if (!idmap || Array.isArray(idmap) || typeof idmap !== 'object') {
      throw new Error('Live ENTID must be a JSON object')
    }
    client = new HypixelSDK(merge([
      // FIRST, so the generated fields below win: sdk-test-control.json's
      // test.client.options adds to the live client, it does not redirect it.
      liveClientOptions(),
      {
        apikey: env.HYPIXEL_APIKEY,
      },
      // 'extra || {}', not a bare 'extra': struct.merge returns UNDEFINED when the
      // last entry is undefined, and basicSetup is normally called with no
      // argument at all - so a bare 'extra' silently discarded the apikey
      // and server values above and handed the SDK undefined. Harmless
      // while there was nothing in that object; not harmless now.
      extra || {},
      { system: { fetch: transport.fetch } }
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
    transport,
    now: Date.now(),
  }

  return setup
}
  
