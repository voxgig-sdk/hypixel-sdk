

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


describe('PlayerDataEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when HYPIXEL_TEST_LIVE=TRUE.
  afterEach(liveDelay('HYPIXEL_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = HypixelSDK.test()
    const ent = testsdk.PlayerData()
    assert(null != ent)
  })


  test('basic', async (t) => {

    const live = 'TRUE' === process.env.HYPIXEL_TEST_LIVE
    for (const op of ['list', 'load']) {
      if (!live && maybeSkipControl(t, 'entityOp', 'player_data.' + op, live)) return
    }

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":[{"active":true,"format":"int64","name":"date","req":false,"type":"`$INTEGER`","index$":0},{"active":true,"format":"int64","name":"ended","req":false,"type":"`$INTEGER`","index$":1},{"active":true,"name":"gameType","req":false,"type":"`$STRING`","index$":2},{"active":true,"name":"map","req":false,"type":"`$STRING`","index$":3},{"active":true,"name":"mode","req":false,"type":"`$STRING`","index$":4},{"active":true,"name":"online","req":false,"type":"`$BOOLEAN`","index$":5}],"name":"player_data","op":{"list":{"input":"data","name":"list","points":[{"active":true,"args":{"query":[{"active":true,"kind":"query","name":"uuid","orig":"uuid","reqd":true,"type":"`$STRING`","index$":0}]},"contract":{"id":"GET /v2/recentgames","json":"{\"operationId\":\"getRecentGames\",\"parameters\":[{\"description\":\"Player UUID (supports both dashed and undashed versions)\",\"in\":\"query\",\"name\":\"uuid\",\"required\":true,\"schema\":{\"type\":\"string\"}}],\"protocol\":\"http\",\"responses\":{\"200\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"games\":{\"items\":{\"properties\":{\"date\":{\"format\":\"int64\",\"type\":\"integer\"},\"ended\":{\"format\":\"int64\",\"type\":\"integer\"},\"gameType\":{\"type\":\"string\"},\"map\":{\"type\":\"string\"},\"mode\":{\"type\":\"string\"}},\"type\":\"object\"},\"type\":\"array\"},\"success\":{\"type\":\"boolean\"},\"uuid\":{\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Get player's recent game\"},\"400\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"cause\":{\"description\":\"Error message describing what went wrong\",\"type\":\"string\"},\"success\":{\"example\":false,\"type\":\"boolean\"}},\"type\":\"object\"}}},\"description\":\"Some data is missing, this is usually a field.\"},\"403\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"cause\":{\"description\":\"Error message describing what went wrong\",\"type\":\"string\"},\"success\":{\"example\":false,\"type\":\"boolean\"}},\"type\":\"object\"}}},\"description\":\"Access is forbidden, usually due to an invalid API key being used.\"},\"422\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"cause\":{\"description\":\"Error message describing what went wrong\",\"type\":\"string\"},\"success\":{\"example\":false,\"type\":\"boolean\"}},\"type\":\"object\"}}},\"description\":\"Some data provided is invalid.\"},\"429\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"cause\":{\"description\":\"Error message describing what went wrong\",\"type\":\"string\"},\"success\":{\"example\":false,\"type\":\"boolean\"}},\"type\":\"object\"}}},\"description\":\"A request limit has been reached, usually this is due to the limit on the key being reached but can also be triggered by a global throttle.\"}},\"security\":[{\"ApiKey\":[]}],\"securitySchemes\":{\"ApiKey\":{\"description\":\"Obtained via the Hypixel Developer Dashboard when creating an application. You can also request higher limits for production applications in this dashboard.\",\"in\":\"header\",\"name\":\"API-Key\",\"type\":\"apiKey\"}},\"securitySource\":\"operation\"}","source":"openapi3","version":1},"kind":"http","method":"GET","orig":"/v2/recentgames","segments":[{"lit":"v2"},{"lit":"recentgames"}],"select":{"exist":["uuid"]},"transform":{"req":"`reqdata`","res":"`body.games`"},"index$":0}],"key$":"list"},"load":{"input":"data","name":"load","points":[{"active":true,"args":{"query":[{"active":true,"kind":"query","name":"uuid","orig":"uuid","reqd":true,"type":"`$STRING`","index$":0}]},"contract":{"id":"GET /v2/status","json":"{\"operationId\":\"getPlayerStatus\",\"parameters\":[{\"description\":\"Player UUID (supports both dashed and undashed versions)\",\"in\":\"query\",\"name\":\"uuid\",\"required\":true,\"schema\":{\"type\":\"string\"}}],\"protocol\":\"http\",\"responses\":{\"200\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"session\":{\"properties\":{\"gameType\":{\"type\":\"string\"},\"map\":{\"type\":\"string\"},\"mode\":{\"type\":\"string\"},\"online\":{\"type\":\"boolean\"}},\"type\":\"object\"},\"success\":{\"type\":\"boolean\"},\"uuid\":{\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Get player status\"},\"400\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"cause\":{\"description\":\"Error message describing what went wrong\",\"type\":\"string\"},\"success\":{\"example\":false,\"type\":\"boolean\"}},\"type\":\"object\"}}},\"description\":\"Some data is missing, this is usually a field.\"},\"403\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"cause\":{\"description\":\"Error message describing what went wrong\",\"type\":\"string\"},\"success\":{\"example\":false,\"type\":\"boolean\"}},\"type\":\"object\"}}},\"description\":\"Access is forbidden, usually due to an invalid API key being used.\"},\"429\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"cause\":{\"description\":\"Error message describing what went wrong\",\"type\":\"string\"},\"success\":{\"example\":false,\"type\":\"boolean\"}},\"type\":\"object\"}}},\"description\":\"A request limit has been reached, usually this is due to the limit on the key being reached but can also be triggered by a global throttle.\"}},\"security\":[{\"ApiKey\":[]}],\"securitySchemes\":{\"ApiKey\":{\"description\":\"Obtained via the Hypixel Developer Dashboard when creating an application. You can also request higher limits for production applications in this dashboard.\",\"in\":\"header\",\"name\":\"API-Key\",\"type\":\"apiKey\"}},\"securitySource\":\"operation\"}","source":"openapi3","version":1},"kind":"http","method":"GET","orig":"/v2/status","segments":[{"lit":"v2"},{"lit":"status"}],"select":{"exist":["uuid"]},"transform":{"req":"`reqdata`","res":"`body.session`"},"index$":0}],"key$":"load"}},"relations":{"ancestors":[]},"key$":"player_data","name__orig":"player_data","Name":"PlayerData","name_":"player_data","name-":"player-data","NAME":"PLAYER_DATA","index$":4}, {"active":true,"entity":"player_data","key$":"BasicPlayerDataFlow","kind":"basic","name":"BasicPlayerDataFlow","param":{},"step":[{"active":true,"data":{},"input":{},"match":{},"op":"list","spec":[],"valid":[{"apply":"ItemExists","def":{"ref":"player_data_ref01"}}],"index$":0},{"active":true,"data":{},"input":{"ref":"player_data_ref01","srcdatavar":"player_data_ref01_data","suffix":"_dt0"},"match":{},"op":"load","spec":[],"valid":[{"apply":"TextFieldMark","def":{"mark":"Mark01-player_data_ref01"}}],"index$":1}]}, 'PlayerData')
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select

    let player_data_ref01_data = Object.values(setup.data.existing.player_data)[0] as any

    // LIST
    const player_data_ref01_ent = client.PlayerData()
    const player_data_ref01_match: any = {}

    const player_data_ref01_list = (await player_data_ref01_ent.list(player_data_ref01_match)).map((e: any) => e.data())


    // LOAD
    const player_data_ref01_match_dt0: any = {}
    const player_data_ref01_data_dt0 = (await player_data_ref01_ent.load(player_data_ref01_match_dt0)).data()
    assert(null != player_data_ref01_data_dt0)


  })
})



function basicSetup(extra?: any) {
  // TODO: fix test def options
  const options: any = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname, 
      '../../../../.sdk/test/entity/player_data/PlayerDataTestData.json')

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
    ['player_data01','player_data02','player_data03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'HYPIXEL_TEST_PLAYER_DATA_ENTID': idmap,
    'HYPIXEL_TEST_LIVE': 'FALSE',
    'HYPIXEL_TEST_EXPLAIN': 'FALSE',
    'HYPIXEL_APIKEY': '',
  })

  idmap = env['HYPIXEL_TEST_PLAYER_DATA_ENTID']

  const live = 'TRUE' === env.HYPIXEL_TEST_LIVE

  const transport = createLiveTransport()
  if (live) {
    const rawIds = process.env['HYPIXEL_TEST_PLAYER_DATA_ENTID']
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
  
