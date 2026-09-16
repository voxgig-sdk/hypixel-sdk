"use strict";
var __createBinding = (this && this.__createBinding) || (Object.create ? (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    var desc = Object.getOwnPropertyDescriptor(m, k);
    if (!desc || ("get" in desc ? !m.__esModule : desc.writable || desc.configurable)) {
      desc = { enumerable: true, get: function() { return m[k]; } };
    }
    Object.defineProperty(o, k2, desc);
}) : (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    o[k2] = m[k];
}));
var __setModuleDefault = (this && this.__setModuleDefault) || (Object.create ? (function(o, v) {
    Object.defineProperty(o, "default", { enumerable: true, value: v });
}) : function(o, v) {
    o["default"] = v;
});
var __importStar = (this && this.__importStar) || (function () {
    var ownKeys = function(o) {
        ownKeys = Object.getOwnPropertyNames || function (o) {
            var ar = [];
            for (var k in o) if (Object.prototype.hasOwnProperty.call(o, k)) ar[ar.length] = k;
            return ar;
        };
        return ownKeys(o);
    };
    return function (mod) {
        if (mod && mod.__esModule) return mod;
        var result = {};
        if (mod != null) for (var k = ownKeys(mod), i = 0; i < k.length; i++) if (k[i] !== "default") __createBinding(result, mod, k[i]);
        __setModuleDefault(result, mod);
        return result;
    };
})();
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const node_path_1 = __importDefault(require("node:path"));
const Fs = __importStar(require("node:fs"));
const node_test_1 = require("node:test");
const node_assert_1 = __importDefault(require("node:assert"));
const live_runner_1 = require("../../live-runner");
const live_entity_1 = require("../../live-entity");
const __1 = require("../../..");
const utility_1 = require("../../utility");
// AFTER the imports on purpose: TypeScript hoists `import` above any
// statement in the emitted CommonJS, so a loader placed above them would
// run only after every imported module had already been evaluated - and
// anything reading process.env at module scope would miss these values.
(0, utility_1.loadEnvLocal)(__dirname + '/../../../.env.local');
(0, node_test_1.describe)('ResourceEntity', async () => {
    // Per-test live pacing. Delay is read from sdk-test-control.json's
    // `test.live.delayMs`; only sleeps when HYPIXEL_TEST_LIVE=TRUE.
    (0, node_test_1.afterEach)((0, utility_1.liveDelay)('HYPIXEL_TEST_LIVE'));
    (0, node_test_1.test)('instance', async () => {
        const testsdk = __1.HypixelSDK.test();
        const ent = testsdk.Resource();
        (0, node_assert_1.default)(null != ent);
    });
    (0, node_test_1.test)('basic', async (t) => {
        const live = 'TRUE' === process.env.HYPIXEL_TEST_LIVE;
        for (const op of ['load']) {
            if (!live && (0, utility_1.maybeSkipControl)(t, 'entityOp', 'resource.' + op, live))
                return;
        }
        const setup = basicSetup();
        if (setup.live) {
            return (0, live_entity_1.runLiveEntity)(setup, { "active": true, "alias": { "field": {} }, "fields": [{ "active": true, "name": "databaseName", "req": false, "type": "`$STRING`", "index$": 0 }, { "active": true, "name": "id", "req": false, "type": "`$INTEGER`", "index$": 1 }, { "active": true, "format": "int64", "name": "lastUpdated", "req": false, "type": "`$INTEGER`", "index$": 2 }, { "active": true, "name": "modeNames", "req": false, "type": "`$OBJECT`", "index$": 3 }, { "active": true, "name": "name", "req": false, "type": "`$STRING`", "index$": 4 }, { "active": true, "name": "one_time", "req": false, "type": "`$OBJECT`", "index$": 5 }, { "active": true, "name": "rarities", "req": false, "type": "`$OBJECT`", "index$": 6 }, { "active": true, "name": "success", "req": false, "type": "`$BOOLEAN`", "index$": 7 }, { "active": true, "name": "tiered", "req": false, "type": "`$OBJECT`", "index$": 8 }, { "active": true, "name": "types", "req": false, "type": "`$OBJECT`", "index$": 9 }], "id": { "field": "id", "name": "id" }, "name": "resource", "op": { "load": { "input": "data", "name": "load", "points": [{ "active": true, "args": {}, "contract": { "id": "GET /v2/resources/achievements", "json": "{\"operationId\":\"getAchievements\",\"parameters\":[],\"protocol\":\"http\",\"responses\":{\"200\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"achievements\":{\"type\":\"object\"},\"lastUpdated\":{\"format\":\"int64\",\"type\":\"integer\"},\"success\":{\"type\":\"boolean\"}},\"type\":\"object\"}}},\"description\":\"A successful response\"}},\"security\":[{\"ApiKey\":[]}],\"securitySchemes\":{\"ApiKey\":{\"description\":\"Obtained via the Hypixel Developer Dashboard when creating an application. You can also request higher limits for production applications in this dashboard.\",\"in\":\"header\",\"name\":\"API-Key\",\"type\":\"apiKey\"}},\"securitySource\":\"definition\"}", "source": "openapi3", "version": 1 }, "kind": "http", "method": "GET", "orig": "/v2/resources/achievements", "segments": [{ "lit": "v2" }, { "lit": "resources" }, { "lit": "achievements" }], "select": { "$action": "achievement" }, "transform": { "req": "`reqdata`", "res": "`body.achievements`" }, "index$": 0 }, { "active": true, "args": {}, "contract": { "id": "GET /v2/resources/challenges", "json": "{\"operationId\":\"getChallenges\",\"parameters\":[],\"protocol\":\"http\",\"responses\":{\"200\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"challenges\":{\"type\":\"object\"},\"lastUpdated\":{\"format\":\"int64\",\"type\":\"integer\"},\"success\":{\"type\":\"boolean\"}},\"type\":\"object\"}}},\"description\":\"A successful response\"}},\"security\":[{\"ApiKey\":[]}],\"securitySchemes\":{\"ApiKey\":{\"description\":\"Obtained via the Hypixel Developer Dashboard when creating an application. You can also request higher limits for production applications in this dashboard.\",\"in\":\"header\",\"name\":\"API-Key\",\"type\":\"apiKey\"}},\"securitySource\":\"definition\"}", "source": "openapi3", "version": 1 }, "kind": "http", "method": "GET", "orig": "/v2/resources/challenges", "segments": [{ "lit": "v2" }, { "lit": "resources" }, { "lit": "challenges" }], "select": { "$action": "challenge" }, "transform": { "req": "`reqdata`", "res": "`body.challenges`" }, "index$": 1 }, { "active": true, "args": {}, "contract": { "id": "GET /v2/resources/games", "json": "{\"operationId\":\"getGames\",\"parameters\":[],\"protocol\":\"http\",\"responses\":{\"200\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"games\":{\"additionalProperties\":{\"properties\":{\"databaseName\":{\"type\":\"string\"},\"id\":{\"type\":\"integer\"},\"modeNames\":{\"additionalProperties\":{\"type\":\"string\"},\"type\":\"object\"},\"name\":{\"type\":\"string\"}},\"type\":\"object\"},\"type\":\"object\"},\"lastUpdated\":{\"format\":\"int64\",\"type\":\"integer\"},\"success\":{\"type\":\"boolean\"}},\"type\":\"object\"}}},\"description\":\"A successful response\"}},\"security\":[{\"ApiKey\":[]}],\"securitySchemes\":{\"ApiKey\":{\"description\":\"Obtained via the Hypixel Developer Dashboard when creating an application. You can also request higher limits for production applications in this dashboard.\",\"in\":\"header\",\"name\":\"API-Key\",\"type\":\"apiKey\"}},\"securitySource\":\"definition\"}", "source": "openapi3", "version": 1 }, "kind": "http", "method": "GET", "orig": "/v2/resources/games", "segments": [{ "lit": "v2" }, { "lit": "resources" }, { "lit": "games" }], "select": { "$action": "game" }, "transform": { "req": "`reqdata`", "res": "`body.games`" }, "index$": 2 }, { "active": true, "args": {}, "contract": { "id": "GET /v2/resources/guilds/achievements", "json": "{\"operationId\":\"getGuildAchievements\",\"parameters\":[],\"protocol\":\"http\",\"responses\":{\"200\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"lastUpdated\":{\"format\":\"int64\",\"type\":\"integer\"},\"one_time\":{\"type\":\"object\"},\"success\":{\"type\":\"boolean\"},\"tiered\":{\"type\":\"object\"}},\"type\":\"object\"}}},\"description\":\"A successful response\"}},\"security\":[{\"ApiKey\":[]}],\"securitySchemes\":{\"ApiKey\":{\"description\":\"Obtained via the Hypixel Developer Dashboard when creating an application. You can also request higher limits for production applications in this dashboard.\",\"in\":\"header\",\"name\":\"API-Key\",\"type\":\"apiKey\"}},\"securitySource\":\"definition\"}", "source": "openapi3", "version": 1 }, "kind": "http", "method": "GET", "orig": "/v2/resources/guilds/achievements", "segments": [{ "lit": "v2" }, { "lit": "resources" }, { "lit": "guilds" }, { "lit": "achievements" }], "select": {}, "transform": { "req": "`reqdata`", "res": "`body`" }, "index$": 0 }, { "active": true, "args": {}, "contract": { "id": "GET /v2/resources/quests", "json": "{\"operationId\":\"getQuests\",\"parameters\":[],\"protocol\":\"http\",\"responses\":{\"200\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"lastUpdated\":{\"format\":\"int64\",\"type\":\"integer\"},\"quests\":{\"type\":\"object\"},\"success\":{\"type\":\"boolean\"}},\"type\":\"object\"}}},\"description\":\"A successful response\"}},\"security\":[{\"ApiKey\":[]}],\"securitySchemes\":{\"ApiKey\":{\"description\":\"Obtained via the Hypixel Developer Dashboard when creating an application. You can also request higher limits for production applications in this dashboard.\",\"in\":\"header\",\"name\":\"API-Key\",\"type\":\"apiKey\"}},\"securitySource\":\"definition\"}", "source": "openapi3", "version": 1 }, "kind": "http", "method": "GET", "orig": "/v2/resources/quests", "segments": [{ "lit": "v2" }, { "lit": "resources" }, { "lit": "quests" }], "select": { "$action": "quest" }, "transform": { "req": "`reqdata`", "res": "`body.quests`" }, "index$": 4 }, { "active": true, "args": {}, "contract": { "id": "GET /v2/resources/vanity/companions", "json": "{\"operationId\":\"getVanityCompanions\",\"parameters\":[],\"protocol\":\"http\",\"responses\":{\"200\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"lastUpdated\":{\"format\":\"int64\",\"type\":\"integer\"},\"rarities\":{\"type\":\"object\"},\"success\":{\"type\":\"boolean\"},\"types\":{\"type\":\"object\"}},\"type\":\"object\"}}},\"description\":\"A successful response\"}},\"security\":[{\"ApiKey\":[]}],\"securitySchemes\":{\"ApiKey\":{\"description\":\"Obtained via the Hypixel Developer Dashboard when creating an application. You can also request higher limits for production applications in this dashboard.\",\"in\":\"header\",\"name\":\"API-Key\",\"type\":\"apiKey\"}},\"securitySource\":\"definition\"}", "source": "openapi3", "version": 1 }, "kind": "http", "method": "GET", "orig": "/v2/resources/vanity/companions", "segments": [{ "lit": "v2" }, { "lit": "resources" }, { "lit": "vanity" }, { "lit": "companions" }], "select": {}, "transform": { "req": "`reqdata`", "res": "`body`" }, "index$": 5 }, { "active": true, "args": {}, "contract": { "id": "GET /v2/resources/vanity/pets", "json": "{\"operationId\":\"getVanityPets\",\"parameters\":[],\"protocol\":\"http\",\"responses\":{\"200\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"lastUpdated\":{\"format\":\"int64\",\"type\":\"integer\"},\"rarities\":{\"type\":\"object\"},\"success\":{\"type\":\"boolean\"},\"types\":{\"type\":\"object\"}},\"type\":\"object\"}}},\"description\":\"A successful response\"}},\"security\":[{\"ApiKey\":[]}],\"securitySchemes\":{\"ApiKey\":{\"description\":\"Obtained via the Hypixel Developer Dashboard when creating an application. You can also request higher limits for production applications in this dashboard.\",\"in\":\"header\",\"name\":\"API-Key\",\"type\":\"apiKey\"}},\"securitySource\":\"definition\"}", "source": "openapi3", "version": 1 }, "kind": "http", "method": "GET", "orig": "/v2/resources/vanity/pets", "segments": [{ "lit": "v2" }, { "lit": "resources" }, { "lit": "vanity" }, { "lit": "pets" }], "select": {}, "transform": { "req": "`reqdata`", "res": "`body`" }, "index$": 6 }], "key$": "load" } }, "relations": { "ancestors": [] }, "key$": "resource", "name__orig": "resource", "Name": "Resource", "name_": "resource", "name-": "resource", "NAME": "RESOURCE", "index$": 5 }, { "active": true, "entity": "resource", "key$": "BasicResourceFlow", "kind": "basic", "name": "BasicResourceFlow", "param": {}, "step": [{ "active": true, "data": {}, "input": { "ref": "resource_ref01", "srcdatavar": "resource_ref01_data", "suffix": "_dt0" }, "match": {}, "op": "load", "spec": [], "valid": [{ "apply": "TextFieldMark", "def": { "mark": "Mark01-resource_ref01" } }], "index$": 0 }] }, 'Resource');
        }
        const client = setup.client;
        const struct = setup.struct;
        const isempty = struct.isempty;
        const select = struct.select;
        let resource_ref01_data = Object.values(setup.data.existing.resource)[0];
        // LOAD
        const resource_ref01_ent = client.Resource();
        const resource_ref01_match_dt0 = {};
        resource_ref01_match_dt0.id = resource_ref01_data.id;
        const resource_ref01_data_dt0 = (await resource_ref01_ent.load(resource_ref01_match_dt0)).data();
        (0, node_assert_1.default)(resource_ref01_data_dt0.id === resource_ref01_data.id);
    });
});
function basicSetup(extra) {
    // TODO: fix test def options
    const options = {}; // null
    // TODO: needs test utility to resolve path
    const entityDataFile = node_path_1.default.resolve(__dirname, '../../../../.sdk/test/entity/resource/ResourceTestData.json');
    // TODO: file ready util needed?
    const entityDataSource = Fs.readFileSync(entityDataFile).toString('utf8');
    // TODO: need a xlang JSON parse utility in voxgig/struct with better error msgs
    const entityData = JSON.parse(entityDataSource);
    options.entity = entityData.existing;
    let client = __1.HypixelSDK.test(options, extra);
    const struct = client.utility().struct;
    const merge = struct.merge;
    const transform = struct.transform;
    let idmap = transform(['resource01', 'resource02', 'resource03'], {
        '`$PACK`': ['', {
                '`$KEY`': '`$COPY`',
                '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
            }]
    });
    const env = (0, utility_1.envOverride)({
        'HYPIXEL_TEST_RESOURCE_ENTID': idmap,
        'HYPIXEL_TEST_LIVE': 'FALSE',
        'HYPIXEL_TEST_EXPLAIN': 'FALSE',
        'HYPIXEL_APIKEY': '',
    });
    idmap = env['HYPIXEL_TEST_RESOURCE_ENTID'];
    const live = 'TRUE' === env.HYPIXEL_TEST_LIVE;
    const transport = (0, live_runner_1.createLiveTransport)();
    if (live) {
        const rawIds = process.env['HYPIXEL_TEST_RESOURCE_ENTID'];
        idmap = rawIds && rawIds.trim() ? JSON.parse(rawIds) : {};
        if (!idmap || Array.isArray(idmap) || typeof idmap !== 'object') {
            throw new Error('Live ENTID must be a JSON object');
        }
        client = new __1.HypixelSDK(merge([
            // FIRST, so the generated fields below win: sdk-test-control.json's
            // test.client.options adds to the live client, it does not redirect it.
            (0, utility_1.liveClientOptions)(),
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
        ]));
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
    };
    return setup;
}
//# sourceMappingURL=ResourceEntity.test.js.map