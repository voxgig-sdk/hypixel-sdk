# frozen_string_literal: true

# Typed models for the Hypixel SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Member types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Ruby types are unenforced; these YARD
# annotations document the shapes. Do not edit by hand.

# Guild entity data model.
class Guild
end

# Request payload for Guild#load.
class GuildLoadMatch
end

# Housing entity data model.
#
# @!attribute [rw] houses
#   @return [Array, nil]
#
# @!attribute [rw] success
#   @return [Boolean, nil]
Housing = Struct.new(
  :houses,
  :success,
  keyword_init: true
)

# Request payload for Housing#load.
#
# @!attribute [rw] houses
#   @return [Array, nil]
#
# @!attribute [rw] success
#   @return [Boolean, nil]
HousingLoadMatch = Struct.new(
  :houses,
  :success,
  keyword_init: true
)

# Request payload for Housing#list.
#
# @!attribute [rw] houses
#   @return [Array, nil]
#
# @!attribute [rw] success
#   @return [Boolean, nil]
HousingListMatch = Struct.new(
  :houses,
  :success,
  keyword_init: true
)

# Other entity data model.
#
# @!attribute [rw] boosterState
#   @return [Hash, nil]
#
# @!attribute [rw] boosters
#   @return [Array, nil]
#
# @!attribute [rw] staff_rollingDaily
#   @return [Integer, nil]
#
# @!attribute [rw] staff_total
#   @return [Integer, nil]
#
# @!attribute [rw] success
#   @return [Boolean, nil]
#
# @!attribute [rw] watchdog_lastMinute
#   @return [Integer, nil]
#
# @!attribute [rw] watchdog_rollingDaily
#   @return [Integer, nil]
#
# @!attribute [rw] watchdog_total
#   @return [Integer, nil]
Other = Struct.new(
  :boosterState,
  :boosters,
  :staff_rollingDaily,
  :staff_total,
  :success,
  :watchdog_lastMinute,
  :watchdog_rollingDaily,
  :watchdog_total,
  keyword_init: true
)

# Request payload for Other#load.
#
# @!attribute [rw] boosterState
#   @return [Hash, nil]
#
# @!attribute [rw] boosters
#   @return [Array, nil]
#
# @!attribute [rw] staff_rollingDaily
#   @return [Integer, nil]
#
# @!attribute [rw] staff_total
#   @return [Integer, nil]
#
# @!attribute [rw] success
#   @return [Boolean, nil]
#
# @!attribute [rw] watchdog_lastMinute
#   @return [Integer, nil]
#
# @!attribute [rw] watchdog_rollingDaily
#   @return [Integer, nil]
#
# @!attribute [rw] watchdog_total
#   @return [Integer, nil]
OtherLoadMatch = Struct.new(
  :boosterState,
  :boosters,
  :staff_rollingDaily,
  :staff_total,
  :success,
  :watchdog_lastMinute,
  :watchdog_rollingDaily,
  :watchdog_total,
  keyword_init: true
)

# Request payload for Other#list.
#
# @!attribute [rw] boosterState
#   @return [Hash, nil]
#
# @!attribute [rw] boosters
#   @return [Array, nil]
#
# @!attribute [rw] staff_rollingDaily
#   @return [Integer, nil]
#
# @!attribute [rw] staff_total
#   @return [Integer, nil]
#
# @!attribute [rw] success
#   @return [Boolean, nil]
#
# @!attribute [rw] watchdog_lastMinute
#   @return [Integer, nil]
#
# @!attribute [rw] watchdog_rollingDaily
#   @return [Integer, nil]
#
# @!attribute [rw] watchdog_total
#   @return [Integer, nil]
OtherListMatch = Struct.new(
  :boosterState,
  :boosters,
  :staff_rollingDaily,
  :staff_total,
  :success,
  :watchdog_lastMinute,
  :watchdog_rollingDaily,
  :watchdog_total,
  keyword_init: true
)

# Player entity data model.
#
# @!attribute [rw] displayname
#   @return [String, nil]
#
# @!attribute [rw] firstLogin
#   @return [Integer, nil]
#
# @!attribute [rw] lastLogin
#   @return [Integer, nil]
#
# @!attribute [rw] lastLogout
#   @return [Integer, nil]
#
# @!attribute [rw] monthlyPackageRank
#   @return [String, nil]
#
# @!attribute [rw] newPackageRank
#   @return [String, nil]
#
# @!attribute [rw] packageRank
#   @return [String, nil]
#
# @!attribute [rw] rank
#   @return [String, nil]
#
# @!attribute [rw] stats
#   @return [Hash, nil]
#
# @!attribute [rw] uuid
#   @return [String, nil]
Player = Struct.new(
  :displayname,
  :firstLogin,
  :lastLogin,
  :lastLogout,
  :monthlyPackageRank,
  :newPackageRank,
  :packageRank,
  :rank,
  :stats,
  :uuid,
  keyword_init: true
)

