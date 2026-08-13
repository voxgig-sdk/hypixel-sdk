// Typed models for the Hypixel SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.
package entity

import (
	"encoding/json"

	"github.com/voxgig-sdk/hypixel-sdk/go/core"
)

// Guild is the typed data model for the guild entity.
type Guild struct {
}

// GuildLoadMatch is the typed request payload for Guild.LoadTyped.
type GuildLoadMatch struct {
}

// Housing is the typed data model for the housing entity.
type Housing struct {
	Houses *[]any `json:"houses,omitempty"`
	Success *bool `json:"success,omitempty"`
}

// HousingLoadMatch is the typed request payload for Housing.LoadTyped.
type HousingLoadMatch struct {
	Houses *[]any `json:"houses,omitempty"`
	Success *bool `json:"success,omitempty"`
}

// HousingListMatch is the typed request payload for Housing.ListTyped.
type HousingListMatch struct {
	Houses *[]any `json:"houses,omitempty"`
	Success *bool `json:"success,omitempty"`
}

// Other is the typed data model for the other entity.
type Other struct {
	BoosterState *map[string]any `json:"boosterState,omitempty"`
	Boosters *[]any `json:"boosters,omitempty"`
	StaffRollingDaily *int `json:"staff_rollingDaily,omitempty"`
	StaffTotal *int `json:"staff_total,omitempty"`
	Success *bool `json:"success,omitempty"`
	WatchdogLastMinute *int `json:"watchdog_lastMinute,omitempty"`
	WatchdogRollingDaily *int `json:"watchdog_rollingDaily,omitempty"`
	WatchdogTotal *int `json:"watchdog_total,omitempty"`
}

// OtherLoadMatch is the typed request payload for Other.LoadTyped.
type OtherLoadMatch struct {
	BoosterState *map[string]any `json:"boosterState,omitempty"`
	Boosters *[]any `json:"boosters,omitempty"`
	StaffRollingDaily *int `json:"staff_rollingDaily,omitempty"`
	StaffTotal *int `json:"staff_total,omitempty"`
	Success *bool `json:"success,omitempty"`
	WatchdogLastMinute *int `json:"watchdog_lastMinute,omitempty"`
	WatchdogRollingDaily *int `json:"watchdog_rollingDaily,omitempty"`
	WatchdogTotal *int `json:"watchdog_total,omitempty"`
}

// OtherListMatch is the typed request payload for Other.ListTyped.
type OtherListMatch struct {
	BoosterState *map[string]any `json:"boosterState,omitempty"`
	Boosters *[]any `json:"boosters,omitempty"`
	StaffRollingDaily *int `json:"staff_rollingDaily,omitempty"`
	StaffTotal *int `json:"staff_total,omitempty"`
	Success *bool `json:"success,omitempty"`
	WatchdogLastMinute *int `json:"watchdog_lastMinute,omitempty"`
	WatchdogRollingDaily *int `json:"watchdog_rollingDaily,omitempty"`
	WatchdogTotal *int `json:"watchdog_total,omitempty"`
}

// Player is the typed data model for the player entity.
type Player struct {
	Displayname *string `json:"displayname,omitempty"`
	FirstLogin *int `json:"firstLogin,omitempty"`
	LastLogin *int `json:"lastLogin,omitempty"`
	LastLogout *int `json:"lastLogout,omitempty"`
	MonthlyPackageRank *string `json:"monthlyPackageRank,omitempty"`
	NewPackageRank *string `json:"newPackageRank,omitempty"`
	PackageRank *string `json:"packageRank,omitempty"`
	Rank *string `json:"rank,omitempty"`
	Stats *map[string]any `json:"stats,omitempty"`
	Uuid *string `json:"uuid,omitempty"`
}

