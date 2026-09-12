import { HypixelEntityBase } from '../HypixelEntityBase';
import type { HypixelSDK } from '../HypixelSDK';
import type { Control } from '../types';
import type { Guild, GuildLoadMatch } from '../HypixelTypes';
declare class GuildEntity extends HypixelEntityBase<Guild> {
    constructor(client: HypixelSDK, entopts: any);
    make(this: GuildEntity): GuildEntity;
    load(this: any, reqmatch?: GuildLoadMatch, ctrl?: Control): Promise<GuildEntity>;
}
export { GuildEntity };
