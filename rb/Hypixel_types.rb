# frozen_string_literal: true

# Typed models for the Hypixel SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Member types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Ruby types are unenforced; these YARD
# annotations document the shapes. Do not edit by hand.

# Guild entity data model.
#
# @!attribute [rw] guild
#   @return [Hash, nil]
#
# @!attribute [rw] success
#   @return [Boolean, nil]
Guild = Struct.new(
  :guild,
  :success,
  keyword_init: true
)

# Match filter for Guild#load (any subset of Guild fields).
#
# @!attribute [rw] guild
#   @return [Hash, nil]
#
# @!attribute [rw] success
#   @return [Boolean, nil]
GuildLoadMatch = Struct.new(
  :guild,
  :success,
  keyword_init: true
)

# Housing entity data model.
#
# @!attribute [rw] house
#   @return [Hash, nil]
#
# @!attribute [rw] success
#   @return [Boolean, nil]
Housing = Struct.new(
  :house,
  :success,
  keyword_init: true
)

# Match filter for Housing#load (any subset of Housing fields).
#
# @!attribute [rw] house
#   @return [Hash, nil]
#
# @!attribute [rw] success
#   @return [Boolean, nil]
HousingLoadMatch = Struct.new(
  :house,
  :success,
  keyword_init: true
)

# Match filter for Housing#list (any subset of Housing fields).
#
# @!attribute [rw] house
#   @return [Hash, nil]
#
# @!attribute [rw] success
#   @return [Boolean, nil]
HousingListMatch = Struct.new(
  :house,
  :success,
  keyword_init: true
)

# Other entity data model.
#
# @!attribute [rw] booster
#   @return [Array, nil]
#
# @!attribute [rw] booster_state
#   @return [Hash, nil]
#
# @!attribute [rw] game
#   @return [Hash, nil]
#
# @!attribute [rw] leaderboard
#   @return [Hash, nil]
#
# @!attribute [rw] player_count
#   @return [Integer, nil]
#
# @!attribute [rw] staff_rolling_daily
#   @return [Integer, nil]
#
# @!attribute [rw] staff_total
#   @return [Integer, nil]
#
# @!attribute [rw] success
#   @return [Boolean, nil]
#
# @!attribute [rw] watchdog_last_minute
#   @return [Integer, nil]
#
# @!attribute [rw] watchdog_rolling_daily
#   @return [Integer, nil]
#
# @!attribute [rw] watchdog_total
#   @return [Integer, nil]
Other = Struct.new(
  :booster,
  :booster_state,
  :game,
  :leaderboard,
  :player_count,
  :staff_rolling_daily,
  :staff_total,
  :success,
  :watchdog_last_minute,
  :watchdog_rolling_daily,
  :watchdog_total,
  keyword_init: true
)

# Match filter for Other#load (any subset of Other fields).
#
# @!attribute [rw] booster
#   @return [Array, nil]
#
# @!attribute [rw] booster_state
#   @return [Hash, nil]
#
# @!attribute [rw] game
#   @return [Hash, nil]
#
# @!attribute [rw] leaderboard
#   @return [Hash, nil]
#
# @!attribute [rw] player_count
#   @return [Integer, nil]
#
# @!attribute [rw] staff_rolling_daily
#   @return [Integer, nil]
#
# @!attribute [rw] staff_total
#   @return [Integer, nil]
#
# @!attribute [rw] success
#   @return [Boolean, nil]
#
# @!attribute [rw] watchdog_last_minute
#   @return [Integer, nil]
#
# @!attribute [rw] watchdog_rolling_daily
#   @return [Integer, nil]
#
# @!attribute [rw] watchdog_total
#   @return [Integer, nil]
OtherLoadMatch = Struct.new(
  :booster,
  :booster_state,
  :game,
  :leaderboard,
  :player_count,
  :staff_rolling_daily,
  :staff_total,
  :success,
  :watchdog_last_minute,
  :watchdog_rolling_daily,
  :watchdog_total,
  keyword_init: true
)