// PlayerLoadMatch is the typed request payload for Player.LoadTyped.
type PlayerLoadMatch struct {
	Displayname *string `json:"displayname,omitempty"`
	FirstLogin *int `json:"firstLogin,omitempty"`
	LastLogin *int `json:"lastLogin,omitempty"`
	LastLogout *int `json:"lastLogout,omitempty"`
	MonthlyPackageRank *string `json:"monthlyPackageRank,omitempty"`
	NewPackageRank *string `json:"newPackageRank,omitempty"`
	PackageRank *string `json:"packageRank,omitempty"`
	Rank *string `json:"rank,omitempty"`
	Stats *map[string]any `json:"stats,omitempty"`
	Uuid *string `json:"uuid,omitempty"`
}

// PlayerData is the typed data model for the player_data entity.
type PlayerData struct {
	Date *int `json:"date,omitempty"`
	Ended *int `json:"ended,omitempty"`
	GameType *string `json:"gameType,omitempty"`
	Map *string `json:"map,omitempty"`
	Mode *string `json:"mode,omitempty"`
	Online *bool `json:"online,omitempty"`
}

// PlayerDataLoadMatch is the typed request payload for PlayerData.LoadTyped.
type PlayerDataLoadMatch struct {
	Date *int `json:"date,omitempty"`
	Ended *int `json:"ended,omitempty"`
	GameType *string `json:"gameType,omitempty"`
	Map *string `json:"map,omitempty"`
	Mode *string `json:"mode,omitempty"`
	Online *bool `json:"online,omitempty"`
}

// PlayerDataListMatch is the typed request payload for PlayerData.ListTyped.
type PlayerDataListMatch struct {
	Date *int `json:"date,omitempty"`
	Ended *int `json:"ended,omitempty"`
	GameType *string `json:"gameType,omitempty"`
	Map *string `json:"map,omitempty"`
	Mode *string `json:"mode,omitempty"`
	Online *bool `json:"online,omitempty"`
}

// Resource is the typed data model for the resource entity.
type Resource struct {
	DatabaseName *string `json:"databaseName,omitempty"`
	Id *int `json:"id,omitempty"`
	LastUpdated *int `json:"lastUpdated,omitempty"`
	ModeNames *map[string]any `json:"modeNames,omitempty"`
	Name *string `json:"name,omitempty"`
	OneTime *map[string]any `json:"one_time,omitempty"`
	Rarities *map[string]any `json:"rarities,omitempty"`
	Success *bool `json:"success,omitempty"`
	Tiered *map[string]any `json:"tiered,omitempty"`
	Types *map[string]any `json:"types,omitempty"`
}

// ResourceLoadMatch is the typed request payload for Resource.LoadTyped.
type ResourceLoadMatch struct {
	DatabaseName *string `json:"databaseName,omitempty"`
	Id int `json:"id"`
	LastUpdated *int `json:"lastUpdated,omitempty"`
	ModeNames *map[string]any `json:"modeNames,omitempty"`
	Name *string `json:"name,omitempty"`
	OneTime *map[string]any `json:"one_time,omitempty"`
	Rarities *map[string]any `json:"rarities,omitempty"`
	Success *bool `json:"success,omitempty"`
	Tiered *map[string]any `json:"tiered,omitempty"`
	Types *map[string]any `json:"types,omitempty"`
}

