<?php
declare(strict_types=1);

// Hypixel SDK feature factory

require_once __DIR__ . '/feature/BaseFeature.php';
require_once __DIR__ . '/feature/TestFeature.php';


class HypixelFeatures
{
    public static function make_feature(string $name)
    {
        switch ($name) {
            case "base":
                return new HypixelBaseFeature();
            case "test":
                return new HypixelTestFeature();
            default:
                return new HypixelBaseFeature();
        }
    }
}
