<?php
declare(strict_types=1);

// Hypixel SDK utility: make_context

require_once __DIR__ . '/../core/Context.php';

class HypixelMakeContext
{
    public static function call(array $ctxmap, ?HypixelContext $basectx): HypixelContext
    {
        return new HypixelContext($ctxmap, $basectx);
    }
}
