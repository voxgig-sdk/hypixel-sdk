<?php
declare(strict_types=1);

// Typed models for the Hypixel SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.
//
// These are documentation-grade value objects (PHP 8 typed properties),
// registered on the composer classmap autoload. The SDK boundary exchanges
// assoc-arrays; these classes name the shapes for tooling and typed callers.

/** Guild entity data model. */
class Guild
{
    public ?array $guild = null;
    public ?bool $success = null;
}

/** Match filter for Guild#load (any subset of Guild fields). */
class GuildLoadMatch
{
    public ?array $guild = null;
    public ?bool $success = null;
}

/** Housing entity data model. */
class Housing
{
    public ?array $house = null;
    public ?bool $success = null;
}

/** Match filter for Housing#load (any subset of Housing fields). */
class HousingLoadMatch
{
    public ?array $house = null;
    public ?bool $success = null;
}

/** Match filter for Housing#list (any subset of Housing fields). */
class HousingListMatch
{
    public ?array $house = null;
    public ?bool $success = null;
}

/** Other entity data model. */
class Other
{
    public ?array $booster = null;
    public ?array $booster_state = null;
    public ?array $game = null;
    public ?array $leaderboard = null;
    public ?int $player_count = null;
    public ?int $staff_rolling_daily = null;
    public ?int $staff_total = null;
    public ?bool $success = null;
    public ?int $watchdog_last_minute = null;
    public ?int $watchdog_rolling_daily = null;
    public ?int $watchdog_total = null;
}

/** Match filter for Other#load (any subset of Other fields). */
class OtherLoadMatch
{
    public ?array $booster = null;
    public ?array $booster_state = null;
    public ?array $game = null;
    public ?array $leaderboard = null;
    public ?int $player_count = null;
    public ?int $staff_rolling_daily = null;
    public ?int $staff_total = null;
    public ?bool $success = null;
    public ?int $watchdog_last_minute = null;
    public ?int $watchdog_rolling_daily = null;
    public ?int $watchdog_total = null;
}

/** Match filter for Other#list (any subset of Other fields). */
class OtherListMatch
{
    public ?array $booster = null;
    public ?array $booster_state = null;
    public ?array $game = null;
    public ?array $leaderboard = null;
    public ?int $player_count = null;
    public ?int $staff_rolling_daily = null;
    public ?int $staff_total = null;
    public ?bool $success = null;
    public ?int $watchdog_last_minute = null;
    public ?int $watchdog_rolling_daily = null;
    public ?int $watchdog_total = null;
}

/** Player entity data model. */
class Player
{
    public ?array $player = null;
    public ?bool $success = null;
}

/** Match filter for Player#load (any subset of Player fields). */
class PlayerLoadMatch
{
    public ?array $player = null;
    public ?bool $success = null;
}

/** PlayerData entity data model. */
class PlayerData
{
    public ?int $date = null;
    public ?int $ended = null;
    public ?string $game_type = null;
    public ?string $map = null;
    public ?string $mode = null;
    public ?array $session = null;
    public ?bool $success = null;
    public ?string $uuid = null;
}

/** Match filter for PlayerData#load (any subset of PlayerData fields). */
class PlayerDataLoadMatch
{
    public ?int $date = null;
    public ?int $ended = null;
    public ?string $game_type = null;
    public ?string $map = null;
    public ?string $mode = null;
    public ?array $session = null;
    public ?bool $success = null;
    public ?string $uuid = null;
}

/** Match filter for PlayerData#list (any subset of PlayerData fields). */
class PlayerDataListMatch
{
    public ?int $date = null;
    public ?int $ended = null;
    public ?string $game_type = null;
    public ?string $map = null;
    public ?string $mode = null;
    public ?array $session = null;
    public ?bool $success = null;
    public ?string $uuid = null;
}

/** Resource entity data model. */
class Resource
{
    public ?array $achievement = null;
    public ?array $challenge = null;
    public ?array $game = null;
    public ?int $last_updated = null;
    public ?array $one_time = null;
    public ?array $quest = null;
    public ?array $rarity = null;
    public ?bool $success = null;
    public ?array $tiered = null;
    public ?array $type = null;
}

/** Match filter for Resource#load (any subset of Resource fields). */
class ResourceLoadMatch
{
    public ?array $achievement = null;
    public ?array $challenge = null;
    public ?array $game = null;
    public ?int $last_updated = null;
    public ?array $one_time = null;
    public ?array $quest = null;
    public ?array $rarity = null;
    public ?bool $success = null;
    public ?array $tiered = null;
    public ?array $type = null;
}