// SkyBlock is the typed data model for the sky_block entity.
type SkyBlock struct {
	Auctioneer *string `json:"auctioneer,omitempty"`
	Auctions *[]any `json:"auctions,omitempty"`
	Bids *[]any `json:"bids,omitempty"`
	Category *string `json:"category,omitempty"`
	Claimed *bool `json:"claimed,omitempty"`
	ClaimedBidders *[]any `json:"claimed_bidders,omitempty"`
	Color *string `json:"color,omitempty"`
	Coop *[]any `json:"coop,omitempty"`
	Current *map[string]any `json:"current,omitempty"`
	End *int `json:"end,omitempty"`
	Events *[]any `json:"events,omitempty"`
	Extra *string `json:"extra,omitempty"`
	FullLore *[]any `json:"fullLore,omitempty"`
	HighestBidAmount *int `json:"highest_bid_amount,omitempty"`
	Id *string `json:"id,omitempty"`
	Item *map[string]any `json:"item,omitempty"`
	ItemBytes *map[string]any `json:"item_bytes,omitempty"`
	ItemLore *string `json:"item_lore,omitempty"`
	ItemName *string `json:"item_name,omitempty"`
	LastUpdated *int `json:"lastUpdated,omitempty"`
	Link *string `json:"link,omitempty"`
	Lore *string `json:"lore,omitempty"`
	Material *string `json:"material,omitempty"`
	Mayor *map[string]any `json:"mayor,omitempty"`
	Name *string `json:"name,omitempty"`
	NpcSellPrice *float64 `json:"npc_sell_price,omitempty"`
	Page *int `json:"page,omitempty"`
	ProfileId *string `json:"profile_id,omitempty"`
	Profiles *[]any `json:"profiles,omitempty"`
	Progress *int `json:"progress,omitempty"`
	RequiredAmount *int `json:"requiredAmount,omitempty"`
	Sales *[]any `json:"sales,omitempty"`
	Start *int `json:"start,omitempty"`
	StartingBid *int `json:"starting_bid,omitempty"`
	Stats *map[string]any `json:"stats,omitempty"`
	Success *bool `json:"success,omitempty"`
	Text *string `json:"text,omitempty"`
	Tier *string `json:"tier,omitempty"`
	Tiers *[]any `json:"tiers,omitempty"`
	Title *string `json:"title,omitempty"`
	TotalAuctions *int `json:"totalAuctions,omitempty"`
	TotalPages *int `json:"totalPages,omitempty"`
	Uuid *string `json:"uuid,omitempty"`
}

// SkyBlockLoadMatch is the typed request payload for SkyBlock.LoadTyped.
type SkyBlockLoadMatch struct {
	Auctioneer *string `json:"auctioneer,omitempty"`
	Auctions *[]any `json:"auctions,omitempty"`
	Bids *[]any `json:"bids,omitempty"`
	Category *string `json:"category,omitempty"`
	Claimed *bool `json:"claimed,omitempty"`
	ClaimedBidders *[]any `json:"claimed_bidders,omitempty"`
	Color *string `json:"color,omitempty"`
	Coop *[]any `json:"coop,omitempty"`
	Current *map[string]any `json:"current,omitempty"`
	End *int `json:"end,omitempty"`
	Events *[]any `json:"events,omitempty"`
	Extra *string `json:"extra,omitempty"`
	FullLore *[]any `json:"fullLore,omitempty"`
	HighestBidAmount *int `json:"highest_bid_amount,omitempty"`
	Id string `json:"id"`
	Item *map[string]any `json:"item,omitempty"`
	ItemBytes *map[string]any `json:"item_bytes,omitempty"`
	ItemLore *string `json:"item_lore,omitempty"`
	ItemName *string `json:"item_name,omitempty"`
	LastUpdated *int `json:"lastUpdated,omitempty"`
	Link *string `json:"link,omitempty"`
	Lore *string `json:"lore,omitempty"`
	Material *string `json:"material,omitempty"`
	Mayor *map[string]any `json:"mayor,omitempty"`
	Name *string `json:"name,omitempty"`
	NpcSellPrice *float64 `json:"npc_sell_price,omitempty"`
	Page *int `json:"page,omitempty"`
	ProfileId *string `json:"profile_id,omitempty"`
	Profiles *[]any `json:"profiles,omitempty"`
	Progress *int `json:"progress,omitempty"`
	RequiredAmount *int `json:"requiredAmount,omitempty"`
	Sales *[]any `json:"sales,omitempty"`
	Start *int `json:"start,omitempty"`
	StartingBid *int `json:"starting_bid,omitempty"`
	Stats *map[string]any `json:"stats,omitempty"`
	Success *bool `json:"success,omitempty"`
	Text *string `json:"text,omitempty"`
	Tier *string `json:"tier,omitempty"`
	Tiers *[]any `json:"tiers,omitempty"`
	Title *string `json:"title,omitempty"`
	TotalAuctions *int `json:"totalAuctions,omitempty"`
	TotalPages *int `json:"totalPages,omitempty"`
	Uuid *string `json:"uuid,omitempty"`
}