# Match filter for Other#list (any subset of Other fields).
#
# @!attribute [rw] booster
#   @return [Array, nil]
#
# @!attribute [rw] booster_state
#   @return [Hash, nil]
#
# @!attribute [rw] game
#   @return [Hash, nil]
#
# @!attribute [rw] leaderboard
#   @return [Hash, nil]
#
# @!attribute [rw] player_count
#   @return [Integer, nil]
#
# @!attribute [rw] staff_rolling_daily
#   @return [Integer, nil]
#
# @!attribute [rw] staff_total
#   @return [Integer, nil]
#
# @!attribute [rw] success
#   @return [Boolean, nil]
#
# @!attribute [rw] watchdog_last_minute
#   @return [Integer, nil]
#
# @!attribute [rw] watchdog_rolling_daily
#   @return [Integer, nil]
#
# @!attribute [rw] watchdog_total
#   @return [Integer, nil]
OtherListMatch = Struct.new(
  :booster,
  :booster_state,
  :game,
  :leaderboard,
  :player_count,
  :staff_rolling_daily,
  :staff_total,
  :success,
  :watchdog_last_minute,
  :watchdog_rolling_daily,
  :watchdog_total,
  keyword_init: true
)

# Player entity data model.
#
# @!attribute [rw] player
#   @return [Hash, nil]
#
# @!attribute [rw] success
#   @return [Boolean, nil]
Player = Struct.new(
  :player,
  :success,
  keyword_init: true
)

# Match filter for Player#load (any subset of Player fields).
#
# @!attribute [rw] player
#   @return [Hash, nil]
#
# @!attribute [rw] success
#   @return [Boolean, nil]
PlayerLoadMatch = Struct.new(
  :player,
  :success,
  keyword_init: true
)

# PlayerData entity data model.
#
# @!attribute [rw] date
#   @return [Integer, nil]
#
# @!attribute [rw] ended
#   @return [Integer, nil]
#
# @!attribute [rw] game_type
#   @return [String, nil]
#
# @!attribute [rw] map
#   @return [String, nil]
#
# @!attribute [rw] mode
#   @return [String, nil]
#
# @!attribute [rw] session
#   @return [Hash, nil]
#
# @!attribute [rw] success
#   @return [Boolean, nil]
#
# @!attribute [rw] uuid
#   @return [String, nil]
PlayerData = Struct.new(
  :date,
  :ended,
  :game_type,
  :map,
  :mode,
  :session,
  :success,
  :uuid,
  keyword_init: true
)

# Match filter for PlayerData#load (any subset of PlayerData fields).
#
# @!attribute [rw] date
#   @return [Integer, nil]
#
# @!attribute [rw] ended
#   @return [Integer, nil]
#
# @!attribute [rw] game_type
#   @return [String, nil]
#
# @!attribute [rw] map
#   @return [String, nil]
#
# @!attribute [rw] mode
#   @return [String, nil]
#
# @!attribute [rw] session
#   @return [Hash, nil]
#
# @!attribute [rw] success
#   @return [Boolean, nil]
#
# @!attribute [rw] uuid
#   @return [String, nil]
PlayerDataLoadMatch = Struct.new(
  :date,
  :ended,
  :game_type,
  :map,
  :mode,
  :session,
  :success,
  :uuid,
  keyword_init: true
)

# Match filter for PlayerData#list (any subset of PlayerData fields).
#
# @!attribute [rw] date
#   @return [Integer, nil]
#
# @!attribute [rw] ended
#   @return [Integer, nil]
#
# @!attribute [rw] game_type
#   @return [String, nil]
#
# @!attribute [rw] map
#   @return [String, nil]
#
# @!attribute [rw] mode
#   @return [String, nil]
#
# @!attribute [rw] session
#   @return [Hash, nil]
#
# @!attribute [rw] success
#   @return [Boolean, nil]
#
# @!attribute [rw] uuid
#   @return [String, nil]
PlayerDataListMatch = Struct.new(
  :date,
  :ended,
  :game_type,
  :map,
  :mode,
  :session,
  :success,
  :uuid,
  keyword_init: true
)

# Resource entity data model.
#
# @!attribute [rw] achievement
#   @return [Hash, nil]
#
# @!attribute [rw] challenge
#   @return [Hash, nil]
#
# @!attribute [rw] game
#   @return [Hash, nil]
#
# @!attribute [rw] last_updated
#   @return [Integer, nil]
#
# @!attribute [rw] one_time
#   @return [Hash, nil]
#
# @!attribute [rw] quest
#   @return [Hash, nil]
#
# @!attribute [rw] rarity
#   @return [Hash, nil]
#
# @!attribute [rw] success
#   @return [Boolean, nil]
#
# @!attribute [rw] tiered
#   @return [Hash, nil]
#
# @!attribute [rw] type
#   @return [Hash, nil]
Resource = Struct.new(
  :achievement,
  :challenge,
  :game,
  :last_updated,
  :one_time,
  :quest,
  :rarity,
  :success,
  :tiered,
  :type,
  keyword_init: true
)

