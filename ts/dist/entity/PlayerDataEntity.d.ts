import { HypixelEntityBase } from '../HypixelEntityBase';
import type { HypixelSDK } from '../HypixelSDK';
import type { Control } from '../types';
import type { PlayerData, PlayerDataLoadMatch, PlayerDataListMatch } from '../HypixelTypes';
declare class PlayerDataEntity extends HypixelEntityBase<PlayerData> {
    constructor(client: HypixelSDK, entopts: any);
    make(this: PlayerDataEntity): PlayerDataEntity;
    load(this: any, reqmatch?: PlayerDataLoadMatch, ctrl?: Control): Promise<PlayerDataEntity>;
    list(this: any, reqmatch?: PlayerDataListMatch, ctrl?: Control): Promise<PlayerDataEntity[]>;
}
export { PlayerDataEntity };
