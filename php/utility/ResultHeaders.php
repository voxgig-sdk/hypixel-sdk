<?php
declare(strict_types=1);

// Hypixel SDK utility: result_headers

class HypixelResultHeaders
{
    public static function call(HypixelContext $ctx): ?HypixelResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result) {
            if ($response && is_array($response->headers)) {
                $result->headers = $response->headers;
            } else {
                $result->headers = [];
            }
        }
        return $result;
    }
}