# Match filter for Resource#load (any subset of Resource fields).
#
# @!attribute [rw] achievement
#   @return [Hash, nil]
#
# @!attribute [rw] challenge
#   @return [Hash, nil]
#
# @!attribute [rw] game
#   @return [Hash, nil]
#
# @!attribute [rw] last_updated
#   @return [Integer, nil]
#
# @!attribute [rw] one_time
#   @return [Hash, nil]
#
# @!attribute [rw] quest
#   @return [Hash, nil]
#
# @!attribute [rw] rarity
#   @return [Hash, nil]
#
# @!attribute [rw] success
#   @return [Boolean, nil]
#
# @!attribute [rw] tiered
#   @return [Hash, nil]
#
# @!attribute [rw] type
#   @return [Hash, nil]
ResourceLoadMatch = Struct.new(
  :achievement,
  :challenge,
  :game,
  :last_updated,
  :one_time,
  :quest,
  :rarity,
  :success,
  :tiered,
  :type,
  keyword_init: true
)

# SkyBlock entity data model.
#
# @!attribute [rw] auction
#   @return [Array, nil]
#
# @!attribute [rw] auctioneer
#   @return [String, nil]
#
# @!attribute [rw] bid
#   @return [Array, nil]
#
# @!attribute [rw] category
#   @return [String, nil]
#
# @!attribute [rw] claimed
#   @return [Boolean, nil]
#
# @!attribute [rw] claimed_bidder
#   @return [Array, nil]
#
# @!attribute [rw] collection
#   @return [Hash, nil]
#
# @!attribute [rw] color
#   @return [String, nil]
#
# @!attribute [rw] coop
#   @return [Array, nil]
#
# @!attribute [rw] current
#   @return [Hash, nil]
#
# @!attribute [rw] end
#   @return [Integer, nil]
#
# @!attribute [rw] event
#   @return [Array, nil]
#
# @!attribute [rw] extra
#   @return [String, nil]
#
# @!attribute [rw] full_lore
#   @return [Array, nil]
#
# @!attribute [rw] garden
#   @return [Hash, nil]
#
# @!attribute [rw] highest_bid_amount
#   @return [Integer, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] item
#   @return [Hash, nil]
#
# @!attribute [rw] item_byte
#   @return [Hash, nil]
#
# @!attribute [rw] item_lore
#   @return [String, nil]
#
# @!attribute [rw] item_name
#   @return [String, nil]
#
# @!attribute [rw] last_updated
#   @return [Integer, nil]
#
# @!attribute [rw] link
#   @return [String, nil]
#
# @!attribute [rw] lore
#   @return [String, nil]
#
# @!attribute [rw] material
#   @return [String, nil]
#
# @!attribute [rw] mayor
#   @return [Hash, nil]
#
# @!attribute [rw] member
#   @return [Hash, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] npc_sell_price
#   @return [Float, nil]
#
# @!attribute [rw] page
#   @return [Integer, nil]
#
# @!attribute [rw] product
#   @return [Hash, nil]
#
# @!attribute [rw] profile
#   @return [Hash, nil]
#
# @!attribute [rw] profile_id
#   @return [String, nil]
#
# @!attribute [rw] progress
#   @return [Integer, nil]
#
# @!attribute [rw] required_amount
#   @return [Integer, nil]
#
# @!attribute [rw] sale
#   @return [Array, nil]
#
# @!attribute [rw] skill
#   @return [Hash, nil]
#
# @!attribute [rw] start
#   @return [Integer, nil]
#
# @!attribute [rw] starting_bid
#   @return [Integer, nil]
#
# @!attribute [rw] stat
#   @return [Hash, nil]
#
# @!attribute [rw] success
#   @return [Boolean, nil]
#
# @!attribute [rw] text
#   @return [String, nil]
#
# @!attribute [rw] tier
#   @return [String, nil]
#
# @!attribute [rw] title
#   @return [String, nil]
#
# @!attribute [rw] total_auction
#   @return [Integer, nil]
#
# @!attribute [rw] total_page
#   @return [Integer, nil]
#
# @!attribute [rw] uuid
#   @return [String, nil]
#
# @!attribute [rw] version
#   @return [String, nil]
SkyBlock = Struct.new(
  :auction,
  :auctioneer,
  :bid,
  :category,
  :claimed,
  :claimed_bidder,
  :collection,
  :color,
  :coop,
  :current,
  :end,
  :event,
  :extra,
  :full_lore,
  :garden,
  :highest_bid_amount,
  :id,
  :item,
  :item_byte,
  :item_lore,
  :item_name,
  :last_updated,
  :link,
  :lore,
  :material,
  :mayor,
  :member,
  :name,
  :npc_sell_price,
  :page,
  :product,
  :profile,
  :profile_id,
  :progress,
  :required_amount,
  :sale,
  :skill,
  :start,
  :starting_bid,
  :stat,
  :success,
  :text,
  :tier,
  :title,
  :total_auction,
  :total_page,
  :uuid,
  :version,
  keyword_init: true
)

