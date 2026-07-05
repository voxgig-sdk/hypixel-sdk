// Typed models for the Hypixel SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.
package entity

import "encoding/json"

// Guild is the typed data model for the guild entity.
type Guild struct {
	Guild *map[string]any `json:"guild,omitempty"`
	Success *bool `json:"success,omitempty"`
}

// GuildLoadMatch is the typed request payload for Guild.LoadTyped.
type GuildLoadMatch struct {
	Guild *map[string]any `json:"guild,omitempty"`
	Success *bool `json:"success,omitempty"`
}

// Housing is the typed data model for the housing entity.
type Housing struct {
	House *map[string]any `json:"house,omitempty"`
	Success *bool `json:"success,omitempty"`
}

// HousingLoadMatch is the typed request payload for Housing.LoadTyped.
type HousingLoadMatch struct {
	House *map[string]any `json:"house,omitempty"`
	Success *bool `json:"success,omitempty"`
}

// HousingListMatch is the typed request payload for Housing.ListTyped.
type HousingListMatch struct {
	House *map[string]any `json:"house,omitempty"`
	Success *bool `json:"success,omitempty"`
}

// Other is the typed data model for the other entity.
type Other struct {
	Booster *[]any `json:"booster,omitempty"`
	BoosterState *map[string]any `json:"booster_state,omitempty"`
	Game *map[string]any `json:"game,omitempty"`
	Leaderboard *map[string]any `json:"leaderboard,omitempty"`
	PlayerCount *int `json:"player_count,omitempty"`
	StaffRollingDaily *int `json:"staff_rolling_daily,omitempty"`
	StaffTotal *int `json:"staff_total,omitempty"`
	Success *bool `json:"success,omitempty"`
	WatchdogLastMinute *int `json:"watchdog_last_minute,omitempty"`
	WatchdogRollingDaily *int `json:"watchdog_rolling_daily,omitempty"`
	WatchdogTotal *int `json:"watchdog_total,omitempty"`
}

// OtherLoadMatch is the typed request payload for Other.LoadTyped.
type OtherLoadMatch struct {
	Booster *[]any `json:"booster,omitempty"`
	BoosterState *map[string]any `json:"booster_state,omitempty"`
	Game *map[string]any `json:"game,omitempty"`
	Leaderboard *map[string]any `json:"leaderboard,omitempty"`
	PlayerCount *int `json:"player_count,omitempty"`
	StaffRollingDaily *int `json:"staff_rolling_daily,omitempty"`
	StaffTotal *int `json:"staff_total,omitempty"`
	Success *bool `json:"success,omitempty"`
	WatchdogLastMinute *int `json:"watchdog_last_minute,omitempty"`
	WatchdogRollingDaily *int `json:"watchdog_rolling_daily,omitempty"`
	WatchdogTotal *int `json:"watchdog_total,omitempty"`
}

// OtherListMatch is the typed request payload for Other.ListTyped.
type OtherListMatch struct {
	Booster *[]any `json:"booster,omitempty"`
	BoosterState *map[string]any `json:"booster_state,omitempty"`
	Game *map[string]any `json:"game,omitempty"`
	Leaderboard *map[string]any `json:"leaderboard,omitempty"`
	PlayerCount *int `json:"player_count,omitempty"`
	StaffRollingDaily *int `json:"staff_rolling_daily,omitempty"`
	StaffTotal *int `json:"staff_total,omitempty"`
	Success *bool `json:"success,omitempty"`
	WatchdogLastMinute *int `json:"watchdog_last_minute,omitempty"`
	WatchdogRollingDaily *int `json:"watchdog_rolling_daily,omitempty"`
	WatchdogTotal *int `json:"watchdog_total,omitempty"`
}

// Player is the typed data model for the player entity.
type Player struct {
	Player *map[string]any `json:"player,omitempty"`
	Success *bool `json:"success,omitempty"`
}

// PlayerLoadMatch is the typed request payload for Player.LoadTyped.
type PlayerLoadMatch struct {
	Player *map[string]any `json:"player,omitempty"`
	Success *bool `json:"success,omitempty"`
}

