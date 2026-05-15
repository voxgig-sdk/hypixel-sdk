<?php
declare(strict_types=1);

// Hypixel SDK utility: feature_add

class HypixelFeatureAdd
{
    public static function call(HypixelContext $ctx, mixed $f): void
    {
        $ctx->client->features[] = $f;
    }
}