# Match filter for SkyBlock#load (any subset of SkyBlock fields).
#
# @!attribute [rw] auction
#   @return [Array, nil]
#
# @!attribute [rw] auctioneer
#   @return [String, nil]
#
# @!attribute [rw] bid
#   @return [Array, nil]
#
# @!attribute [rw] category
#   @return [String, nil]
#
# @!attribute [rw] claimed
#   @return [Boolean, nil]
#
# @!attribute [rw] claimed_bidder
#   @return [Array, nil]
#
# @!attribute [rw] collection
#   @return [Hash, nil]
#
# @!attribute [rw] color
#   @return [String, nil]
#
# @!attribute [rw] coop
#   @return [Array, nil]
#
# @!attribute [rw] current
#   @return [Hash, nil]
#
# @!attribute [rw] end
#   @return [Integer, nil]
#
# @!attribute [rw] event
#   @return [Array, nil]
#
# @!attribute [rw] extra
#   @return [String, nil]
#
# @!attribute [rw] full_lore
#   @return [Array, nil]
#
# @!attribute [rw] garden
#   @return [Hash, nil]
#
# @!attribute [rw] highest_bid_amount
#   @return [Integer, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] item
#   @return [Hash, nil]
#
# @!attribute [rw] item_byte
#   @return [Hash, nil]
#
# @!attribute [rw] item_lore
#   @return [String, nil]
#
# @!attribute [rw] item_name
#   @return [String, nil]
#
# @!attribute [rw] last_updated
#   @return [Integer, nil]
#
# @!attribute [rw] link
#   @return [String, nil]
#
# @!attribute [rw] lore
#   @return [String, nil]
#
# @!attribute [rw] material
#   @return [String, nil]
#
# @!attribute [rw] mayor
#   @return [Hash, nil]
#
# @!attribute [rw] member
#   @return [Hash, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] npc_sell_price
#   @return [Float, nil]
#
# @!attribute [rw] page
#   @return [Integer, nil]
#
# @!attribute [rw] product
#   @return [Hash, nil]
#
# @!attribute [rw] profile
#   @return [Hash, nil]
#
# @!attribute [rw] profile_id
#   @return [String, nil]
#
# @!attribute [rw] progress
#   @return [Integer, nil]
#
# @!attribute [rw] required_amount
#   @return [Integer, nil]
#
# @!attribute [rw] sale
#   @return [Array, nil]
#
# @!attribute [rw] skill
#   @return [Hash, nil]
#
# @!attribute [rw] start
#   @return [Integer, nil]
#
# @!attribute [rw] starting_bid
#   @return [Integer, nil]
#
# @!attribute [rw] stat
#   @return [Hash, nil]
#
# @!attribute [rw] success
#   @return [Boolean, nil]
#
# @!attribute [rw] text
#   @return [String, nil]
#
# @!attribute [rw] tier
#   @return [String, nil]
#
# @!attribute [rw] title
#   @return [String, nil]
#
# @!attribute [rw] total_auction
#   @return [Integer, nil]
#
# @!attribute [rw] total_page
#   @return [Integer, nil]
#
# @!attribute [rw] uuid
#   @return [String, nil]
#
# @!attribute [rw] version
#   @return [String, nil]
SkyBlockLoadMatch = Struct.new(
  :auction,
  :auctioneer,
  :bid,
  :category,
  :claimed,
  :claimed_bidder,
  :collection,
  :color,
  :coop,
  :current,
  :end,
  :event,
  :extra,
  :full_lore,
  :garden,
  :highest_bid_amount,
  :id,
  :item,
  :item_byte,
  :item_lore,
  :item_name,
  :last_updated,
  :link,
  :lore,
  :material,
  :mayor,
  :member,
  :name,
  :npc_sell_price,
  :page,
  :product,
  :profile,
  :profile_id,
  :progress,
  :required_amount,
  :sale,
  :skill,
  :start,
  :starting_bid,
  :stat,
  :success,
  :text,
  :tier,
  :title,
  :total_auction,
  :total_page,
  :uuid,
  :version,
  keyword_init: true
)

