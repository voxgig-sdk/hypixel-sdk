# Typed models for the Hypixel SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Field/param types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Do not edit by hand.

from __future__ import annotations

from dataclasses import dataclass
from typing import Optional, Any


@dataclass
class Guild:
    guild: Optional[dict] = None
    success: Optional[bool] = None


@dataclass
class GuildLoadMatch:
    guild: Optional[dict] = None
    success: Optional[bool] = None


@dataclass
class Housing:
    house: Optional[dict] = None
    success: Optional[bool] = None


@dataclass
class HousingLoadMatch:
    house: Optional[dict] = None
    success: Optional[bool] = None


@dataclass
class HousingListMatch:
    house: Optional[dict] = None
    success: Optional[bool] = None


@dataclass
class Other:
    booster: Optional[list] = None
    booster_state: Optional[dict] = None
    game: Optional[dict] = None
    leaderboard: Optional[dict] = None
    player_count: Optional[int] = None
    staff_rolling_daily: Optional[int] = None
    staff_total: Optional[int] = None
    success: Optional[bool] = None
    watchdog_last_minute: Optional[int] = None
    watchdog_rolling_daily: Optional[int] = None
    watchdog_total: Optional[int] = None


@dataclass
class OtherLoadMatch:
    booster: Optional[list] = None
    booster_state: Optional[dict] = None
    game: Optional[dict] = None
    leaderboard: Optional[dict] = None
    player_count: Optional[int] = None
    staff_rolling_daily: Optional[int] = None
    staff_total: Optional[int] = None
    success: Optional[bool] = None
    watchdog_last_minute: Optional[int] = None
    watchdog_rolling_daily: Optional[int] = None
    watchdog_total: Optional[int] = None


@dataclass
class OtherListMatch:
    booster: Optional[list] = None
    booster_state: Optional[dict] = None
    game: Optional[dict] = None
    leaderboard: Optional[dict] = None
    player_count: Optional[int] = None
    staff_rolling_daily: Optional[int] = None
    staff_total: Optional[int] = None
    success: Optional[bool] = None
    watchdog_last_minute: Optional[int] = None
    watchdog_rolling_daily: Optional[int] = None
    watchdog_total: Optional[int] = None


@dataclass
class Player:
    player: Optional[dict] = None
    success: Optional[bool] = None


@dataclass
class PlayerLoadMatch:
    player: Optional[dict] = None
    success: Optional[bool] = None


@dataclass
class PlayerData:
    date: Optional[int] = None
    ended: Optional[int] = None
    game_type: Optional[str] = None
    map: Optional[str] = None
    mode: Optional[str] = None
    session: Optional[dict] = None
    success: Optional[bool] = None
    uuid: Optional[str] = None


@dataclass
class PlayerDataLoadMatch:
    date: Optional[int] = None
    ended: Optional[int] = None
    game_type: Optional[str] = None
    map: Optional[str] = None
    mode: Optional[str] = None
    session: Optional[dict] = None
    success: Optional[bool] = None
    uuid: Optional[str] = None


@dataclass
class PlayerDataListMatch:
    date: Optional[int] = None
    ended: Optional[int] = None
    game_type: Optional[str] = None
    map: Optional[str] = None
    mode: Optional[str] = None
    session: Optional[dict] = None
    success: Optional[bool] = None
    uuid: Optional[str] = None


@dataclass
class Resource:
    achievement: Optional[dict] = None
    challenge: Optional[dict] = None
    game: Optional[dict] = None
    last_updated: Optional[int] = None
    one_time: Optional[dict] = None
    quest: Optional[dict] = None
    rarity: Optional[dict] = None
    success: Optional[bool] = None
    tiered: Optional[dict] = None
    type: Optional[dict] = None


@dataclass
class ResourceLoadMatch:
    achievement: Optional[dict] = None
    challenge: Optional[dict] = None
    game: Optional[dict] = None
    last_updated: Optional[int] = None
    one_time: Optional[dict] = None
    quest: Optional[dict] = None
    rarity: Optional[dict] = None
    success: Optional[bool] = None
    tiered: Optional[dict] = None
    type: Optional[dict] = None


