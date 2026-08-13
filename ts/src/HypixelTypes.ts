// Typed models for the Hypixel SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.

export interface Guild {
}

export interface GuildLoadMatch {
}

export interface Housing {
  houses?: any[]
  success?: boolean
}

export interface HousingLoadMatch {
  houses?: any[]
  success?: boolean

  // Selects a custom action instead of the plain load:
  //   'house'
  // The remaining keys are that action's own payload.
  $action?: string
  [action: string]: any
}

export interface HousingListMatch {
  houses?: any[]
  success?: boolean

  // Selects a custom action instead of the plain list:
  //   'house' | 'player'
  // The remaining keys are that action's own payload.
  $action?: string
  [action: string]: any
}

export interface Other {
  boosterState?: Record<string, any>
  boosters?: any[]
  staff_rollingDaily?: number
  staff_total?: number
  success?: boolean
  watchdog_lastMinute?: number
  watchdog_rollingDaily?: number
  watchdog_total?: number
}

export interface OtherLoadMatch {
  boosterState?: Record<string, any>
  boosters?: any[]
  staff_rollingDaily?: number
  staff_total?: number
  success?: boolean
  watchdog_lastMinute?: number
  watchdog_rollingDaily?: number
  watchdog_total?: number
}

export interface OtherListMatch {
  boosterState?: Record<string, any>
  boosters?: any[]
  staff_rollingDaily?: number
  staff_total?: number
  success?: boolean
  watchdog_lastMinute?: number
  watchdog_rollingDaily?: number
  watchdog_total?: number
}

export interface Player {
  displayname?: string
  firstLogin?: number
  lastLogin?: number
  lastLogout?: number
  monthlyPackageRank?: string
  newPackageRank?: string
  packageRank?: string
  rank?: string
  stats?: Record<string, any>
  uuid?: string
}

export interface PlayerLoadMatch {
  displayname?: string
  firstLogin?: number
  lastLogin?: number
  lastLogout?: number
  monthlyPackageRank?: string
  newPackageRank?: string
  packageRank?: string
  rank?: string
  stats?: Record<string, any>
  uuid?: string
}

export interface PlayerData {
  date?: number
  ended?: number
  gameType?: string
  map?: string
  mode?: string
  online?: boolean
}

export interface PlayerDataLoadMatch {
  date?: number
  ended?: number
  gameType?: string
  map?: string
  mode?: string
  online?: boolean
}

export interface PlayerDataListMatch {
  date?: number
  ended?: number
  gameType?: string
  map?: string
  mode?: string
  online?: boolean
}

export interface Resource {
  databaseName?: string
  id?: number
  lastUpdated?: number
  modeNames?: Record<string, any>
  name?: string
  one_time?: Record<string, any>
  rarities?: Record<string, any>
  success?: boolean
  tiered?: Record<string, any>
  types?: Record<string, any>
}

export interface ResourceLoadMatch {
  databaseName?: string
  id: number
  lastUpdated?: number
  modeNames?: Record<string, any>
  name?: string
  one_time?: Record<string, any>
  rarities?: Record<string, any>
  success?: boolean
  tiered?: Record<string, any>
  types?: Record<string, any>

  // Selects a custom action instead of the plain load:
  //   'achievement' | 'challenge' | 'game' | 'quest'
  // The remaining keys are that action's own payload.
  $action?: string
  [action: string]: any
}

export interface SkyBlock {
  auctioneer?: string
  auctions?: any[]
  bids?: any[]
  category?: string
  claimed?: boolean
  claimed_bidders?: any[]
  color?: string
  coop?: any[]
  current?: Record<string, any>
  end?: number
  events?: any[]
  extra?: string
  fullLore?: any[]
  highest_bid_amount?: number
  id?: string
  item?: Record<string, any>
  item_bytes?: Record<string, any>
  item_lore?: string
  item_name?: string
  lastUpdated?: number
  link?: string
  lore?: string
  material?: string
  mayor?: Record<string, any>
  name?: string
  npc_sell_price?: number
  page?: number
  profile_id?: string
  profiles?: any[]
  progress?: number
  requiredAmount?: number
  sales?: any[]
  start?: number
  starting_bid?: number
  stats?: Record<string, any>
  success?: boolean
  text?: string
  tier?: string
  tiers?: any[]
  title?: string
  totalAuctions?: number
  totalPages?: number
  uuid?: string
}

export interface SkyBlockLoadMatch {
  auctioneer?: string
  auctions?: any[]
  bids?: any[]
  category?: string
  claimed?: boolean
  claimed_bidders?: any[]
  color?: string
  coop?: any[]
  current?: Record<string, any>
  end?: number
  events?: any[]
  extra?: string
  fullLore?: any[]
  highest_bid_amount?: number
  id: string
  item?: Record<string, any>
  item_bytes?: Record<string, any>
  item_lore?: string
  item_name?: string
  lastUpdated?: number
  link?: string
  lore?: string
  material?: string
  mayor?: Record<string, any>
  name?: string
  npc_sell_price?: number
  page?: number
  profile_id?: string
  profiles?: any[]
  progress?: number
  requiredAmount?: number
  sales?: any[]
  start?: number
  starting_bid?: number
  stats?: Record<string, any>
  success?: boolean
  text?: string
  tier?: string
  tiers?: any[]
  title?: string
  totalAuctions?: number
  totalPages?: number
  uuid?: string
}

export interface SkyBlockListMatch {
  auctioneer?: string
  auctions?: any[]
  bids?: any[]
  category?: string
  claimed?: boolean
  claimed_bidders?: any[]
  color?: string
  coop?: any[]
  current?: Record<string, any>
  end?: number
  events?: any[]
  extra?: string
  fullLore?: any[]
  highest_bid_amount?: number
  id?: string
  item?: Record<string, any>
  item_bytes?: Record<string, any>
  item_lore?: string
  item_name?: string
  lastUpdated?: number
  link?: string
  lore?: string
  material?: string
  mayor?: Record<string, any>
  name?: string
  npc_sell_price?: number
  page?: number
  profile_id?: string
  profiles?: any[]
  progress?: number
  requiredAmount?: number
  sales?: any[]
  start?: number
  starting_bid?: number
  stats?: Record<string, any>
  success?: boolean
  text?: string
  tier?: string
  tiers?: any[]
  title?: string
  totalAuctions?: number
  totalPages?: number
  uuid?: string
}

