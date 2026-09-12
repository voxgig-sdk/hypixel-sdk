import { HypixelEntityBase } from '../HypixelEntityBase';
import type { HypixelSDK } from '../HypixelSDK';
import type { Control } from '../types';
import type { Player, PlayerLoadMatch } from '../HypixelTypes';
declare class PlayerEntity extends HypixelEntityBase<Player> {
    constructor(client: HypixelSDK, entopts: any);
    make(this: PlayerEntity): PlayerEntity;
    load(this: any, reqmatch?: PlayerLoadMatch, ctrl?: Control): Promise<PlayerEntity>;
}
export { PlayerEntity };
