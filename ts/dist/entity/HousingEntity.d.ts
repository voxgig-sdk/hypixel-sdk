import { HypixelEntityBase } from '../HypixelEntityBase';
import type { HypixelSDK } from '../HypixelSDK';
import type { Control } from '../types';
import type { Housing, HousingLoadMatch, HousingListMatch } from '../HypixelTypes';
declare class HousingEntity extends HypixelEntityBase<Housing> {
    constructor(client: HypixelSDK, entopts: any);
    make(this: HousingEntity): HousingEntity;
    load(this: any, reqmatch?: HousingLoadMatch, ctrl?: Control): Promise<HousingEntity>;
    list(this: any, reqmatch?: HousingListMatch, ctrl?: Control): Promise<HousingEntity[]>;
}
export { HousingEntity };
