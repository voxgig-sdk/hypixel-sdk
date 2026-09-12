import { HypixelEntityBase } from '../HypixelEntityBase';
import type { HypixelSDK } from '../HypixelSDK';
import type { Control } from '../types';
import type { Other, OtherLoadMatch, OtherListMatch } from '../HypixelTypes';
declare class OtherEntity extends HypixelEntityBase<Other> {
    constructor(client: HypixelSDK, entopts: any);
    make(this: OtherEntity): OtherEntity;
    load(this: any, reqmatch?: OtherLoadMatch, ctrl?: Control): Promise<OtherEntity>;
    list(this: any, reqmatch?: OtherListMatch, ctrl?: Control): Promise<OtherEntity[]>;
}
export { OtherEntity };
