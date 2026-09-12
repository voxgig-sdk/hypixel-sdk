import { HypixelEntityBase } from '../HypixelEntityBase';
import type { HypixelSDK } from '../HypixelSDK';
import type { Control } from '../types';
import type { SkyBlock, SkyBlockLoadMatch, SkyBlockListMatch } from '../HypixelTypes';
declare class SkyBlockEntity extends HypixelEntityBase<SkyBlock> {
    constructor(client: HypixelSDK, entopts: any);
    make(this: SkyBlockEntity): SkyBlockEntity;
    load(this: any, reqmatch?: SkyBlockLoadMatch, ctrl?: Control): Promise<SkyBlockEntity>;
    list(this: any, reqmatch?: SkyBlockListMatch, ctrl?: Control): Promise<SkyBlockEntity[]>;
}
export { SkyBlockEntity };
