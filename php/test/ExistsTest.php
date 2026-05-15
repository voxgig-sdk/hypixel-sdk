<?php
declare(strict_types=1);

// Hypixel SDK exists test

require_once __DIR__ . '/../hypixel_sdk.php';

use PHPUnit\Framework\TestCase;

class ExistsTest extends TestCase
{
    public function test_create_test_sdk(): void
    {
        $testsdk = HypixelSDK::test(null, null);
        $this->assertNotNull($testsdk);
    }
}
