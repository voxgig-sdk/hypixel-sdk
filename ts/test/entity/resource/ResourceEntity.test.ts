

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


describe('ResourceEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when HYPIXEL_TEST_LIVE=TRUE.
  afterEach(liveDelay('HYPIXEL_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = HypixelSDK.test()
    const ent = testsdk.Resource()
    assert(null != ent)
  })


  test('basic', async (t) => {

    const live = 'TRUE' === process.env.HYPIXEL_TEST_LIVE
    for (const op of ['load']) {
      if (!live && maybeSkipControl(t, 'entityOp', 'resource.' + op, live)) return
    }

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":[{"active":true,"format":"int64","name":"lastUpdated","req":false,"type":"`$INTEGER`","index$":0},{"active":true,"name":"one_time","req":false,"type":"`$OBJECT`","index$":1},{"active":true,"name":"rarities","req":false,"type":"`$OBJECT`","index$":2},{"active":true,"name":"success","req":false,"type":"`$BOOLEAN`","index$":3},{"active":true,"name":"tiered","req":false,"type":"`$OBJECT`","index$":4},{"active":true,"name":"types","req":false,"type":"`$OBJECT`","index$":5}],"name":"resource","op":{"load":{"input":"data","name":"load","points":[{"active":true,"args":{},"contract":{"id":"GET /v2/resources/achievements","json":"{\"operationId\":\"getAchievements\",\"parameters\":[],\"protocol\":\"http\",\"responses\":{\"200\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"achievements\":{\"type\":\"object\"},\"lastUpdated\":{\"format\":\"int64\",\"type\":\"integer\"},\"success\":{\"type\":\"boolean\"}},\"type\":\"object\"}}},\"description\":\"A successful response\"}},\"security\":[{\"ApiKey\":[]}],\"securitySchemes\":{\"ApiKey\":{\"description\":\"Obtained via the Hypixel Developer Dashboard when creating an application. You can also request higher limits for production applications in this dashboard.\",\"in\":\"header\",\"name\":\"API-Key\",\"type\":\"apiKey\"}},\"securitySource\":\"definition\"}","source":"openapi3","version":1},"kind":"http","method":"GET","orig":"/v2/resources/achievements","segments":[{"lit":"v2"},{"lit":"resources"},{"lit":"achievements"}],"select":{"$action":"achievement"},"transform":{"req":"`reqdata`","res":"`body.achievements`"},"index$":0},{"active":true,"args":{},"contract":{"id":"GET /v2/resources/challenges","json":"{\"operationId\":\"getChallenges\",\"parameters\":[],\"protocol\":\"http\",\"responses\":{\"200\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"challenges\":{\"type\":\"object\"},\"lastUpdated\":{\"format\":\"int64\",\"type\":\"integer\"},\"success\":{\"type\":\"boolean\"}},\"type\":\"object\"}}},\"description\":\"A successful response\"}},\"security\":[{\"ApiKey\":[]}],\"securitySchemes\":{\"ApiKey\":{\"description\":\"Obtained via the Hypixel Developer Dashboard when creating an application. You can also request higher limits for production applications in this dashboard.\",\"in\":\"header\",\"name\":\"API-Key\",\"type\":\"apiKey\"}},\"securitySource\":\"definition\"}","source":"openapi3","version":1},"kind":"http","method":"GET","orig":"/v2/resources/challenges","segments":[{"lit":"v2"},{"lit":"resources"},{"lit":"challenges"}],"select":{"$action":"challenge"},"transform":{"req":"`reqdata`","res":"`body.challenges`"},"index$":1},{"active":true,"args":{},"contract":{"id":"GET /v2/resources/games","json":"{\"operationId\":\"getGames\",\"parameters\":[],\"protocol\":\"http\",\"responses\":{\"200\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"games\":{\"additionalProperties\":{\"properties\":{\"databaseName\":{\"type\":\"string\"},\"id\":{\"type\":\"integer\"},\"modeNames\":{\"additionalProperties\":{\"type\":\"string\"},\"type\":\"object\"},\"name\":{\"type\":\"string\"}},\"type\":\"object\"},\"type\":\"object\"},\"lastUpdated\":{\"format\":\"int64\",\"type\":\"integer\"},\"success\":{\"type\":\"boolean\"}},\"type\":\"object\"}}},\"description\":\"A successful response\"}},\"security\":[{\"ApiKey\":[]}],\"securitySchemes\":{\"ApiKey\":{\"description\":\"Obtained via the Hypixel Developer Dashboard when creating an application. You can also request higher limits for production applications in this dashboard.\",\"in\":\"header\",\"name\":\"API-Key\",\"type\":\"apiKey\"}},\"securitySource\":\"definition\"}","source":"openapi3","version":1},"kind":"http","method":"GET","orig":"/v2/resources/games","segments":[{"lit":"v2"},{"lit":"resources"},{"lit":"games"}],"select":{"$action":"game"},"transform":{"req":"`reqdata`","res":"`body.games`"},"index$":2},{"active":true,"args":{},"contract":{"id":"GET /v2/resources/guilds/achievements","json":"{\"operationId\":\"getGuildAchievements\",\"parameters\":[],\"protocol\":\"http\",\"responses\":{\"200\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"lastUpdated\":{\"format\":\"int64\",\"type\":\"integer\"},\"one_time\":{\"type\":\"object\"},\"success\":{\"type\":\"boolean\"},\"tiered\":{\"type\":\"object\"}},\"type\":\"object\"}}},\"description\":\"A successful response\"}},\"security\":[{\"ApiKey\":[]}],\"securitySchemes\":{\"ApiKey\":{\"description\":\"Obtained via the Hypixel Developer Dashboard when creating an application. You can also request higher limits for production applications in this dashboard.\",\"in\":\"header\",\"name\":\"API-Key\",\"type\":\"apiKey\"}},\"securitySource\":\"definition\"}","source":"openapi3","version":1},"kind":"http","method":"GET","orig":"/v2/resources/guilds/achievements","segments":[{"lit":"v2"},{"lit":"resources"},{"lit":"guilds"},{"lit":"achievements"}],"select":{},"transform":{"req":"`reqdata`","res":"`body`"},"index$":0},{"active":true,"args":{},"contract":{"id":"GET /v2/resources/quests","json":"{\"operationId\":\"getQuests\",\"parameters\":[],\"protocol\":\"http\",\"responses\":{\"200\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"lastUpdated\":{\"format\":\"int64\",\"type\":\"integer\"},\"quests\":{\"type\":\"object\"},\"success\":{\"type\":\"boolean\"}},\"type\":\"object\"}}},\"description\":\"A successful response\"}},\"security\":[{\"ApiKey\":[]}],\"securitySchemes\":{\"ApiKey\":{\"description\":\"Obtained via the Hypixel Developer Dashboard when creating an application. You can also request higher limits for production applications in this dashboard.\",\"in\":\"header\",\"name\":\"API-Key\",\"type\":\"apiKey\"}},\"securitySource\":\"definition\"}","source":"openapi3","version":1},"kind":"http","method":"GET","orig":"/v2/resources/quests","segments":[{"lit":"v2"},{"lit":"resources"},{"lit":"quests"}],"select":{"$action":"quest"},"transform":{"req":"`reqdata`","res":"`body.quests`"},"index$":4},{"active":true,"args":{},"contract":{"id":"GET /v2/resources/vanity/companions","json":"{\"operationId\":\"getVanityCompanions\",\"parameters\":[],\"protocol\":\"http\",\"responses\":{\"200\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"lastUpdated\":{\"format\":\"int64\",\"type\":\"integer\"},\"rarities\":{\"type\":\"object\"},\"success\":{\"type\":\"boolean\"},\"types\":{\"type\":\"object\"}},\"type\":\"object\"}}},\"description\":\"A successful response\"}},\"security\":[{\"ApiKey\":[]}],\"securitySchemes\":{\"ApiKey\":{\"description\":\"Obtained via the Hypixel Developer Dashboard when creating an application. You can also request higher limits for production applications in this dashboard.\",\"in\":\"header\",\"name\":\"API-Key\",\"type\":\"apiKey\"}},\"securitySource\":\"definition\"}","source":"openapi3","version":1},"kind":"http","method":"GET","orig":"/v2/resources/vanity/companions","segments":[{"lit":"v2"},{"lit":"resources"},{"lit":"vanity"},{"lit":"companions"}],"select":{},"transform":{"req":"`reqdata`","res":"`body`"},"index$":5},{"active":true,"args":{},"contract":{"id":"GET /v2/resources/vanity/pets","json":"{\"operationId\":\"getVanityPets\",\"parameters\":[],\"protocol\":\"http\",\"responses\":{\"200\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"lastUpdated\":{\"format\":\"int64\",\"type\":\"integer\"},\"rarities\":{\"type\":\"object\"},\"success\":{\"type\":\"boolean\"},\"types\":{\"type\":\"object\"}},\"type\":\"object\"}}},\"description\":\"A successful response\"}},\"security\":[{\"ApiKey\":[]}],\"securitySchemes\":{\"ApiKey\":{\"description\":\"Obtained via the Hypixel Developer Dashboard when creating an application. You can also request higher limits for production applications in this dashboard.\",\"in\":\"header\",\"name\":\"API-Key\",\"type\":\"apiKey\"}},\"securitySource\":\"definition\"}","source":"openapi3","version":1},"kind":"http","method":"GET","orig":"/v2/resources/vanity/pets","segments":[{"lit":"v2"},{"lit":"resources"},{"lit":"vanity"},{"lit":"pets"}],"select":{},"transform":{"req":"`reqdata`","res":"`body`"},"index$":6}],"key$":"load"}},"relations":{"ancestors":[]},"key$":"resource","name__orig":"resource","Name":"Resource","name_":"resource","name-":"resource","NAME":"RESOURCE","index$":5}, {"active":true,"entity":"resource","key$":"BasicResourceFlow","kind":"basic","name":"BasicResourceFlow","param":{},"step":[{"active":true,"data":{},"input":{"ref":"resource_ref01","srcdatavar":"resource_ref01_data","suffix":"_dt0"},"match":{},"op":"load","spec":[],"valid":[{"apply":"TextFieldMark","def":{"mark":"Mark01-resource_ref01"}}],"index$":0}]}, 'Resource')
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select

    let resource_ref01_data = Object.values(setup.data.existing.resource)[0] as any

    // LOAD
    const resource_ref01_ent = client.Resource()
    const resource_ref01_match_dt0: any = {}
    const resource_ref01_data_dt0 = (await resource_ref01_ent.load(resource_ref01_match_dt0)).data()
    assert(null != resource_ref01_data_dt0)


  })
})



function basicSetup(extra?: any) {
  // TODO: fix test def options
  const options: any = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname, 
      '../../../../.sdk/test/entity/resource/ResourceTestData.json')

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
    ['resource01','resource02','resource03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'HYPIXEL_TEST_RESOURCE_ENTID': idmap,
    'HYPIXEL_TEST_LIVE': 'FALSE',
    'HYPIXEL_TEST_EXPLAIN': 'FALSE',
    'HYPIXEL_APIKEY': '',
  })

  idmap = env['HYPIXEL_TEST_RESOURCE_ENTID']

  const live = 'TRUE' === env.HYPIXEL_TEST_LIVE

  const transport = createLiveTransport()
  if (live) {
    const rawIds = process.env['HYPIXEL_TEST_RESOURCE_ENTID']
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
  
