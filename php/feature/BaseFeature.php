<?php
declare(strict_types=1);

// Hypixel SDK base feature

class HypixelBaseFeature
{
    public string $version;
    public string $name;
    public bool $active;

    // Positions this feature when added via the client `extend` option:
    // "__before__" / "__after__" / "__replace__" name an already-added
    // feature (mirrors the ts feature `_options`). Declared so setting it
    // on an extension instance avoids the dynamic-property deprecation.
    public ?array $_options = null;

    public function __construct()
    {
        $this->version = '0.0.1';
        $this->name = 'base';
        $this->active = true;
    }

    public function get_version(): string { return $this->version; }
    public function get_name(): string { return $this->name; }
    public function get_active(): bool { return $this->active; }

    public function init(HypixelContext $ctx, array $options): void {}
    public function PostConstruct(HypixelContext $ctx): void {}
    public function PostConstructEntity(HypixelContext $ctx): void {}
    public function SetData(HypixelContext $ctx): void {}
    public function GetData(HypixelContext $ctx): void {}
    public function GetMatch(HypixelContext $ctx): void {}
    public function SetMatch(HypixelContext $ctx): void {}
    public function PrePoint(HypixelContext $ctx): void {}
    public function PreSpec(HypixelContext $ctx): void {}
    public function PreRequest(HypixelContext $ctx): void {}
    public function PreResponse(HypixelContext $ctx): void {}
    public function PreResult(HypixelContext $ctx): void {}
    public function PreDone(HypixelContext $ctx): void {}
    public function PreUnexpected(HypixelContext $ctx): void {}
}
