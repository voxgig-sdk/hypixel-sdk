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
(0, node_test_1.describe)('PlayerDataEntity', async () => {
    // Per-test live pacing. Delay is read from sdk-test-control.json's
    // `test.live.delayMs`; only sleeps when HYPIXEL_TEST_LIVE=TRUE.
    (0, node_test_1.afterEach)((0, utility_1.liveDelay)('HYPIXEL_TEST_LIVE'));
    (0, node_test_1.test)('instance', async () => {
        const testsdk = __1.HypixelSDK.test();
        const ent = testsdk.PlayerData();
        (0, node_assert_1.default)(null != ent);
    });
    (0, node_test_1.test)('basic', async (t) => {
        const live = 'TRUE' === process.env.HYPIXEL_TEST_LIVE;
        for (const op of ['list', 'load']) {
            if (!live && (0, utility_1.maybeSkipControl)(t, 'entityOp', 'player_data.' + op, live))
                return;
        }
        const setup = basicSetup();
        if (setup.live) {
            return (0, live_entity_1.runLiveEntity)(setup, { "active": true, "alias": { "field": {} }, "fields": [{ "active": true, "format": "int64", "name": "date", "req": false, "type": "`$INTEGER`", "index$": 0 }, { "active": true, "format": "int64", "name": "ended", "req": false, "type": "`$INTEGER`", "index$": 1 }, { "active": true, "name": "gameType", "req": false, "type": "`$STRING`", "index$": 2 }, { "active": true, "name": "map", "req": false, "type": "`$STRING`", "index$": 3 }, { "active": true, "name": "mode", "req": false, "type": "`$STRING`", "index$": 4 }, { "active": true, "name": "online", "req": false, "type": "`$BOOLEAN`", "index$": 5 }], "name": "player_data", "op": { "list": { "input": "data", "name": "list", "points": [{ "active": true, "args": { "query": [{ "active": true, "kind": "query", "name": "uuid", "orig": "uuid", "reqd": true, "type": "`$STRING`", "index$": 0 }] }, "contract": { "id": "GET /v2/recentgames", "json": "{\"operationId\":\"getRecentGames\",\"parameters\":[{\"description\":\"Player UUID (supports both dashed and undashed versions)\",\"in\":\"query\",\"name\":\"uuid\",\"required\":true,\"schema\":{\"type\":\"string\"}}],\"protocol\":\"http\",\"responses\":{\"200\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"games\":{\"items\":{\"properties\":{\"date\":{\"format\":\"int64\",\"type\":\"integer\"},\"ended\":{\"format\":\"int64\",\"type\":\"integer\"},\"gameType\":{\"type\":\"string\"},\"map\":{\"type\":\"string\"},\"mode\":{\"type\":\"string\"}},\"type\":\"object\"},\"type\":\"array\"},\"success\":{\"type\":\"boolean\"},\"uuid\":{\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Get player's recent game\"},\"400\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"cause\":{\"description\":\"Error message describing what went wrong\",\"type\":\"string\"},\"success\":{\"example\":false,\"type\":\"boolean\"}},\"type\":\"object\"}}},\"description\":\"Some data is missing, this is usually a field.\"},\"403\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"cause\":{\"description\":\"Error message describing what went wrong\",\"type\":\"string\"},\"success\":{\"example\":false,\"type\":\"boolean\"}},\"type\":\"object\"}}},\"description\":\"Access is forbidden, usually due to an invalid API key being used.\"},\"422\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"cause\":{\"description\":\"Error message describing what went wrong\",\"type\":\"string\"},\"success\":{\"example\":false,\"type\":\"boolean\"}},\"type\":\"object\"}}},\"description\":\"Some data provided is invalid.\"},\"429\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"cause\":{\"description\":\"Error message describing what went wrong\",\"type\":\"string\"},\"success\":{\"example\":false,\"type\":\"boolean\"}},\"type\":\"object\"}}},\"description\":\"A request limit has been reached, usually this is due to the limit on the key being reached but can also be triggered by a global throttle.\"}},\"security\":[{\"ApiKey\":[]}],\"securitySchemes\":{\"ApiKey\":{\"description\":\"Obtained via the Hypixel Developer Dashboard when creating an application. You can also request higher limits for production applications in this dashboard.\",\"in\":\"header\",\"name\":\"API-Key\",\"type\":\"apiKey\"}},\"securitySource\":\"operation\"}", "source": "openapi3", "version": 1 }, "kind": "http", "method": "GET", "orig": "/v2/recentgames", "segments": [{ "lit": "v2" }, { "lit": "recentgames" }], "select": { "exist": ["uuid"] }, "transform": { "req": "`reqdata`", "res": "`body.games`" }, "index$": 0 }], "key$": "list" }, "load": { "input": "data", "name": "load", "points": [{ "active": true, "args": { "query": [{ "active": true, "kind": "query", "name": "uuid", "orig": "uuid", "reqd": true, "type": "`$STRING`", "index$": 0 }] }, "contract": { "id": "GET /v2/status", "json": "{\"operationId\":\"getPlayerStatus\",\"parameters\":[{\"description\":\"Player UUID (supports both dashed and undashed versions)\",\"in\":\"query\",\"name\":\"uuid\",\"required\":true,\"schema\":{\"type\":\"string\"}}],\"protocol\":\"http\",\"responses\":{\"200\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"session\":{\"properties\":{\"gameType\":{\"type\":\"string\"},\"map\":{\"type\":\"string\"},\"mode\":{\"type\":\"string\"},\"online\":{\"type\":\"boolean\"}},\"type\":\"object\"},\"success\":{\"type\":\"boolean\"},\"uuid\":{\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Get player status\"},\"400\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"cause\":{\"description\":\"Error message describing what went wrong\",\"type\":\"string\"},\"success\":{\"example\":false,\"type\":\"boolean\"}},\"type\":\"object\"}}},\"description\":\"Some data is missing, this is usually a field.\"},\"403\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"cause\":{\"description\":\"Error message describing what went wrong\",\"type\":\"string\"},\"success\":{\"example\":false,\"type\":\"boolean\"}},\"type\":\"object\"}}},\"description\":\"Access is forbidden, usually due to an invalid API key being used.\"},\"429\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"cause\":{\"description\":\"Error message describing what went wrong\",\"type\":\"string\"},\"success\":{\"example\":false,\"type\":\"boolean\"}},\"type\":\"object\"}}},\"description\":\"A request limit has been reached, usually this is due to the limit on the key being reached but can also be triggered by a global throttle.\"}},\"security\":[{\"ApiKey\":[]}],\"securitySchemes\":{\"ApiKey\":{\"description\":\"Obtained via the Hypixel Developer Dashboard when creating an application. You can also request higher limits for production applications in this dashboard.\",\"in\":\"header\",\"name\":\"API-Key\",\"type\":\"apiKey\"}},\"securitySource\":\"operation\"}", "source": "openapi3", "version": 1 }, "kind": "http", "method": "GET", "orig": "/v2/status", "segments": [{ "lit": "v2" }, { "lit": "status" }], "select": { "exist": ["uuid"] }, "transform": { "req": "`reqdata`", "res": "`body.session`" }, "index$": 0 }], "key$": "load" } }, "relations": { "ancestors": [] }, "key$": "player_data", "name__orig": "player_data", "Name": "PlayerData", "name_": "player_data", "name-": "player-data", "NAME": "PLAYER_DATA", "index$": 4 }, { "active": true, "entity": "player_data", "key$": "BasicPlayerDataFlow", "kind": "basic", "name": "BasicPlayerDataFlow", "param": {}, "step": [{ "active": true, "data": {}, "input": {}, "match": {}, "op": "list", "spec": [], "valid": [{ "apply": "ItemExists", "def": { "ref": "player_data_ref01" } }], "index$": 0 }, { "active": true, "data": {}, "input": { "ref": "player_data_ref01", "srcdatavar": "player_data_ref01_data", "suffix": "_dt0" }, "match": {}, "op": "load", "spec": [], "valid": [{ "apply": "TextFieldMark", "def": { "mark": "Mark01-player_data_ref01" } }], "index$": 1 }] }, 'PlayerData');
        }
        const client = setup.client;
        const struct = setup.struct;
        const isempty = struct.isempty;
        const select = struct.select;
        let player_data_ref01_data = Object.values(setup.data.existing.player_data)[0];
        // LIST
        const player_data_ref01_ent = client.PlayerData();
        const player_data_ref01_match = {};
        const player_data_ref01_list = (await player_data_ref01_ent.list(player_data_ref01_match)).map((e) => e.data());
        // LOAD
        const player_data_ref01_match_dt0 = {};
        const player_data_ref01_data_dt0 = (await player_data_ref01_ent.load(player_data_ref01_match_dt0)).data();
        (0, node_assert_1.default)(null != player_data_ref01_data_dt0);
    });
});
function basicSetup(extra) {
    // TODO: fix test def options
    const options = {}; // null
    // TODO: needs test utility to resolve path
    const entityDataFile = node_path_1.default.resolve(__dirname, '../../../../.sdk/test/entity/player_data/PlayerDataTestData.json');
    // TODO: file ready util needed?
    const entityDataSource = Fs.readFileSync(entityDataFile).toString('utf8');
    // TODO: need a xlang JSON parse utility in voxgig/struct with better error msgs
    const entityData = JSON.parse(entityDataSource);
    options.entity = entityData.existing;
    let client = __1.HypixelSDK.test(options, extra);
    const struct = client.utility().struct;
    const merge = struct.merge;
    const transform = struct.transform;
    let idmap = transform(['player_data01', 'player_data02', 'player_data03'], {
        '`$PACK`': ['', {
                '`$KEY`': '`$COPY`',
                '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
            }]
    });
    const env = (0, utility_1.envOverride)({
        'HYPIXEL_TEST_PLAYER_DATA_ENTID': idmap,
        'HYPIXEL_TEST_LIVE': 'FALSE',
        'HYPIXEL_TEST_EXPLAIN': 'FALSE',
        'HYPIXEL_APIKEY': '',
    });
    idmap = env['HYPIXEL_TEST_PLAYER_DATA_ENTID'];
    const live = 'TRUE' === env.HYPIXEL_TEST_LIVE;
    const transport = (0, live_runner_1.createLiveTransport)();
    if (live) {
        const rawIds = process.env['HYPIXEL_TEST_PLAYER_DATA_ENTID'];
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
//# sourceMappingURL=PlayerDataEntity.test.js.map