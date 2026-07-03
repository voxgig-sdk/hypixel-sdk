package voxgighypixelsdk

import (
	"github.com/voxgig-sdk/hypixel-sdk/go/core"
	"github.com/voxgig-sdk/hypixel-sdk/go/entity"
	"github.com/voxgig-sdk/hypixel-sdk/go/feature"
	_ "github.com/voxgig-sdk/hypixel-sdk/go/utility"
)

// Type aliases preserve external API.
type HypixelSDK = core.HypixelSDK
type Context = core.Context
type Utility = core.Utility
type Feature = core.Feature
type Entity = core.Entity
type HypixelEntity = core.HypixelEntity
type FetcherFunc = core.FetcherFunc
type Spec = core.Spec
type Result = core.Result
type Response = core.Response
type Operation = core.Operation
type Control = core.Control
type HypixelError = core.HypixelError

// BaseFeature from feature package.
type BaseFeature = feature.BaseFeature

func init() {
	core.NewBaseFeatureFunc = func() core.Feature {
		return feature.NewBaseFeature()
	}
	core.NewTestFeatureFunc = func() core.Feature {
		return feature.NewTestFeature()
	}
	core.NewGuildEntityFunc = func(client *core.HypixelSDK, entopts map[string]any) core.HypixelEntity {
		return entity.NewGuildEntity(client, entopts)
	}
	core.NewHousingEntityFunc = func(client *core.HypixelSDK, entopts map[string]any) core.HypixelEntity {
		return entity.NewHousingEntity(client, entopts)
	}
	core.NewOtherEntityFunc = func(client *core.HypixelSDK, entopts map[string]any) core.HypixelEntity {
		return entity.NewOtherEntity(client, entopts)
	}
	core.NewPlayerEntityFunc = func(client *core.HypixelSDK, entopts map[string]any) core.HypixelEntity {
		return entity.NewPlayerEntity(client, entopts)
	}
	core.NewPlayerDataEntityFunc = func(client *core.HypixelSDK, entopts map[string]any) core.HypixelEntity {
		return entity.NewPlayerDataEntity(client, entopts)
	}
	core.NewResourceEntityFunc = func(client *core.HypixelSDK, entopts map[string]any) core.HypixelEntity {
		return entity.NewResourceEntity(client, entopts)
	}
	core.NewSkyBlockEntityFunc = func(client *core.HypixelSDK, entopts map[string]any) core.HypixelEntity {
		return entity.NewSkyBlockEntity(client, entopts)
	}
}

// Constructor re-exports.
var NewHypixelSDK = core.NewHypixelSDK
var TestSDK = core.TestSDK
var NewContext = core.NewContext
var NewSpec = core.NewSpec
var NewResult = core.NewResult
var NewResponse = core.NewResponse
var NewOperation = core.NewOperation
var MakeConfig = core.MakeConfig

// No-arg convenience constructors. Go has no default-argument syntax,
// so these aliases let callers write `sdk.New()` / `sdk.Test()`
// instead of `sdk.NewHypixelSDK(nil)` / `sdk.TestSDK(nil, nil)`
// for the common no-options case.
func New() *HypixelSDK  { return NewHypixelSDK(nil) }
func Test() *HypixelSDK { return TestSDK(nil, nil) }
var NewBaseFeature = feature.NewBaseFeature
var NewTestFeature = feature.NewTestFeature
