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
}

/** Request payload for Guild#load. */
class GuildLoadMatch
{
}

/** Housing entity data model. */
class Housing
{
    public ?array $houses = null;
    public ?bool $success = null;
}

/** Request payload for Housing#load. */
class HousingLoadMatch
{
    public ?array $houses = null;
    public ?bool $success = null;
}

/** Request payload for Housing#list. */
class HousingListMatch
{
    public ?array $houses = null;
    public ?bool $success = null;
}

/** Other entity data model. */
class Other
{
    public ?array $boosterState = null;
    public ?array $boosters = null;
    public ?int $staff_rollingDaily = null;
    public ?int $staff_total = null;
    public ?bool $success = null;
    public ?int $watchdog_lastMinute = null;
    public ?int $watchdog_rollingDaily = null;
    public ?int $watchdog_total = null;
}

/** Request payload for Other#load. */
class OtherLoadMatch
{
    public ?array $boosterState = null;
    public ?array $boosters = null;
    public ?int $staff_rollingDaily = null;
    public ?int $staff_total = null;
    public ?bool $success = null;
    public ?int $watchdog_lastMinute = null;
    public ?int $watchdog_rollingDaily = null;
    public ?int $watchdog_total = null;
}

/** Request payload for Other#list. */
class OtherListMatch
{
    public ?array $boosterState = null;
    public ?array $boosters = null;
    public ?int $staff_rollingDaily = null;
    public ?int $staff_total = null;
    public ?bool $success = null;
    public ?int $watchdog_lastMinute = null;
    public ?int $watchdog_rollingDaily = null;
    public ?int $watchdog_total = null;
}

/** Player entity data model. */
class Player
{
    public ?string $displayname = null;
    public ?int $firstLogin = null;
    public ?int $lastLogin = null;
    public ?int $lastLogout = null;
    public ?string $monthlyPackageRank = null;
    public ?string $newPackageRank = null;
    public ?string $packageRank = null;
    public ?string $rank = null;
    public ?array $stats = null;
    public ?string $uuid = null;
}

/** Request payload for Player#load. */
class PlayerLoadMatch
{
    public ?string $displayname = null;
    public ?int $firstLogin = null;
    public ?int $lastLogin = null;
    public ?int $lastLogout = null;
    public ?string $monthlyPackageRank = null;
    public ?string $newPackageRank = null;
    public ?string $packageRank = null;
    public ?string $rank = null;
    public ?array $stats = null;
    public ?string $uuid = null;
}

/** PlayerData entity data model. */
class PlayerData
{
    public ?int $date = null;
    public ?int $ended = null;
    public ?string $gameType = null;
    public ?string $map = null;
    public ?string $mode = null;
    public ?bool $online = null;
}

/** Request payload for PlayerData#load. */
class PlayerDataLoadMatch
{
    public ?int $date = null;
    public ?int $ended = null;
    public ?string $gameType = null;
    public ?string $map = null;
    public ?string $mode = null;
    public ?bool $online = null;
}

/** Request payload for PlayerData#list. */
class PlayerDataListMatch
{
    public ?int $date = null;
    public ?int $ended = null;
    public ?string $gameType = null;
    public ?string $map = null;
    public ?string $mode = null;
    public ?bool $online = null;
}

/** Resource entity data model. */
class Resource
{
    public ?string $databaseName = null;
    public ?int $id = null;
    public ?int $lastUpdated = null;
    public ?array $modeNames = null;
    public ?string $name = null;
    public ?array $one_time = null;
    public ?array $rarities = null;
    public ?bool $success = null;
    public ?array $tiered = null;
    public ?array $types = null;
}

/** Request payload for Resource#load. */
class ResourceLoadMatch
{
    public ?string $databaseName = null;
    public int $id;
    public ?int $lastUpdated = null;
    public ?array $modeNames = null;
    public ?string $name = null;
    public ?array $one_time = null;
    public ?array $rarities = null;
    public ?bool $success = null;
    public ?array $tiered = null;
    public ?array $types = null;
}

