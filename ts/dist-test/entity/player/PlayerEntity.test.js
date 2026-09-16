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
(0, node_test_1.describe)('PlayerEntity', async () => {
    // Per-test live pacing. Delay is read from sdk-test-control.json's
    // `test.live.delayMs`; only sleeps when HYPIXEL_TEST_LIVE=TRUE.
    (0, node_test_1.afterEach)((0, utility_1.liveDelay)('HYPIXEL_TEST_LIVE'));
    (0, node_test_1.test)('instance', async () => {
        const testsdk = __1.HypixelSDK.test();
        const ent = testsdk.Player();
        (0, node_assert_1.default)(null != ent);
    });
    (0, node_test_1.test)('basic', async (t) => {
        const live = 'TRUE' === process.env.HYPIXEL_TEST_LIVE;
        for (const op of ['load']) {
            if (!live && (0, utility_1.maybeSkipControl)(t, 'entityOp', 'player.' + op, live))
                return;
        }
        const setup = basicSetup();
        if (setup.live) {
            return (0, live_entity_1.runLiveEntity)(setup, { "active": true, "alias": { "field": {} }, "fields": [{ "active": true, "name": "displayname", "req": false, "type": "`$STRING`", "index$": 0 }, { "active": true, "format": "int64", "name": "firstLogin", "req": false, "short": "Unix timestamp in milliseconds", "type": "`$INTEGER`", "index$": 1 }, { "active": true, "format": "int64", "name": "lastLogin", "req": false, "short": "Unix timestamp in milliseconds", "type": "`$INTEGER`", "index$": 2 }, { "active": true, "format": "int64", "name": "lastLogout", "req": false, "short": "Unix timestamp in milliseconds", "type": "`$INTEGER`", "index$": 3 }, { "active": true, "name": "monthlyPackageRank", "req": false, "type": "`$STRING`", "index$": 4 }, { "active": true, "name": "newPackageRank", "req": false, "type": "`$STRING`", "index$": 5 }, { "active": true, "name": "packageRank", "req": false, "type": "`$STRING`", "index$": 6 }, { "active": true, "name": "rank", "req": false, "type": "`$STRING`", "index$": 7 }, { "active": true, "name": "stats", "req": false, "short": "Game statistics organized by game type database name", "type": "`$OBJECT`", "index$": 8 }, { "active": true, "name": "uuid", "req": false, "type": "`$STRING`", "index$": 9 }], "name": "player", "op": { "load": { "input": "data", "name": "load", "points": [{ "active": true, "args": { "query": [{ "active": true, "kind": "query", "name": "uuid", "orig": "uuid", "reqd": true, "type": "`$STRING`", "index$": 0 }] }, "contract": { "id": "GET /v2/player", "json": "{\"operationId\":\"getPlayer\",\"parameters\":[{\"description\":\"Player UUID (supports both dashed and undashed versions)\",\"in\":\"query\",\"name\":\"uuid\",\"required\":true,\"schema\":{\"type\":\"string\"}}],\"protocol\":\"http\",\"responses\":{\"200\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"player\":{\"properties\":{\"displayname\":{\"type\":\"string\"},\"firstLogin\":{\"description\":\"Unix timestamp in milliseconds\",\"format\":\"int64\",\"type\":\"integer\"},\"lastLogin\":{\"description\":\"Unix timestamp in milliseconds\",\"format\":\"int64\",\"type\":\"integer\"},\"lastLogout\":{\"description\":\"Unix timestamp in milliseconds\",\"format\":\"int64\",\"type\":\"integer\"},\"monthlyPackageRank\":{\"enum\":[\"SUPERSTAR\"],\"type\":\"string\"},\"newPackageRank\":{\"enum\":[\"MVP_PLUS\",\"MVP\",\"VIP_PLUS\",\"VIP\"],\"type\":\"string\"},\"packageRank\":{\"enum\":[\"MVP_PLUS\",\"MVP\",\"VIP_PLUS\",\"VIP\"],\"type\":\"string\"},\"rank\":{\"enum\":[\"ADMIN\",\"MODERATOR\",\"HELPER\"],\"type\":\"string\"},\"stats\":{\"description\":\"Game statistics organized by game type database name\",\"type\":\"object\"},\"uuid\":{\"type\":\"string\"}},\"type\":\"object\"},\"success\":{\"type\":\"boolean\"}},\"type\":\"object\"}}},\"description\":\"Get player's data\",\"headers\":{\"RateLimit-Limit\":{\"description\":\"The limit of requests per minute for the provided API key\",\"schema\":{\"type\":\"integer\"}},\"RateLimit-Remaining\":{\"description\":\"The remaining amount of requests allowed for the current minute\",\"schema\":{\"type\":\"integer\"}},\"RateLimit-Reset\":{\"description\":\"The amount of seconds until the next minute and the reset of the API key usages\",\"schema\":{\"type\":\"integer\"}}}},\"400\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"cause\":{\"description\":\"Error message describing what went wrong\",\"type\":\"string\"},\"success\":{\"example\":false,\"type\":\"boolean\"}},\"type\":\"object\"}}},\"description\":\"Some data is missing, this is usually a field.\"},\"403\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"cause\":{\"description\":\"Error message describing what went wrong\",\"type\":\"string\"},\"success\":{\"example\":false,\"type\":\"boolean\"}},\"type\":\"object\"}}},\"description\":\"Access is forbidden, usually due to an invalid API key being used.\"},\"429\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"cause\":{\"description\":\"Error message describing what went wrong\",\"type\":\"string\"},\"success\":{\"example\":false,\"type\":\"boolean\"}},\"type\":\"object\"}}},\"description\":\"A request limit has been reached, usually this is due to the limit on the key being reached but can also be triggered by a global throttle.\"}},\"security\":[{\"ApiKey\":[]}],\"securitySchemes\":{\"ApiKey\":{\"description\":\"Obtained via the Hypixel Developer Dashboard when creating an application. You can also request higher limits for production applications in this dashboard.\",\"in\":\"header\",\"name\":\"API-Key\",\"type\":\"apiKey\"}},\"securitySource\":\"operation\"}", "source": "openapi3", "version": 1 }, "kind": "http", "method": "GET", "orig": "/v2/player", "segments": [{ "lit": "v2" }, { "lit": "player" }], "select": { "exist": ["uuid"] }, "transform": { "req": "`reqdata`", "res": "`body.player`" }, "index$": 0 }], "key$": "load" } }, "relations": { "ancestors": [] }, "key$": "player", "name__orig": "player", "Name": "Player", "name_": "player", "name-": "player", "NAME": "PLAYER", "index$": 3 }, { "active": true, "entity": "player", "key$": "BasicPlayerFlow", "kind": "basic", "name": "BasicPlayerFlow", "param": {}, "step": [{ "active": true, "data": {}, "input": { "ref": "player_ref01", "srcdatavar": "player_ref01_data", "suffix": "_dt0" }, "match": {}, "op": "load", "spec": [], "valid": [{ "apply": "TextFieldMark", "def": { "mark": "Mark01-player_ref01" } }], "index$": 0 }] }, 'Player');
        }
        const client = setup.client;
        const struct = setup.struct;
        const isempty = struct.isempty;
        const select = struct.select;
        let player_ref01_data = Object.values(setup.data.existing.player)[0];
        // LOAD
        const player_ref01_ent = client.Player();
        const player_ref01_match_dt0 = {};
        const player_ref01_data_dt0 = (await player_ref01_ent.load(player_ref01_match_dt0)).data();
        (0, node_assert_1.default)(null != player_ref01_data_dt0);
    });
});
function basicSetup(extra) {
    // TODO: fix test def options
    const options = {}; // null
    // TODO: needs test utility to resolve path
    const entityDataFile = node_path_1.default.resolve(__dirname, '../../../../.sdk/test/entity/player/PlayerTestData.json');
    // TODO: file ready util needed?
    const entityDataSource = Fs.readFileSync(entityDataFile).toString('utf8');
    // TODO: need a xlang JSON parse utility in voxgig/struct with better error msgs
    const entityData = JSON.parse(entityDataSource);
    options.entity = entityData.existing;
    let client = __1.HypixelSDK.test(options, extra);
    const struct = client.utility().struct;
    const merge = struct.merge;
    const transform = struct.transform;
    let idmap = transform(['player01', 'player02', 'player03'], {
        '`$PACK`': ['', {
                '`$KEY`': '`$COPY`',
                '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
            }]
    });
    const env = (0, utility_1.envOverride)({
        'HYPIXEL_TEST_PLAYER_ENTID': idmap,
        'HYPIXEL_TEST_LIVE': 'FALSE',
        'HYPIXEL_TEST_EXPLAIN': 'FALSE',
        'HYPIXEL_APIKEY': '',
    });
    idmap = env['HYPIXEL_TEST_PLAYER_ENTID'];
    const live = 'TRUE' === env.HYPIXEL_TEST_LIVE;
    const transport = (0, live_runner_1.createLiveTransport)();
    if (live) {
        const rawIds = process.env['HYPIXEL_TEST_PLAYER_ENTID'];
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
//# sourceMappingURL=PlayerEntity.test.js.map