// PlayerData is the typed data model for the player_data entity.
type PlayerData struct {
	Date *int `json:"date,omitempty"`
	Ended *int `json:"ended,omitempty"`
	GameType *string `json:"game_type,omitempty"`
	Map *string `json:"map,omitempty"`
	Mode *string `json:"mode,omitempty"`
	Session *map[string]any `json:"session,omitempty"`
	Success *bool `json:"success,omitempty"`
	Uuid *string `json:"uuid,omitempty"`
}

// PlayerDataLoadMatch is the typed request payload for PlayerData.LoadTyped.
type PlayerDataLoadMatch struct {
	Date *int `json:"date,omitempty"`
	Ended *int `json:"ended,omitempty"`
	GameType *string `json:"game_type,omitempty"`
	Map *string `json:"map,omitempty"`
	Mode *string `json:"mode,omitempty"`
	Session *map[string]any `json:"session,omitempty"`
	Success *bool `json:"success,omitempty"`
	Uuid *string `json:"uuid,omitempty"`
}

// PlayerDataListMatch is the typed request payload for PlayerData.ListTyped.
type PlayerDataListMatch struct {
	Date *int `json:"date,omitempty"`
	Ended *int `json:"ended,omitempty"`
	GameType *string `json:"game_type,omitempty"`
	Map *string `json:"map,omitempty"`
	Mode *string `json:"mode,omitempty"`
	Session *map[string]any `json:"session,omitempty"`
	Success *bool `json:"success,omitempty"`
	Uuid *string `json:"uuid,omitempty"`
}

// Resource is the typed data model for the resource entity.
type Resource struct {
	Achievement *map[string]any `json:"achievement,omitempty"`
	Challenge *map[string]any `json:"challenge,omitempty"`
	Game *map[string]any `json:"game,omitempty"`
	LastUpdated *int `json:"last_updated,omitempty"`
	OneTime *map[string]any `json:"one_time,omitempty"`
	Quest *map[string]any `json:"quest,omitempty"`
	Rarity *map[string]any `json:"rarity,omitempty"`
	Success *bool `json:"success,omitempty"`
	Tiered *map[string]any `json:"tiered,omitempty"`
	Type *map[string]any `json:"type,omitempty"`
}

// ResourceLoadMatch is the typed request payload for Resource.LoadTyped.
type ResourceLoadMatch struct {
	Achievement *map[string]any `json:"achievement,omitempty"`
	Challenge *map[string]any `json:"challenge,omitempty"`
	Game *map[string]any `json:"game,omitempty"`
	LastUpdated *int `json:"last_updated,omitempty"`
	OneTime *map[string]any `json:"one_time,omitempty"`
	Quest *map[string]any `json:"quest,omitempty"`
	Rarity *map[string]any `json:"rarity,omitempty"`
	Success *bool `json:"success,omitempty"`
	Tiered *map[string]any `json:"tiered,omitempty"`
	Type *map[string]any `json:"type,omitempty"`
}

