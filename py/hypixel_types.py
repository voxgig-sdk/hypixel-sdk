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


class Guild(TypedDict, total=False):
    guild: dict
    success: bool


class GuildLoadMatch(TypedDict, total=False):
    guild: dict
    success: bool


class Housing(TypedDict, total=False):
    house: dict
    success: bool


class HousingLoadMatch(TypedDict, total=False):
    house: dict
    success: bool


class HousingListMatch(TypedDict, total=False):
    house: dict
    success: bool


class Other(TypedDict, total=False):
    booster: list
    booster_state: dict
    game: dict
    leaderboard: dict
    player_count: int
    staff_rolling_daily: int
    staff_total: int
    success: bool
    watchdog_last_minute: int
    watchdog_rolling_daily: int
    watchdog_total: int


class OtherLoadMatch(TypedDict, total=False):
    booster: list
    booster_state: dict
    game: dict
    leaderboard: dict
    player_count: int
    staff_rolling_daily: int
    staff_total: int
    success: bool
    watchdog_last_minute: int
    watchdog_rolling_daily: int
    watchdog_total: int


class OtherListMatch(TypedDict, total=False):
    booster: list
    booster_state: dict
    game: dict
    leaderboard: dict
    player_count: int
    staff_rolling_daily: int
    staff_total: int
    success: bool
    watchdog_last_minute: int
    watchdog_rolling_daily: int
    watchdog_total: int


class Player(TypedDict, total=False):
    player: dict
    success: bool


class PlayerLoadMatch(TypedDict, total=False):
    player: dict
    success: bool


class PlayerData(TypedDict, total=False):
    date: int
    ended: int
    game_type: str
    map: str
    mode: str
    session: dict
    success: bool
    uuid: str


class PlayerDataLoadMatch(TypedDict, total=False):
    date: int
    ended: int
    game_type: str
    map: str
    mode: str
    session: dict
    success: bool
    uuid: str


class PlayerDataListMatch(TypedDict, total=False):
    date: int
    ended: int
    game_type: str
    map: str
    mode: str
    session: dict
    success: bool
    uuid: str


class Resource(TypedDict, total=False):
    achievement: dict
    challenge: dict
    game: dict
    last_updated: int
    one_time: dict
    quest: dict
    rarity: dict
    success: bool
    tiered: dict
    type: dict


class ResourceLoadMatch(TypedDict, total=False):
    achievement: dict
    challenge: dict
    game: dict
    last_updated: int
    one_time: dict
    quest: dict
    rarity: dict
    success: bool
    tiered: dict
    type: dict


class SkyBlock(TypedDict, total=False):
    auction: list
    auctioneer: str
    bid: list
    category: str
    claimed: bool
    claimed_bidder: list
    collection: dict
    color: str
    coop: list
    current: dict
    end: int
    event: list
    extra: str
    full_lore: list
    garden: dict
    highest_bid_amount: int
    id: str
    item: dict
    item_byte: dict
    item_lore: str
    item_name: str
    last_updated: int
    link: str
    lore: str
    material: str
    mayor: dict
    member: dict
    name: str
    npc_sell_price: float
    page: int
    product: dict
    profile: dict
    profile_id: str
    progress: int
    required_amount: int
    sale: list
    skill: dict
    start: int
    starting_bid: int
    stat: dict
    success: bool
    text: str
    tier: str
    title: str
    total_auction: int
    total_page: int
    uuid: str
    version: str


class SkyBlockLoadMatch(TypedDict, total=False):
    auction: list
    auctioneer: str
    bid: list
    category: str
    claimed: bool
    claimed_bidder: list
    collection: dict
    color: str
    coop: list
    current: dict
    end: int
    event: list
    extra: str
    full_lore: list
    garden: dict
    highest_bid_amount: int
    id: str
    item: dict
    item_byte: dict
    item_lore: str
    item_name: str
    last_updated: int
    link: str
    lore: str
    material: str
    mayor: dict
    member: dict
    name: str
    npc_sell_price: float
    page: int
    product: dict
    profile: dict
    profile_id: str
    progress: int
    required_amount: int
    sale: list
    skill: dict
    start: int
    starting_bid: int
    stat: dict
    success: bool
    text: str
    tier: str
    title: str
    total_auction: int
    total_page: int
    uuid: str
    version: str


class SkyBlockListMatch(TypedDict, total=False):
    auction: list
    auctioneer: str
    bid: list
    category: str
    claimed: bool
    claimed_bidder: list
    collection: dict
    color: str
    coop: list
    current: dict
    end: int
    event: list
    extra: str
    full_lore: list
    garden: dict
    highest_bid_amount: int
    id: str
    item: dict
    item_byte: dict
    item_lore: str
    item_name: str
    last_updated: int
    link: str
    lore: str
    material: str
    mayor: dict
    member: dict
    name: str
    npc_sell_price: float
    page: int
    product: dict
    profile: dict
    profile_id: str
    progress: int
    required_amount: int
    sale: list
    skill: dict
    start: int
    starting_bid: int
    stat: dict
    success: bool
    text: str
    tier: str
    title: str
    total_auction: int
    total_page: int
    uuid: str
    version: str