/** SkyBlock entity data model. */
class SkyBlock
{
    public ?array $auction = null;
    public ?string $auctioneer = null;
    public ?array $bid = null;
    public ?string $category = null;
    public ?bool $claimed = null;
    public ?array $claimed_bidder = null;
    public ?array $collection = null;
    public ?string $color = null;
    public ?array $coop = null;
    public ?array $current = null;
    public ?int $end = null;
    public ?array $event = null;
    public ?string $extra = null;
    public ?array $full_lore = null;
    public ?array $garden = null;
    public ?int $highest_bid_amount = null;
    public ?string $id = null;
    public ?array $item = null;
    public ?array $item_byte = null;
    public ?string $item_lore = null;
    public ?string $item_name = null;
    public ?int $last_updated = null;
    public ?string $link = null;
    public ?string $lore = null;
    public ?string $material = null;
    public ?array $mayor = null;
    public ?array $member = null;
    public ?string $name = null;
    public ?float $npc_sell_price = null;
    public ?int $page = null;
    public ?array $product = null;
    public ?array $profile = null;
    public ?string $profile_id = null;
    public ?int $progress = null;
    public ?int $required_amount = null;
    public ?array $sale = null;
    public ?array $skill = null;
    public ?int $start = null;
    public ?int $starting_bid = null;
    public ?array $stat = null;
    public ?bool $success = null;
    public ?string $text = null;
    public ?string $tier = null;
    public ?string $title = null;
    public ?int $total_auction = null;
    public ?int $total_page = null;
    public ?string $uuid = null;
    public ?string $version = null;
}

/** Match filter for SkyBlock#load (any subset of SkyBlock fields). */
class SkyBlockLoadMatch
{
    public ?array $auction = null;
    public ?string $auctioneer = null;
    public ?array $bid = null;
    public ?string $category = null;
    public ?bool $claimed = null;
    public ?array $claimed_bidder = null;
    public ?array $collection = null;
    public ?string $color = null;
    public ?array $coop = null;
    public ?array $current = null;
    public ?int $end = null;
    public ?array $event = null;
    public ?string $extra = null;
    public ?array $full_lore = null;
    public ?array $garden = null;
    public ?int $highest_bid_amount = null;
    public ?string $id = null;
    public ?array $item = null;
    public ?array $item_byte = null;
    public ?string $item_lore = null;
    public ?string $item_name = null;
    public ?int $last_updated = null;
    public ?string $link = null;
    public ?string $lore = null;
    public ?string $material = null;
    public ?array $mayor = null;
    public ?array $member = null;
    public ?string $name = null;
    public ?float $npc_sell_price = null;
    public ?int $page = null;
    public ?array $product = null;
    public ?array $profile = null;
    public ?string $profile_id = null;
    public ?int $progress = null;
    public ?int $required_amount = null;
    public ?array $sale = null;
    public ?array $skill = null;
    public ?int $start = null;
    public ?int $starting_bid = null;
    public ?array $stat = null;
    public ?bool $success = null;
    public ?string $text = null;
    public ?string $tier = null;
    public ?string $title = null;
    public ?int $total_auction = null;
    public ?int $total_page = null;
    public ?string $uuid = null;
    public ?string $version = null;
}

/** Match filter for SkyBlock#list (any subset of SkyBlock fields). */
class SkyBlockListMatch
{
    public ?array $auction = null;
    public ?string $auctioneer = null;
    public ?array $bid = null;
    public ?string $category = null;
    public ?bool $claimed = null;
    public ?array $claimed_bidder = null;
    public ?array $collection = null;
    public ?string $color = null;
    public ?array $coop = null;
    public ?array $current = null;
    public ?int $end = null;
    public ?array $event = null;
    public ?string $extra = null;
    public ?array $full_lore = null;
    public ?array $garden = null;
    public ?int $highest_bid_amount = null;
    public ?string $id = null;
    public ?array $item = null;
    public ?array $item_byte = null;
    public ?string $item_lore = null;
    public ?string $item_name = null;
    public ?int $last_updated = null;
    public ?string $link = null;
    public ?string $lore = null;
    public ?string $material = null;
    public ?array $mayor = null;
    public ?array $member = null;
    public ?string $name = null;
    public ?float $npc_sell_price = null;
    public ?int $page = null;
    public ?array $product = null;
    public ?array $profile = null;
    public ?string $profile_id = null;
    public ?int $progress = null;
    public ?int $required_amount = null;
    public ?array $sale = null;
    public ?array $skill = null;
    public ?int $start = null;
    public ?int $starting_bid = null;
    public ?array $stat = null;
    public ?bool $success = null;
    public ?string $text = null;
    public ?string $tier = null;
    public ?string $title = null;
    public ?int $total_auction = null;
    public ?int $total_page = null;
    public ?string $uuid = null;
    public ?string $version = null;
}