// SkyBlock is the typed data model for the sky_block entity.
type SkyBlock struct {
	Auction *[]any `json:"auction,omitempty"`
	Auctioneer *string `json:"auctioneer,omitempty"`
	Bid *[]any `json:"bid,omitempty"`
	Category *string `json:"category,omitempty"`
	Claimed *bool `json:"claimed,omitempty"`
	ClaimedBidder *[]any `json:"claimed_bidder,omitempty"`
	Collection *map[string]any `json:"collection,omitempty"`
	Color *string `json:"color,omitempty"`
	Coop *[]any `json:"coop,omitempty"`
	Current *map[string]any `json:"current,omitempty"`
	End *int `json:"end,omitempty"`
	Event *[]any `json:"event,omitempty"`
	Extra *string `json:"extra,omitempty"`
	FullLore *[]any `json:"full_lore,omitempty"`
	Garden *map[string]any `json:"garden,omitempty"`
	HighestBidAmount *int `json:"highest_bid_amount,omitempty"`
	Id *string `json:"id,omitempty"`
	Item *map[string]any `json:"item,omitempty"`
	ItemByte *map[string]any `json:"item_byte,omitempty"`
	ItemLore *string `json:"item_lore,omitempty"`
	ItemName *string `json:"item_name,omitempty"`
	LastUpdated *int `json:"last_updated,omitempty"`
	Link *string `json:"link,omitempty"`
	Lore *string `json:"lore,omitempty"`
	Material *string `json:"material,omitempty"`
	Mayor *map[string]any `json:"mayor,omitempty"`
	Member *map[string]any `json:"member,omitempty"`
	Name *string `json:"name,omitempty"`
	NpcSellPrice *float64 `json:"npc_sell_price,omitempty"`
	Page *int `json:"page,omitempty"`
	Product *map[string]any `json:"product,omitempty"`
	Profile *map[string]any `json:"profile,omitempty"`
	ProfileId *string `json:"profile_id,omitempty"`
	Progress *int `json:"progress,omitempty"`
	RequiredAmount *int `json:"required_amount,omitempty"`
	Sale *[]any `json:"sale,omitempty"`
	Skill *map[string]any `json:"skill,omitempty"`
	Start *int `json:"start,omitempty"`
	StartingBid *int `json:"starting_bid,omitempty"`
	Stat *map[string]any `json:"stat,omitempty"`
	Success *bool `json:"success,omitempty"`
	Text *string `json:"text,omitempty"`
	Tier *string `json:"tier,omitempty"`
	Title *string `json:"title,omitempty"`
	TotalAuction *int `json:"total_auction,omitempty"`
	TotalPage *int `json:"total_page,omitempty"`
	Uuid *string `json:"uuid,omitempty"`
	Version *string `json:"version,omitempty"`
}

// SkyBlockLoadMatch is the typed request payload for SkyBlock.LoadTyped.
type SkyBlockLoadMatch struct {
	Auction *[]any `json:"auction,omitempty"`
	Auctioneer *string `json:"auctioneer,omitempty"`
	Bid *[]any `json:"bid,omitempty"`
	Category *string `json:"category,omitempty"`
	Claimed *bool `json:"claimed,omitempty"`
	ClaimedBidder *[]any `json:"claimed_bidder,omitempty"`
	Collection *map[string]any `json:"collection,omitempty"`
	Color *string `json:"color,omitempty"`
	Coop *[]any `json:"coop,omitempty"`
	Current *map[string]any `json:"current,omitempty"`
	End *int `json:"end,omitempty"`
	Event *[]any `json:"event,omitempty"`
	Extra *string `json:"extra,omitempty"`
	FullLore *[]any `json:"full_lore,omitempty"`
	Garden *map[string]any `json:"garden,omitempty"`
	HighestBidAmount *int `json:"highest_bid_amount,omitempty"`
	Id string `json:"id"`
	Item *map[string]any `json:"item,omitempty"`
	ItemByte *map[string]any `json:"item_byte,omitempty"`
	ItemLore *string `json:"item_lore,omitempty"`
	ItemName *string `json:"item_name,omitempty"`
	LastUpdated *int `json:"last_updated,omitempty"`
	Link *string `json:"link,omitempty"`
	Lore *string `json:"lore,omitempty"`
	Material *string `json:"material,omitempty"`
	Mayor *map[string]any `json:"mayor,omitempty"`
	Member *map[string]any `json:"member,omitempty"`
	Name *string `json:"name,omitempty"`
	NpcSellPrice *float64 `json:"npc_sell_price,omitempty"`
	Page *int `json:"page,omitempty"`
	Product *map[string]any `json:"product,omitempty"`
	Profile *map[string]any `json:"profile,omitempty"`
	ProfileId *string `json:"profile_id,omitempty"`
	Progress *int `json:"progress,omitempty"`
	RequiredAmount *int `json:"required_amount,omitempty"`
	Sale *[]any `json:"sale,omitempty"`
	Skill *map[string]any `json:"skill,omitempty"`
	Start *int `json:"start,omitempty"`
	StartingBid *int `json:"starting_bid,omitempty"`
	Stat *map[string]any `json:"stat,omitempty"`
	Success *bool `json:"success,omitempty"`
	Text *string `json:"text,omitempty"`
	Tier *string `json:"tier,omitempty"`
	Title *string `json:"title,omitempty"`
	TotalAuction *int `json:"total_auction,omitempty"`
	TotalPage *int `json:"total_page,omitempty"`
	Uuid *string `json:"uuid,omitempty"`
	Version *string `json:"version,omitempty"`
}