# Request payload for Player#load.
#
# @!attribute [rw] displayname
#   @return [String, nil]
#
# @!attribute [rw] firstLogin
#   @return [Integer, nil]
#
# @!attribute [rw] lastLogin
#   @return [Integer, nil]
#
# @!attribute [rw] lastLogout
#   @return [Integer, nil]
#
# @!attribute [rw] monthlyPackageRank
#   @return [String, nil]
#
# @!attribute [rw] newPackageRank
#   @return [String, nil]
#
# @!attribute [rw] packageRank
#   @return [String, nil]
#
# @!attribute [rw] rank
#   @return [String, nil]
#
# @!attribute [rw] stats
#   @return [Hash, nil]
#
# @!attribute [rw] uuid
#   @return [String, nil]
PlayerLoadMatch = Struct.new(
  :displayname,
  :firstLogin,
  :lastLogin,
  :lastLogout,
  :monthlyPackageRank,
  :newPackageRank,
  :packageRank,
  :rank,
  :stats,
  :uuid,
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
# @!attribute [rw] gameType
#   @return [String, nil]
#
# @!attribute [rw] map
#   @return [String, nil]
#
# @!attribute [rw] mode
#   @return [String, nil]
#
# @!attribute [rw] online
#   @return [Boolean, nil]
PlayerData = Struct.new(
  :date,
  :ended,
  :gameType,
  :map,
  :mode,
  :online,
  keyword_init: true
)

# Request payload for PlayerData#load.
#
# @!attribute [rw] date
#   @return [Integer, nil]
#
# @!attribute [rw] ended
#   @return [Integer, nil]
#
# @!attribute [rw] gameType
#   @return [String, nil]
#
# @!attribute [rw] map
#   @return [String, nil]
#
# @!attribute [rw] mode
#   @return [String, nil]
#
# @!attribute [rw] online
#   @return [Boolean, nil]
PlayerDataLoadMatch = Struct.new(
  :date,
  :ended,
  :gameType,
  :map,
  :mode,
  :online,
  keyword_init: true
)

# Request payload for PlayerData#list.
#
# @!attribute [rw] date
#   @return [Integer, nil]
#
# @!attribute [rw] ended
#   @return [Integer, nil]
#
# @!attribute [rw] gameType
#   @return [String, nil]
#
# @!attribute [rw] map
#   @return [String, nil]
#
# @!attribute [rw] mode
#   @return [String, nil]
#
# @!attribute [rw] online
#   @return [Boolean, nil]
PlayerDataListMatch = Struct.new(
  :date,
  :ended,
  :gameType,
  :map,
  :mode,
  :online,
  keyword_init: true
)

# Resource entity data model.
#
# @!attribute [rw] databaseName
#   @return [String, nil]
#
# @!attribute [rw] id
#   @return [Integer, nil]
#
# @!attribute [rw] lastUpdated
#   @return [Integer, nil]
#
# @!attribute [rw] modeNames
#   @return [Hash, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] one_time
#   @return [Hash, nil]
#
# @!attribute [rw] rarities
#   @return [Hash, nil]
#
# @!attribute [rw] success
#   @return [Boolean, nil]
#
# @!attribute [rw] tiered
#   @return [Hash, nil]
#
# @!attribute [rw] types
#   @return [Hash, nil]
Resource = Struct.new(
  :databaseName,
  :id,
  :lastUpdated,
  :modeNames,
  :name,
  :one_time,
  :rarities,
  :success,
  :tiered,
  :types,
  keyword_init: true
)

# Request payload for Resource#load.
#
# @!attribute [rw] databaseName
#   @return [String, nil]
#
# @!attribute [rw] id
#   @return [Integer]
#
# @!attribute [rw] lastUpdated
#   @return [Integer, nil]
#
# @!attribute [rw] modeNames
#   @return [Hash, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] one_time
#   @return [Hash, nil]
#
# @!attribute [rw] rarities
#   @return [Hash, nil]
#
# @!attribute [rw] success
#   @return [Boolean, nil]
#
# @!attribute [rw] tiered
#   @return [Hash, nil]
#
# @!attribute [rw] types
#   @return [Hash, nil]
ResourceLoadMatch = Struct.new(
  :databaseName,
  :id,
  :lastUpdated,
  :modeNames,
  :name,
  :one_time,
  :rarities,
  :success,
  :tiered,
  :types,
  keyword_init: true
)

# SkyBlock entity data model.
#
# @!attribute [rw] auctioneer
#   @return [String, nil]
#
# @!attribute [rw] auctions
#   @return [Array, nil]
#
# @!attribute [rw] bids
#   @return [Array, nil]
#
# @!attribute [rw] category
#   @return [String, nil]
#
# @!attribute [rw] claimed
#   @return [Boolean, nil]
#
# @!attribute [rw] claimed_bidders
#   @return [Array, nil]
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
# @!attribute [rw] events
#   @return [Array, nil]
#
# @!attribute [rw] extra
#   @return [String, nil]
#
# @!attribute [rw] fullLore
#   @return [Array, nil]
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
# @!attribute [rw] item_bytes
#   @return [Hash, nil]
#
# @!attribute [rw] item_lore
#   @return [String, nil]
#
# @!attribute [rw] item_name
#   @return [String, nil]
#
# @!attribute [rw] lastUpdated
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
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] npc_sell_price
#   @return [Float, nil]
#
# @!attribute [rw] page
#   @return [Integer, nil]
#
# @!attribute [rw] profile_id
#   @return [String, nil]
#
# @!attribute [rw] profiles
#   @return [Array, nil]
#
# @!attribute [rw] progress
#   @return [Integer, nil]
#
# @!attribute [rw] requiredAmount
#   @return [Integer, nil]
#
# @!attribute [rw] sales
#   @return [Array, nil]
#
# @!attribute [rw] start
#   @return [Integer, nil]
#
# @!attribute [rw] starting_bid
#   @return [Integer, nil]
#
# @!attribute [rw] stats
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
# @!attribute [rw] tiers
#   @return [Array, nil]
#
# @!attribute [rw] title
#   @return [String, nil]
#
# @!attribute [rw] totalAuctions
#   @return [Integer, nil]
#
# @!attribute [rw] totalPages
#   @return [Integer, nil]
#
# @!attribute [rw] uuid
#   @return [String, nil]
SkyBlock = Struct.new(
  :auctioneer,
  :auctions,
  :bids,
  :category,
  :claimed,
  :claimed_bidders,
  :color,
  :coop,
  :current,
  :end,
  :events,
  :extra,
  :fullLore,
  :highest_bid_amount,
  :id,
  :item,
  :item_bytes,
  :item_lore,
  :item_name,
  :lastUpdated,
  :link,
  :lore,
  :material,
  :mayor,
  :name,
  :npc_sell_price,
  :page,
  :profile_id,
  :profiles,
  :progress,
  :requiredAmount,
  :sales,
  :start,
  :starting_bid,
  :stats,
  :success,
  :text,
  :tier,
  :tiers,
  :title,
  :totalAuctions,
  :totalPages,
  :uuid,
  keyword_init: true
)

