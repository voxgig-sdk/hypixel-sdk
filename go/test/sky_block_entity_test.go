package sdktest

import (
	"encoding/json"
	"os"
	"path/filepath"
	"runtime"
	"strings"
	"testing"
	"time"

	sdk "github.com/voxgig-sdk/hypixel-sdk/go"
	"github.com/voxgig-sdk/hypixel-sdk/go/core"

	vs "github.com/voxgig-sdk/hypixel-sdk/go/utility/struct"
)

func TestSkyBlockEntity(t *testing.T) {
	t.Run("instance", func(t *testing.T) {
		testsdk := sdk.TestSDK(nil, nil)
		ent := testsdk.SkyBlock(nil)
		if ent == nil {
			t.Fatal("expected non-nil SkyBlockEntity")
		}
	})

	t.Run("basic", func(t *testing.T) {
		setup := sky_blockBasicSetup(nil)
		// Per-op sdk-test-control.json skip — basic test exercises a flow
		// with multiple ops; skipping any op skips the whole flow.
		_mode := "unit"
		if setup.live {
			_mode = "live"
		}
		for _, _op := range []string{"list", "load"} {
			if _shouldSkip, _reason := isControlSkipped("entityOp", "sky_block." + _op, _mode); _shouldSkip {
				if _reason == "" {
					_reason = "skipped via sdk-test-control.json"
				}
				t.Skip(_reason)
				return
			}
		}
		// The basic flow consumes synthetic IDs from the fixture. In live mode
		// without an *_ENTID env override, those IDs hit the live API and 4xx.
		if setup.syntheticOnly {
			t.Skip("live entity test uses synthetic IDs from fixture — set HYPIXEL_TEST_SKY_BLOCK_ENTID JSON to run live")
			return
		}
		client := setup.client

		// Bootstrap entity data from existing test data (no create step in flow).
		skyBlockRef01DataRaw := vs.Items(core.ToMapAny(vs.GetPath("existing.sky_block", setup.data)))
		var skyBlockRef01Data map[string]any
		if len(skyBlockRef01DataRaw) > 0 {
			skyBlockRef01Data = core.ToMapAny(skyBlockRef01DataRaw[0][1])
		}
		// Discard guards against Go's unused-var check when the flow's steps
		// happen not to consume the bootstrap data (e.g. list-only flows).
		_ = skyBlockRef01Data

		// LIST
		skyBlockRef01Ent := client.SkyBlock(nil)
		skyBlockRef01Match := map[string]any{}

		skyBlockRef01ListResult, err := skyBlockRef01Ent.List(skyBlockRef01Match, nil)
		if err != nil {
			t.Fatalf("list failed: %v", err)
		}
		_, skyBlockRef01ListOk := skyBlockRef01ListResult.([]any)
		if !skyBlockRef01ListOk {
			t.Fatalf("expected list result to be an array, got %T", skyBlockRef01ListResult)
		}

		// LOAD
		skyBlockRef01MatchDt0 := map[string]any{
			"id": skyBlockRef01Data["id"],
		}
		skyBlockRef01DataDt0Loaded, err := skyBlockRef01Ent.Load(skyBlockRef01MatchDt0, nil)
		if err != nil {
			t.Fatalf("load failed: %v", err)
		}
		skyBlockRef01DataDt0LoadResult := core.ToMapAny(skyBlockRef01DataDt0Loaded)
		if skyBlockRef01DataDt0LoadResult == nil {
			t.Fatal("expected load result to be a map")
		}
		if skyBlockRef01DataDt0LoadResult["id"] != skyBlockRef01Data["id"] {
			t.Fatal("expected load result id to match")
		}

	})
}

func sky_blockBasicSetup(extra map[string]any) *entityTestSetup {
	loadEnvLocal()

	_, filename, _, _ := runtime.Caller(0)
	dir := filepath.Dir(filename)

	entityDataFile := filepath.Join(dir, "..", "..", ".sdk", "test", "entity", "sky_block", "SkyBlockTestData.json")

	entityDataSource, err := os.ReadFile(entityDataFile)
	if err != nil {
		panic("failed to read sky_block test data: " + err.Error())
	}

	var entityData map[string]any
	if err := json.Unmarshal(entityDataSource, &entityData); err != nil {
		panic("failed to parse sky_block test data: " + err.Error())
	}

	options := map[string]any{}
	options["entity"] = entityData["existing"]

	client := sdk.TestSDK(options, extra)

	// Generate idmap via transform, matching TS pattern.
	idmap := vs.Transform(
		[]any{"sky_block01", "sky_block02", "sky_block03"},
		map[string]any{
			"`$PACK`": []any{"", map[string]any{
				"`$KEY`": "`$COPY`",
				"`$VAL`": []any{"`$FORMAT`", "upper", "`$COPY`"},
			}},
		},
	)

	// Detect ENTID env override before envOverride consumes it. When live
	// mode is on without a real override, the basic test runs against synthetic
	// IDs from the fixture and 4xx's. Surface this so the test can skip.
	entidEnvRaw := os.Getenv("HYPIXEL_TEST_SKY_BLOCK_ENTID")
	idmapOverridden := entidEnvRaw != "" && strings.HasPrefix(strings.TrimSpace(entidEnvRaw), "{")

	env := envOverride(map[string]any{
		"HYPIXEL_TEST_SKY_BLOCK_ENTID": idmap,
		"HYPIXEL_TEST_LIVE":      "FALSE",
		"HYPIXEL_TEST_EXPLAIN":   "FALSE",
	})

	idmapResolved := core.ToMapAny(env["HYPIXEL_TEST_SKY_BLOCK_ENTID"])
	if idmapResolved == nil {
		idmapResolved = core.ToMapAny(idmap)
	}

	if env["HYPIXEL_TEST_LIVE"] == "TRUE" {
		mergedOpts := vs.Merge([]any{
			map[string]any{
			},
			extra,
		})
		client = sdk.NewHypixelSDK(core.ToMapAny(mergedOpts))
	}

	live := env["HYPIXEL_TEST_LIVE"] == "TRUE"
	return &entityTestSetup{
		client:        client,
		data:          entityData,
		idmap:         idmapResolved,
		env:           env,
		explain:       env["HYPIXEL_TEST_EXPLAIN"] == "TRUE",
		live:          live,
		syntheticOnly: live && !idmapOverridden,
		now:           time.Now().UnixMilli(),
	}
}