# Match filter for SkyBlock#list (any subset of SkyBlock fields).
#
# @!attribute [rw] auction
#   @return [Array, nil]
#
# @!attribute [rw] auctioneer
#   @return [String, nil]
#
# @!attribute [rw] bid
#   @return [Array, nil]
#
# @!attribute [rw] category
#   @return [String, nil]
#
# @!attribute [rw] claimed
#   @return [Boolean, nil]
#
# @!attribute [rw] claimed_bidder
#   @return [Array, nil]
#
# @!attribute [rw] collection
#   @return [Hash, nil]
#
# @!attribute [rw] color
#   @return [String, nil]
#
# @!attribute [rw] coop
#   @return [Array, nil]
#
# @!attribute [rw] current
#   @return [Hash, nil]
#
# @!attribute [rw] end
#   @return [Integer, nil]
#
# @!attribute [rw] event
#   @return [Array, nil]
#
# @!attribute [rw] extra
#   @return [String, nil]
#
# @!attribute [rw] full_lore
#   @return [Array, nil]
#
# @!attribute [rw] garden
#   @return [Hash, nil]
#
# @!attribute [rw] highest_bid_amount
#   @return [Integer, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] item
#   @return [Hash, nil]
#
# @!attribute [rw] item_byte
#   @return [Hash, nil]
#
# @!attribute [rw] item_lore
#   @return [String, nil]
#
# @!attribute [rw] item_name
#   @return [String, nil]
#
# @!attribute [rw] last_updated
#   @return [Integer, nil]
#
# @!attribute [rw] link
#   @return [String, nil]
#
# @!attribute [rw] lore
#   @return [String, nil]
#
# @!attribute [rw] material
#   @return [String, nil]
#
# @!attribute [rw] mayor
#   @return [Hash, nil]
#
# @!attribute [rw] member
#   @return [Hash, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] npc_sell_price
#   @return [Float, nil]
#
# @!attribute [rw] page
#   @return [Integer, nil]
#
# @!attribute [rw] product
#   @return [Hash, nil]
#
# @!attribute [rw] profile
#   @return [Hash, nil]
#
# @!attribute [rw] profile_id
#   @return [String, nil]
#
# @!attribute [rw] progress
#   @return [Integer, nil]
#
# @!attribute [rw] required_amount
#   @return [Integer, nil]
#
# @!attribute [rw] sale
#   @return [Array, nil]
#
# @!attribute [rw] skill
#   @return [Hash, nil]
#
# @!attribute [rw] start
#   @return [Integer, nil]
#
# @!attribute [rw] starting_bid
#   @return [Integer, nil]
#
# @!attribute [rw] stat
#   @return [Hash, nil]
#
# @!attribute [rw] success
#   @return [Boolean, nil]
#
# @!attribute [rw] text
#   @return [String, nil]
#
# @!attribute [rw] tier
#   @return [String, nil]
#
# @!attribute [rw] title
#   @return [String, nil]
#
# @!attribute [rw] total_auction
#   @return [Integer, nil]
#
# @!attribute [rw] total_page
#   @return [Integer, nil]
#
# @!attribute [rw] uuid
#   @return [String, nil]
#
# @!attribute [rw] version
#   @return [String, nil]
SkyBlockListMatch = Struct.new(
  :auction,
  :auctioneer,
  :bid,
  :category,
  :claimed,
  :claimed_bidder,
  :collection,
  :color,
  :coop,
  :current,
  :end,
  :event,
  :extra,
  :full_lore,
  :garden,
  :highest_bid_amount,
  :id,
  :item,
  :item_byte,
  :item_lore,
  :item_name,
  :last_updated,
  :link,
  :lore,
  :material,
  :mayor,
  :member,
  :name,
  :npc_sell_price,
  :page,
  :product,
  :profile,
  :profile_id,
  :progress,
  :required_amount,
  :sale,
  :skill,
  :start,
  :starting_bid,
  :stat,
  :success,
  :text,
  :tier,
  :title,
  :total_auction,
  :total_page,
  :uuid,
  :version,
  keyword_init: true
)