# Request payload for SkyBlock#load.
#
# @!attribute [rw] auctioneer
#   @return [String, nil]
#
# @!attribute [rw] auctions
#   @return [Array, nil]
#
# @!attribute [rw] bids
#   @return [Array, nil]
#
# @!attribute [rw] category
#   @return [String, nil]
#
# @!attribute [rw] claimed
#   @return [Boolean, nil]
#
# @!attribute [rw] claimed_bidders
#   @return [Array, nil]
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
# @!attribute [rw] events
#   @return [Array, nil]
#
# @!attribute [rw] extra
#   @return [String, nil]
#
# @!attribute [rw] fullLore
#   @return [Array, nil]
#
# @!attribute [rw] highest_bid_amount
#   @return [Integer, nil]
#
# @!attribute [rw] id
#   @return [String]
#
# @!attribute [rw] item
#   @return [Hash, nil]
#
# @!attribute [rw] item_bytes
#   @return [Hash, nil]
#
# @!attribute [rw] item_lore
#   @return [String, nil]
#
# @!attribute [rw] item_name
#   @return [String, nil]
#
# @!attribute [rw] lastUpdated
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
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] npc_sell_price
#   @return [Float, nil]
#
# @!attribute [rw] page
#   @return [Integer, nil]
#
# @!attribute [rw] profile_id
#   @return [String, nil]
#
# @!attribute [rw] profiles
#   @return [Array, nil]
#
# @!attribute [rw] progress
#   @return [Integer, nil]
#
# @!attribute [rw] requiredAmount
#   @return [Integer, nil]
#
# @!attribute [rw] sales
#   @return [Array, nil]
#
# @!attribute [rw] start
#   @return [Integer, nil]
#
# @!attribute [rw] starting_bid
#   @return [Integer, nil]
#
# @!attribute [rw] stats
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
# @!attribute [rw] tiers
#   @return [Array, nil]
#
# @!attribute [rw] title
#   @return [String, nil]
#
# @!attribute [rw] totalAuctions
#   @return [Integer, nil]
#
# @!attribute [rw] totalPages
#   @return [Integer, nil]
#
# @!attribute [rw] uuid
#   @return [String, nil]
SkyBlockLoadMatch = Struct.new(
  :auctioneer,
  :auctions,
  :bids,
  :category,
  :claimed,
  :claimed_bidders,
  :color,
  :coop,
  :current,
  :end,
  :events,
  :extra,
  :fullLore,
  :highest_bid_amount,
  :id,
  :item,
  :item_bytes,
  :item_lore,
  :item_name,
  :lastUpdated,
  :link,
  :lore,
  :material,
  :mayor,
  :name,
  :npc_sell_price,
  :page,
  :profile_id,
  :profiles,
  :progress,
  :requiredAmount,
  :sales,
  :start,
  :starting_bid,
  :stats,
  :success,
  :text,
  :tier,
  :tiers,
  :title,
  :totalAuctions,
  :totalPages,
  :uuid,
  keyword_init: true
)