/** SkyBlock entity data model. */
class SkyBlock
{
    public ?string $auctioneer = null;
    public ?array $auctions = null;
    public ?array $bids = null;
    public ?string $category = null;
    public ?bool $claimed = null;
    public ?array $claimed_bidders = null;
    public ?string $color = null;
    public ?array $coop = null;
    public ?array $current = null;
    public ?int $end = null;
    public ?array $events = null;
    public ?string $extra = null;
    public ?array $fullLore = null;
    public ?int $highest_bid_amount = null;
    public ?string $id = null;
    public ?array $item = null;
    public ?array $item_bytes = null;
    public ?string $item_lore = null;
    public ?string $item_name = null;
    public ?int $lastUpdated = null;
    public ?string $link = null;
    public ?string $lore = null;
    public ?string $material = null;
    public ?array $mayor = null;
    public ?string $name = null;
    public ?float $npc_sell_price = null;
    public ?int $page = null;
    public ?string $profile_id = null;
    public ?array $profiles = null;
    public ?int $progress = null;
    public ?int $requiredAmount = null;
    public ?array $sales = null;
    public ?int $start = null;
    public ?int $starting_bid = null;
    public ?array $stats = null;
    public ?bool $success = null;
    public ?string $text = null;
    public ?string $tier = null;
    public ?array $tiers = null;
    public ?string $title = null;
    public ?int $totalAuctions = null;
    public ?int $totalPages = null;
    public ?string $uuid = null;
}

/** Request payload for SkyBlock#load. */
class SkyBlockLoadMatch
{
    public ?string $auctioneer = null;
    public ?array $auctions = null;
    public ?array $bids = null;
    public ?string $category = null;
    public ?bool $claimed = null;
    public ?array $claimed_bidders = null;
    public ?string $color = null;
    public ?array $coop = null;
    public ?array $current = null;
    public ?int $end = null;
    public ?array $events = null;
    public ?string $extra = null;
    public ?array $fullLore = null;
    public ?int $highest_bid_amount = null;
    public string $id;
    public ?array $item = null;
    public ?array $item_bytes = null;
    public ?string $item_lore = null;
    public ?string $item_name = null;
    public ?int $lastUpdated = null;
    public ?string $link = null;
    public ?string $lore = null;
    public ?string $material = null;
    public ?array $mayor = null;
    public ?string $name = null;
    public ?float $npc_sell_price = null;
    public ?int $page = null;
    public ?string $profile_id = null;
    public ?array $profiles = null;
    public ?int $progress = null;
    public ?int $requiredAmount = null;
    public ?array $sales = null;
    public ?int $start = null;
    public ?int $starting_bid = null;
    public ?array $stats = null;
    public ?bool $success = null;
    public ?string $text = null;
    public ?string $tier = null;
    public ?array $tiers = null;
    public ?string $title = null;
    public ?int $totalAuctions = null;
    public ?int $totalPages = null;
    public ?string $uuid = null;
}

/** Request payload for SkyBlock#list. */
class SkyBlockListMatch
{
    public ?string $auctioneer = null;
    public ?array $auctions = null;
    public ?array $bids = null;
    public ?string $category = null;
    public ?bool $claimed = null;
    public ?array $claimed_bidders = null;
    public ?string $color = null;
    public ?array $coop = null;
    public ?array $current = null;
    public ?int $end = null;
    public ?array $events = null;
    public ?string $extra = null;
    public ?array $fullLore = null;
    public ?int $highest_bid_amount = null;
    public ?string $id = null;
    public ?array $item = null;
    public ?array $item_bytes = null;
    public ?string $item_lore = null;
    public ?string $item_name = null;
    public ?int $lastUpdated = null;
    public ?string $link = null;
    public ?string $lore = null;
    public ?string $material = null;
    public ?array $mayor = null;
    public ?string $name = null;
    public ?float $npc_sell_price = null;
    public ?int $page = null;
    public ?string $profile_id = null;
    public ?array $profiles = null;
    public ?int $progress = null;
    public ?int $requiredAmount = null;
    public ?array $sales = null;
    public ?int $start = null;
    public ?int $starting_bid = null;
    public ?array $stats = null;
    public ?bool $success = null;
    public ?string $text = null;
    public ?string $tier = null;
    public ?array $tiers = null;
    public ?string $title = null;
    public ?int $totalAuctions = null;
    public ?int $totalPages = null;
    public ?string $uuid = null;
}

