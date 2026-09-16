

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


describe('GuildEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when HYPIXEL_TEST_LIVE=TRUE.
  afterEach(liveDelay('HYPIXEL_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = HypixelSDK.test()
    const ent = testsdk.Guild()
    assert(null != ent)
  })


  test('basic', async (t) => {

    const live = 'TRUE' === process.env.HYPIXEL_TEST_LIVE
    for (const op of ['load']) {
      if (!live && maybeSkipControl(t, 'entityOp', 'guild.' + op, live)) return
    }

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":[],"name":"guild","op":{"load":{"input":"data","name":"load","points":[{"active":true,"args":{"query":[{"active":true,"kind":"query","name":"id","orig":"id","reqd":false,"type":"`$STRING`","index$":0},{"active":true,"kind":"query","name":"name","orig":"name","reqd":false,"type":"`$STRING`","index$":1},{"active":true,"kind":"query","name":"player","orig":"player","reqd":false,"type":"`$STRING`","index$":2}]},"contract":{"id":"GET /v2/guild","json":"{\"operationId\":\"getGuild\",\"parameters\":[{\"description\":\"Guild ObjectID\",\"in\":\"query\",\"name\":\"id\",\"required\":false,\"schema\":{\"type\":\"string\"}},{\"description\":\"Player UUID\",\"in\":\"query\",\"name\":\"player\",\"required\":false,\"schema\":{\"type\":\"string\"}},{\"description\":\"Guild name\",\"in\":\"query\",\"name\":\"name\",\"required\":false,\"schema\":{\"type\":\"string\"}}],\"protocol\":\"http\",\"responses\":{\"200\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"guild\":{\"description\":\"Guild data object\",\"type\":\"object\"},\"success\":{\"type\":\"boolean\"}},\"type\":\"object\"}}},\"description\":\"Get guild information\"},\"400\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"cause\":{\"description\":\"Error message describing what went wrong\",\"type\":\"string\"},\"success\":{\"example\":false,\"type\":\"boolean\"}},\"type\":\"object\"}}},\"description\":\"Some data is missing, this is usually a field.\"},\"403\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"cause\":{\"description\":\"Error message describing what went wrong\",\"type\":\"string\"},\"success\":{\"example\":false,\"type\":\"boolean\"}},\"type\":\"object\"}}},\"description\":\"Access is forbidden, usually due to an invalid API key being used.\"},\"429\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"cause\":{\"description\":\"Error message describing what went wrong\",\"type\":\"string\"},\"success\":{\"example\":false,\"type\":\"boolean\"}},\"type\":\"object\"}}},\"description\":\"A request limit has been reached, usually this is due to the limit on the key being reached but can also be triggered by a global throttle.\"}},\"security\":[{\"ApiKey\":[]}],\"securitySchemes\":{\"ApiKey\":{\"description\":\"Obtained via the Hypixel Developer Dashboard when creating an application. You can also request higher limits for production applications in this dashboard.\",\"in\":\"header\",\"name\":\"API-Key\",\"type\":\"apiKey\"}},\"securitySource\":\"operation\"}","source":"openapi3","version":1},"kind":"http","method":"GET","orig":"/v2/guild","segments":[{"lit":"v2"},{"lit":"guild"}],"select":{"exist":["id","name","player"]},"transform":{"req":"`reqdata`","res":"`body.guild`"},"index$":0}],"key$":"load"}},"relations":{"ancestors":[]},"key$":"guild","name__orig":"guild","Name":"Guild","name_":"guild","name-":"guild","NAME":"GUILD","index$":0}, {"active":true,"entity":"guild","key$":"BasicGuildFlow","kind":"basic","name":"BasicGuildFlow","param":{},"step":[{"active":true,"data":{},"input":{"ref":"guild_ref01","srcdatavar":"guild_ref01_data","suffix":"_dt0"},"match":{},"op":"load","spec":[],"valid":[{"apply":"TextFieldMark","def":{"mark":"Mark01-guild_ref01"}}],"index$":0}]}, 'Guild')
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select

    let guild_ref01_data = Object.values(setup.data.existing.guild)[0] as any

    // LOAD
    const guild_ref01_ent = client.Guild()
    const guild_ref01_match_dt0: any = {}
    const guild_ref01_data_dt0 = (await guild_ref01_ent.load(guild_ref01_match_dt0)).data()
    assert(null != guild_ref01_data_dt0)


  })
})



function basicSetup(extra?: any) {
  // TODO: fix test def options
  const options: any = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname, 
      '../../../../.sdk/test/entity/guild/GuildTestData.json')

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
    ['guild01','guild02','guild03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'HYPIXEL_TEST_GUILD_ENTID': idmap,
    'HYPIXEL_TEST_LIVE': 'FALSE',
    'HYPIXEL_TEST_EXPLAIN': 'FALSE',
    'HYPIXEL_APIKEY': '',
  })

  idmap = env['HYPIXEL_TEST_GUILD_ENTID']

  const live = 'TRUE' === env.HYPIXEL_TEST_LIVE

  const transport = createLiveTransport()
  if (live) {
    const rawIds = process.env['HYPIXEL_TEST_GUILD_ENTID']
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
  
