import { GuildEntity } from './entity/GuildEntity';
import { HousingEntity } from './entity/HousingEntity';
import { OtherEntity } from './entity/OtherEntity';
import { PlayerEntity } from './entity/PlayerEntity';
import { PlayerDataEntity } from './entity/PlayerDataEntity';
import { ResourceEntity } from './entity/ResourceEntity';
import { SkyBlockEntity } from './entity/SkyBlockEntity';
export type * from './HypixelTypes';
import { inspect } from 'node:util';
import type { Context, Feature } from './types';
import { config } from './Config';
import { HypixelEntityBase } from './HypixelEntityBase';
import { Utility } from './utility/Utility';
import { BaseFeature } from './feature/base/BaseFeature';
declare const stdutil: Utility;
declare class HypixelSDK {
    _mode: string;
    _options: any;
    _utility: Utility;
    _features: Feature[];
    _rootctx: Context;
    constructor(options?: any);
    options(): any;
    utility(): any;
    prepare(fetchargs?: any): Promise<any>;
    direct(fetchargs?: any): Promise<Error | {
        ok: boolean;
        status: number;
        headers: any;
        data: any;
        err?: undefined;
    } | {
        ok: boolean;
        err: any;
        status?: undefined;
        headers?: undefined;
        data?: undefined;
    }>;
    _rawRequest(fetchargs?: any): Promise<Error | {
        ok: boolean;
        status: number;
        headers: any;
        data: any;
        err?: undefined;
    } | {
        ok: boolean;
        err: any;
        status?: undefined;
        headers?: undefined;
        data?: undefined;
    }>;
    graphql(query: string, variables?: any, ctrl?: any): Promise<any>;
    Guild(entopts?: Record<string, any>): GuildEntity;
    Housing(entopts?: Record<string, any>): HousingEntity;
    Other(entopts?: Record<string, any>): OtherEntity;
    Player(entopts?: Record<string, any>): PlayerEntity;
    PlayerData(entopts?: Record<string, any>): PlayerDataEntity;
    Resource(entopts?: Record<string, any>): ResourceEntity;
    SkyBlock(entopts?: Record<string, any>): SkyBlockEntity;
    static test(testoptsarg?: any, sdkoptsarg?: any): HypixelSDK;
    tester(testopts?: any, sdkopts?: any): HypixelSDK;
    toJSON(): {
        name: string;
    };
    toString(): string;
    [inspect.custom](): string;
}
declare const SDK: typeof HypixelSDK;
export { stdutil, config, BaseFeature, HypixelEntityBase, HypixelSDK, SDK, };
