<?php
declare(strict_types=1);

// Hypixel SDK utility: result_body

class HypixelResultBody
{
    public static function call(HypixelContext $ctx): ?HypixelResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result && $response && $response->json_func && $response->body) {
            $result->body = ($response->json_func)();
        }
        return $result;
    }
}
