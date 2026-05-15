<?php
declare(strict_types=1);

// Hypixel SDK utility: prepare_body

class HypixelPrepareBody
{
    public static function call(HypixelContext $ctx): mixed
    {
        if ($ctx->op->input === 'data') {
            return ($ctx->utility->transform_request)($ctx);
        }
        return null;
    }
}
