// Typed models for the Hypixel SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.

export interface Guild {
  guild?: Record<string, any>
  success?: boolean
}

export interface GuildLoadMatch {
  guild?: Record<string, any>
  success?: boolean
}

export interface Housing {
  house?: Record<string, any>
  success?: boolean
}

export interface HousingLoadMatch {
  house?: Record<string, any>
  success?: boolean
}

export interface HousingListMatch {
  house?: Record<string, any>
  success?: boolean
}

export interface Other {
  booster?: any[]
  booster_state?: Record<string, any>
  game?: Record<string, any>
  leaderboard?: Record<string, any>
  player_count?: number
  staff_rolling_daily?: number
  staff_total?: number
  success?: boolean
  watchdog_last_minute?: number
  watchdog_rolling_daily?: number
  watchdog_total?: number
}

export interface OtherLoadMatch {
  booster?: any[]
  booster_state?: Record<string, any>
  game?: Record<string, any>
  leaderboard?: Record<string, any>
  player_count?: number
  staff_rolling_daily?: number
  staff_total?: number
  success?: boolean
  watchdog_last_minute?: number
  watchdog_rolling_daily?: number
  watchdog_total?: number
}

export interface OtherListMatch {
  booster?: any[]
  booster_state?: Record<string, any>
  game?: Record<string, any>
  leaderboard?: Record<string, any>
  player_count?: number
  staff_rolling_daily?: number
  staff_total?: number
  success?: boolean
  watchdog_last_minute?: number
  watchdog_rolling_daily?: number
  watchdog_total?: number
}

export interface Player {
  player?: Record<string, any>
  success?: boolean
}

export interface PlayerLoadMatch {
  player?: Record<string, any>
  success?: boolean
}

export interface PlayerData {
  date?: number
  ended?: number
  game_type?: string
  map?: string
  mode?: string
  session?: Record<string, any>
  success?: boolean
  uuid?: string
}

export interface PlayerDataLoadMatch {
  date?: number
  ended?: number
  game_type?: string
  map?: string
  mode?: string
  session?: Record<string, any>
  success?: boolean
  uuid?: string
}

export interface PlayerDataListMatch {
  date?: number
  ended?: number
  game_type?: string
  map?: string
  mode?: string
  session?: Record<string, any>
  success?: boolean
  uuid?: string
}

export interface Resource {
  achievement?: Record<string, any>
  challenge?: Record<string, any>
  game?: Record<string, any>
  last_updated?: number
  one_time?: Record<string, any>
  quest?: Record<string, any>
  rarity?: Record<string, any>
  success?: boolean
  tiered?: Record<string, any>
  type?: Record<string, any>
}

export interface ResourceLoadMatch {
  achievement?: Record<string, any>
  challenge?: Record<string, any>
  game?: Record<string, any>
  last_updated?: number
  one_time?: Record<string, any>
  quest?: Record<string, any>
  rarity?: Record<string, any>
  success?: boolean
  tiered?: Record<string, any>
  type?: Record<string, any>
}

export interface SkyBlock {
  auction?: any[]
  auctioneer?: string
  bid?: any[]
  category?: string
  claimed?: boolean
  claimed_bidder?: any[]
  collection?: Record<string, any>
  color?: string
  coop?: any[]
  current?: Record<string, any>
  end?: number
  event?: any[]
  extra?: string
  full_lore?: any[]
  garden?: Record<string, any>
  highest_bid_amount?: number
  id?: string
  item?: Record<string, any>
  item_byte?: Record<string, any>
  item_lore?: string
  item_name?: string
  last_updated?: number
  link?: string
  lore?: string
  material?: string
  mayor?: Record<string, any>
  member?: Record<string, any>
  name?: string
  npc_sell_price?: number
  page?: number
  product?: Record<string, any>
  profile?: Record<string, any>
  profile_id?: string
  progress?: number
  required_amount?: number
  sale?: any[]
  skill?: Record<string, any>
  start?: number
  starting_bid?: number
  stat?: Record<string, any>
  success?: boolean
  text?: string
  tier?: string
  title?: string
  total_auction?: number
  total_page?: number
  uuid?: string
  version?: string
}

export interface SkyBlockLoadMatch {
  auction?: any[]
  auctioneer?: string
  bid?: any[]
  category?: string
  claimed?: boolean
  claimed_bidder?: any[]
  collection?: Record<string, any>
  color?: string
  coop?: any[]
  current?: Record<string, any>
  end?: number
  event?: any[]
  extra?: string
  full_lore?: any[]
  garden?: Record<string, any>
  highest_bid_amount?: number
  id: string
  item?: Record<string, any>
  item_byte?: Record<string, any>
  item_lore?: string
  item_name?: string
  last_updated?: number
  link?: string
  lore?: string
  material?: string
  mayor?: Record<string, any>
  member?: Record<string, any>
  name?: string
  npc_sell_price?: number
  page?: number
  product?: Record<string, any>
  profile?: Record<string, any>
  profile_id?: string
  progress?: number
  required_amount?: number
  sale?: any[]
  skill?: Record<string, any>
  start?: number
  starting_bid?: number
  stat?: Record<string, any>
  success?: boolean
  text?: string
  tier?: string
  title?: string
  total_auction?: number
  total_page?: number
  uuid?: string
  version?: string
}

export interface SkyBlockListMatch {
  auction?: any[]
  auctioneer?: string
  bid?: any[]
  category?: string
  claimed?: boolean
  claimed_bidder?: any[]
  collection?: Record<string, any>
  color?: string
  coop?: any[]
  current?: Record<string, any>
  end?: number
  event?: any[]
  extra?: string
  full_lore?: any[]
  garden?: Record<string, any>
  highest_bid_amount?: number
  id?: string
  item?: Record<string, any>
  item_byte?: Record<string, any>
  item_lore?: string
  item_name?: string
  last_updated?: number
  link?: string
  lore?: string
  material?: string
  mayor?: Record<string, any>
  member?: Record<string, any>
  name?: string
  npc_sell_price?: number
  page?: number
  product?: Record<string, any>
  profile?: Record<string, any>
  profile_id?: string
  progress?: number
  required_amount?: number
  sale?: any[]
  skill?: Record<string, any>
  start?: number
  starting_bid?: number
  stat?: Record<string, any>
  success?: boolean
  text?: string
  tier?: string
  title?: string
  total_auction?: number
  total_page?: number
  uuid?: string
  version?: string
}