// SkyBlockListMatch is the typed request payload for SkyBlock.ListTyped.
type SkyBlockListMatch struct {
	Auction *[]any `json:"auction,omitempty"`
	Auctioneer *string `json:"auctioneer,omitempty"`
	Bid *[]any `json:"bid,omitempty"`
	Category *string `json:"category,omitempty"`
	Claimed *bool `json:"claimed,omitempty"`
	ClaimedBidder *[]any `json:"claimed_bidder,omitempty"`
	Collection *map[string]any `json:"collection,omitempty"`
	Color *string `json:"color,omitempty"`
	Coop *[]any `json:"coop,omitempty"`
	Current *map[string]any `json:"current,omitempty"`
	End *int `json:"end,omitempty"`
	Event *[]any `json:"event,omitempty"`
	Extra *string `json:"extra,omitempty"`
	FullLore *[]any `json:"full_lore,omitempty"`
	Garden *map[string]any `json:"garden,omitempty"`
	HighestBidAmount *int `json:"highest_bid_amount,omitempty"`
	Id *string `json:"id,omitempty"`
	Item *map[string]any `json:"item,omitempty"`
	ItemByte *map[string]any `json:"item_byte,omitempty"`
	ItemLore *string `json:"item_lore,omitempty"`
	ItemName *string `json:"item_name,omitempty"`
	LastUpdated *int `json:"last_updated,omitempty"`
	Link *string `json:"link,omitempty"`
	Lore *string `json:"lore,omitempty"`
	Material *string `json:"material,omitempty"`
	Mayor *map[string]any `json:"mayor,omitempty"`
	Member *map[string]any `json:"member,omitempty"`
	Name *string `json:"name,omitempty"`
	NpcSellPrice *float64 `json:"npc_sell_price,omitempty"`
	Page *int `json:"page,omitempty"`
	Product *map[string]any `json:"product,omitempty"`
	Profile *map[string]any `json:"profile,omitempty"`
	ProfileId *string `json:"profile_id,omitempty"`
	Progress *int `json:"progress,omitempty"`
	RequiredAmount *int `json:"required_amount,omitempty"`
	Sale *[]any `json:"sale,omitempty"`
	Skill *map[string]any `json:"skill,omitempty"`
	Start *int `json:"start,omitempty"`
	StartingBid *int `json:"starting_bid,omitempty"`
	Stat *map[string]any `json:"stat,omitempty"`
	Success *bool `json:"success,omitempty"`
	Text *string `json:"text,omitempty"`
	Tier *string `json:"tier,omitempty"`
	Title *string `json:"title,omitempty"`
	TotalAuction *int `json:"total_auction,omitempty"`
	TotalPage *int `json:"total_page,omitempty"`
	Uuid *string `json:"uuid,omitempty"`
	Version *string `json:"version,omitempty"`
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

// typedFrom decodes a runtime value (a map[string]any produced by the op
// pipeline) into a typed model T via a JSON round-trip. On any error it
// returns the zero value of T; the op's own (value, error) tuple carries the
// real error.
func typedFrom[T any](v any) T {
	var out T
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

// typedSliceFrom decodes a runtime list value ([]any of maps) into a typed
// slice []T via a JSON round-trip, for list ops.
func typedSliceFrom[T any](v any) []T {
	var out []T
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