@dataclass
class SkyBlock:
    auction: Optional[list] = None
    auctioneer: Optional[str] = None
    bid: Optional[list] = None
    category: Optional[str] = None
    claimed: Optional[bool] = None
    claimed_bidder: Optional[list] = None
    collection: Optional[dict] = None
    color: Optional[str] = None
    coop: Optional[list] = None
    current: Optional[dict] = None
    end: Optional[int] = None
    event: Optional[list] = None
    extra: Optional[str] = None
    full_lore: Optional[list] = None
    garden: Optional[dict] = None
    highest_bid_amount: Optional[int] = None
    id: Optional[str] = None
    item: Optional[dict] = None
    item_byte: Optional[dict] = None
    item_lore: Optional[str] = None
    item_name: Optional[str] = None
    last_updated: Optional[int] = None
    link: Optional[str] = None
    lore: Optional[str] = None
    material: Optional[str] = None
    mayor: Optional[dict] = None
    member: Optional[dict] = None
    name: Optional[str] = None
    npc_sell_price: Optional[float] = None
    page: Optional[int] = None
    product: Optional[dict] = None
    profile: Optional[dict] = None
    profile_id: Optional[str] = None
    progress: Optional[int] = None
    required_amount: Optional[int] = None
    sale: Optional[list] = None
    skill: Optional[dict] = None
    start: Optional[int] = None
    starting_bid: Optional[int] = None
    stat: Optional[dict] = None
    success: Optional[bool] = None
    text: Optional[str] = None
    tier: Optional[str] = None
    title: Optional[str] = None
    total_auction: Optional[int] = None
    total_page: Optional[int] = None
    uuid: Optional[str] = None
    version: Optional[str] = None


@dataclass
class SkyBlockLoadMatch:
    auction: Optional[list] = None
    auctioneer: Optional[str] = None
    bid: Optional[list] = None
    category: Optional[str] = None
    claimed: Optional[bool] = None
    claimed_bidder: Optional[list] = None
    collection: Optional[dict] = None
    color: Optional[str] = None
    coop: Optional[list] = None
    current: Optional[dict] = None
    end: Optional[int] = None
    event: Optional[list] = None
    extra: Optional[str] = None
    full_lore: Optional[list] = None
    garden: Optional[dict] = None
    highest_bid_amount: Optional[int] = None
    id: Optional[str] = None
    item: Optional[dict] = None
    item_byte: Optional[dict] = None
    item_lore: Optional[str] = None
    item_name: Optional[str] = None
    last_updated: Optional[int] = None
    link: Optional[str] = None
    lore: Optional[str] = None
    material: Optional[str] = None
    mayor: Optional[dict] = None
    member: Optional[dict] = None
    name: Optional[str] = None
    npc_sell_price: Optional[float] = None
    page: Optional[int] = None
    product: Optional[dict] = None
    profile: Optional[dict] = None
    profile_id: Optional[str] = None
    progress: Optional[int] = None
    required_amount: Optional[int] = None
    sale: Optional[list] = None
    skill: Optional[dict] = None
    start: Optional[int] = None
    starting_bid: Optional[int] = None
    stat: Optional[dict] = None
    success: Optional[bool] = None
    text: Optional[str] = None
    tier: Optional[str] = None
    title: Optional[str] = None
    total_auction: Optional[int] = None
    total_page: Optional[int] = None
    uuid: Optional[str] = None
    version: Optional[str] = None


@dataclass
class SkyBlockListMatch:
    auction: Optional[list] = None
    auctioneer: Optional[str] = None
    bid: Optional[list] = None
    category: Optional[str] = None
    claimed: Optional[bool] = None
    claimed_bidder: Optional[list] = None
    collection: Optional[dict] = None
    color: Optional[str] = None
    coop: Optional[list] = None
    current: Optional[dict] = None
    end: Optional[int] = None
    event: Optional[list] = None
    extra: Optional[str] = None
    full_lore: Optional[list] = None
    garden: Optional[dict] = None
    highest_bid_amount: Optional[int] = None
    id: Optional[str] = None
    item: Optional[dict] = None
    item_byte: Optional[dict] = None
    item_lore: Optional[str] = None
    item_name: Optional[str] = None
    last_updated: Optional[int] = None
    link: Optional[str] = None
    lore: Optional[str] = None
    material: Optional[str] = None
    mayor: Optional[dict] = None
    member: Optional[dict] = None
    name: Optional[str] = None
    npc_sell_price: Optional[float] = None
    page: Optional[int] = None
    product: Optional[dict] = None
    profile: Optional[dict] = None
    profile_id: Optional[str] = None
    progress: Optional[int] = None
    required_amount: Optional[int] = None
    sale: Optional[list] = None
    skill: Optional[dict] = None
    start: Optional[int] = None
    starting_bid: Optional[int] = None
    stat: Optional[dict] = None
    success: Optional[bool] = None
    text: Optional[str] = None
    tier: Optional[str] = None
    title: Optional[str] = None
    total_auction: Optional[int] = None
    total_page: Optional[int] = None
    uuid: Optional[str] = None
    version: Optional[str] = None