// SkyBlockListMatch is the typed request payload for SkyBlock.ListTyped.
type SkyBlockListMatch struct {
	Auctioneer *string `json:"auctioneer,omitempty"`
	Auctions *[]any `json:"auctions,omitempty"`
	Bids *[]any `json:"bids,omitempty"`
	Category *string `json:"category,omitempty"`
	Claimed *bool `json:"claimed,omitempty"`
	ClaimedBidders *[]any `json:"claimed_bidders,omitempty"`
	Color *string `json:"color,omitempty"`
	Coop *[]any `json:"coop,omitempty"`
	Current *map[string]any `json:"current,omitempty"`
	End *int `json:"end,omitempty"`
	Events *[]any `json:"events,omitempty"`
	Extra *string `json:"extra,omitempty"`
	FullLore *[]any `json:"fullLore,omitempty"`
	HighestBidAmount *int `json:"highest_bid_amount,omitempty"`
	Id *string `json:"id,omitempty"`
	Item *map[string]any `json:"item,omitempty"`
	ItemBytes *map[string]any `json:"item_bytes,omitempty"`
	ItemLore *string `json:"item_lore,omitempty"`
	ItemName *string `json:"item_name,omitempty"`
	LastUpdated *int `json:"lastUpdated,omitempty"`
	Link *string `json:"link,omitempty"`
	Lore *string `json:"lore,omitempty"`
	Material *string `json:"material,omitempty"`
	Mayor *map[string]any `json:"mayor,omitempty"`
	Name *string `json:"name,omitempty"`
	NpcSellPrice *float64 `json:"npc_sell_price,omitempty"`
	Page *int `json:"page,omitempty"`
	ProfileId *string `json:"profile_id,omitempty"`
	Profiles *[]any `json:"profiles,omitempty"`
	Progress *int `json:"progress,omitempty"`
	RequiredAmount *int `json:"requiredAmount,omitempty"`
	Sales *[]any `json:"sales,omitempty"`
	Start *int `json:"start,omitempty"`
	StartingBid *int `json:"starting_bid,omitempty"`
	Stats *map[string]any `json:"stats,omitempty"`
	Success *bool `json:"success,omitempty"`
	Text *string `json:"text,omitempty"`
	Tier *string `json:"tier,omitempty"`
	Tiers *[]any `json:"tiers,omitempty"`
	Title *string `json:"title,omitempty"`
	TotalAuctions *int `json:"totalAuctions,omitempty"`
	TotalPages *int `json:"totalPages,omitempty"`
	Uuid *string `json:"uuid,omitempty"`
}

// asMap turns a typed request/data struct into the map[string]any the
// runtime op pipeline consumes, honouring the json tags above.
func asMap(v any) map[string]any {
	out := map[string]any{}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}

// entityData unwraps an entity to its data map.
//
// Operations resolve to the ENTITY, not the raw data (see AGENTS.md), and an
// entity's fields are UNEXPORTED — marshalling one directly yields `{}`, so
// every typed accessor would silently hand back a zero-valued struct. The
// typed boundary therefore takes the data hop first.
func entityData(v any) any {
	if ent, ok := v.(core.Entity); ok {
		return ent.Data()
	}
	return v
}

// typedFrom decodes a runtime value (an entity, or the map[string]any the op
// pipeline produced) into a typed model T via a JSON round-trip. On any error
// it returns the zero value of T; the op's own (value, error) tuple carries
// the real error.
func typedFrom[T any](v any) T {
	var out T
	v = entityData(v)
	if v == nil {
		return out
	}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}

// typedSliceFrom decodes a runtime list value into a typed slice []T via a
// JSON round-trip, for list ops. `list` resolves to a slice of ENTITY
// instances, so each element takes the data hop.
func typedSliceFrom[T any](v any) []T {
	var out []T
	if v == nil {
		return out
	}
	if list, ok := v.([]any); ok {
		unwrapped := make([]any, 0, len(list))
		for _, item := range list {
			unwrapped = append(unwrapped, entityData(item))
		}
		v = unwrapped
	}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}
