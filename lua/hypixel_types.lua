-- Typed models for the Hypixel SDK (LuaLS annotations).
--
-- GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
-- params (op.<name>.points[].args.params[]). Field/param types come from the
-- canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
-- @voxgig/apidef VALID_CANON). Annotations only — no runtime effect. Do not
-- edit by hand.

---@class Guild
---@field guild? table
---@field success? boolean

---@class GuildLoadMatch

---@class Housing
---@field house? table
---@field success? boolean

---@class HousingLoadMatch

---@class HousingListMatch

---@class Other
---@field booster? table
---@field booster_state? table
---@field game? table
---@field leaderboard? table
---@field player_count? number
---@field staff_rolling_daily? number
---@field staff_total? number
---@field success? boolean
---@field watchdog_last_minute? number
---@field watchdog_rolling_daily? number
---@field watchdog_total? number

---@class OtherLoadMatch

---@class OtherListMatch

---@class Player
---@field player? table
---@field success? boolean

---@class PlayerLoadMatch

---@class PlayerData
---@field date? number
---@field ended? number
---@field game_type? string
---@field map? string
---@field mode? string
---@field session? table
---@field success? boolean
---@field uuid? string

---@class PlayerDataLoadMatch

---@class PlayerDataListMatch

---@class Resource
---@field achievement? table
---@field challenge? table
---@field game? table
---@field last_updated? number
---@field one_time? table
---@field quest? table
---@field rarity? table
---@field success? boolean
---@field tiered? table
---@field type? table

---@class ResourceLoadMatch

---@class SkyBlock
---@field auction? table
---@field auctioneer? string
---@field bid? table
---@field category? string
---@field claimed? boolean
---@field claimed_bidder? table
---@field collection? table
---@field color? string
---@field coop? table
---@field current? table
---@field end? number
---@field event? table
---@field extra? string
---@field full_lore? table
---@field garden? table
---@field highest_bid_amount? number
---@field id? string
---@field item? table
---@field item_byte? table
---@field item_lore? string
---@field item_name? string
---@field last_updated? number
---@field link? string
---@field lore? string
---@field material? string
---@field mayor? table
---@field member? table
---@field name? string
---@field npc_sell_price? number
---@field page? number
---@field product? table
---@field profile? table
---@field profile_id? string
---@field progress? number
---@field required_amount? number
---@field sale? table
---@field skill? table
---@field start? number
---@field starting_bid? number
---@field stat? table
---@field success? boolean
---@field text? string
---@field tier? string
---@field title? string
---@field total_auction? number
---@field total_page? number
---@field uuid? string
---@field version? string

---@class SkyBlockLoadMatch

---@class SkyBlockListMatch

local M = {}

return M