# Request payload for SkyBlock#list.
#
# @!attribute [rw] auctioneer
#   @return [String, nil]
#
# @!attribute [rw] auctions
#   @return [Array, nil]
#
# @!attribute [rw] bids
#   @return [Array, nil]
#
# @!attribute [rw] category
#   @return [String, nil]
#
# @!attribute [rw] claimed
#   @return [Boolean, nil]
#
# @!attribute [rw] claimed_bidders
#   @return [Array, nil]
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
# @!attribute [rw] events
#   @return [Array, nil]
#
# @!attribute [rw] extra
#   @return [String, nil]
#
# @!attribute [rw] fullLore
#   @return [Array, nil]
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
# @!attribute [rw] item_bytes
#   @return [Hash, nil]
#
# @!attribute [rw] item_lore
#   @return [String, nil]
#
# @!attribute [rw] item_name
#   @return [String, nil]
#
# @!attribute [rw] lastUpdated
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
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] npc_sell_price
#   @return [Float, nil]
#
# @!attribute [rw] page
#   @return [Integer, nil]
#
# @!attribute [rw] profile_id
#   @return [String, nil]
#
# @!attribute [rw] profiles
#   @return [Array, nil]
#
# @!attribute [rw] progress
#   @return [Integer, nil]
#
# @!attribute [rw] requiredAmount
#   @return [Integer, nil]
#
# @!attribute [rw] sales
#   @return [Array, nil]
#
# @!attribute [rw] start
#   @return [Integer, nil]
#
# @!attribute [rw] starting_bid
#   @return [Integer, nil]
#
# @!attribute [rw] stats
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
# @!attribute [rw] tiers
#   @return [Array, nil]
#
# @!attribute [rw] title
#   @return [String, nil]
#
# @!attribute [rw] totalAuctions
#   @return [Integer, nil]
#
# @!attribute [rw] totalPages
#   @return [Integer, nil]
#
# @!attribute [rw] uuid
#   @return [String, nil]
SkyBlockListMatch = Struct.new(
  :auctioneer,
  :auctions,
  :bids,
  :category,
  :claimed,
  :claimed_bidders,
  :color,
  :coop,
  :current,
  :end,
  :events,
  :extra,
  :fullLore,
  :highest_bid_amount,
  :id,
  :item,
  :item_bytes,
  :item_lore,
  :item_name,
  :lastUpdated,
  :link,
  :lore,
  :material,
  :mayor,
  :name,
  :npc_sell_price,
  :page,
  :profile_id,
  :profiles,
  :progress,
  :requiredAmount,
  :sales,
  :start,
  :starting_bid,
  :stats,
  :success,
  :text,
  :tier,
  :tiers,
  :title,
  :totalAuctions,
  :totalPages,
  :uuid,
  keyword_init: true
)

