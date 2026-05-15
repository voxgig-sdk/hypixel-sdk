package core

var UtilityRegistrar func(u *Utility)

var NewBaseFeatureFunc func() Feature

var NewTestFeatureFunc func() Feature

var NewGuildEntityFunc func(client *HypixelSDK, entopts map[string]any) HypixelEntity

var NewHousEntityFunc func(client *HypixelSDK, entopts map[string]any) HypixelEntity

var NewHousingEntityFunc func(client *HypixelSDK, entopts map[string]any) HypixelEntity

var NewOtherEntityFunc func(client *HypixelSDK, entopts map[string]any) HypixelEntity

var NewPlayerEntityFunc func(client *HypixelSDK, entopts map[string]any) HypixelEntity

var NewPlayerDataEntityFunc func(client *HypixelSDK, entopts map[string]any) HypixelEntity

var NewResourceEntityFunc func(client *HypixelSDK, entopts map[string]any) HypixelEntity

var NewSkyBlockEntityFunc func(client *HypixelSDK, entopts map[string]any) HypixelEntity

