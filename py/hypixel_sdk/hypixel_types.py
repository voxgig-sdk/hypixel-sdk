# Typed models for the Hypixel SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Field/param types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Do not edit by hand.
#
# These are TypedDicts, not dataclasses: the SDK ops return/accept plain dicts
# at runtime, and a TypedDict IS a dict shape, so the types match the runtime.
# Optional (req:false) keys are modelled as TypedDict key-optionality
# (total=False), split into a required base + total=False subclass when a type
# has both required and optional keys.

from __future__ import annotations

from typing import TypedDict, Any


class Guild(TypedDict):
    pass


class GuildLoadMatch(TypedDict):
    pass


class Housing(TypedDict, total=False):
    houses: list
    success: bool


class HousingLoadMatch(TypedDict, total=False):
    houses: list
    success: bool


class HousingListMatch(TypedDict, total=False):
    houses: list
    success: bool


class Other(TypedDict, total=False):
    boosterState: dict
    boosters: list
    staff_rollingDaily: int
    staff_total: int
    success: bool
    watchdog_lastMinute: int
    watchdog_rollingDaily: int
    watchdog_total: int


class OtherLoadMatch(TypedDict, total=False):
    boosterState: dict
    boosters: list
    staff_rollingDaily: int
    staff_total: int
    success: bool
    watchdog_lastMinute: int
    watchdog_rollingDaily: int
    watchdog_total: int


class OtherListMatch(TypedDict, total=False):
    boosterState: dict
    boosters: list
    staff_rollingDaily: int
    staff_total: int
    success: bool
    watchdog_lastMinute: int
    watchdog_rollingDaily: int
    watchdog_total: int


class Player(TypedDict, total=False):
    displayname: str
    firstLogin: int
    lastLogin: int
    lastLogout: int
    monthlyPackageRank: str
    newPackageRank: str
    packageRank: str
    rank: str
    stats: dict
    uuid: str


class PlayerLoadMatch(TypedDict, total=False):
    displayname: str
    firstLogin: int
    lastLogin: int
    lastLogout: int
    monthlyPackageRank: str
    newPackageRank: str
    packageRank: str
    rank: str
    stats: dict
    uuid: str


class PlayerData(TypedDict, total=False):
    date: int
    ended: int
    gameType: str
    map: str
    mode: str
    online: bool


class PlayerDataLoadMatch(TypedDict, total=False):
    date: int
    ended: int
    gameType: str
    map: str
    mode: str
    online: bool


class PlayerDataListMatch(TypedDict, total=False):
    date: int
    ended: int
    gameType: str
    map: str
    mode: str
    online: bool


class Resource(TypedDict, total=False):
    databaseName: str
    id: int
    lastUpdated: int
    modeNames: dict
    name: str
    one_time: dict
    rarities: dict
    success: bool
    tiered: dict
    types: dict


class ResourceLoadMatchRequired(TypedDict):
    id: int


class ResourceLoadMatch(ResourceLoadMatchRequired, total=False):
    databaseName: str
    lastUpdated: int
    modeNames: dict
    name: str
    one_time: dict
    rarities: dict
    success: bool
    tiered: dict
    types: dict


class SkyBlock(TypedDict, total=False):
    auctioneer: str
    auctions: list
    bids: list
    category: str
    claimed: bool
    claimed_bidders: list
    color: str
    coop: list
    current: dict
    end: int
    events: list
    extra: str
    fullLore: list
    highest_bid_amount: int
    id: str
    item: dict
    item_bytes: dict
    item_lore: str
    item_name: str
    lastUpdated: int
    link: str
    lore: str
    material: str
    mayor: dict
    name: str
    npc_sell_price: float
    page: int
    profile_id: str
    profiles: list
    progress: int
    requiredAmount: int
    sales: list
    start: int
    starting_bid: int
    stats: dict
    success: bool
    text: str
    tier: str
    tiers: list
    title: str
    totalAuctions: int
    totalPages: int
    uuid: str


class SkyBlockLoadMatchRequired(TypedDict):
    id: str


class SkyBlockLoadMatch(SkyBlockLoadMatchRequired, total=False):
    auctioneer: str
    auctions: list
    bids: list
    category: str
    claimed: bool
    claimed_bidders: list
    color: str
    coop: list
    current: dict
    end: int
    events: list
    extra: str
    fullLore: list
    highest_bid_amount: int
    item: dict
    item_bytes: dict
    item_lore: str
    item_name: str
    lastUpdated: int
    link: str
    lore: str
    material: str
    mayor: dict
    name: str
    npc_sell_price: float
    page: int
    profile_id: str
    profiles: list
    progress: int
    requiredAmount: int
    sales: list
    start: int
    starting_bid: int
    stats: dict
    success: bool
    text: str
    tier: str
    tiers: list
    title: str
    totalAuctions: int
    totalPages: int
    uuid: str


class SkyBlockListMatch(TypedDict, total=False):
    auctioneer: str
    auctions: list
    bids: list
    category: str
    claimed: bool
    claimed_bidders: list
    color: str
    coop: list
    current: dict
    end: int
    events: list
    extra: str
    fullLore: list
    highest_bid_amount: int
    id: str
    item: dict
    item_bytes: dict
    item_lore: str
    item_name: str
    lastUpdated: int
    link: str
    lore: str
    material: str
    mayor: dict
    name: str
    npc_sell_price: float
    page: int
    profile_id: str
    profiles: list
    progress: int
    requiredAmount: int
    sales: list
    start: int
    starting_bid: int
    stats: dict
    success: bool
    text: str
    tier: str
    tiers: list
    title: str
    totalAuctions: int
    totalPages: int
    uuid: str
