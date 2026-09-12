import { HypixelEntityBase } from '../HypixelEntityBase';
import type { HypixelSDK } from '../HypixelSDK';
import type { Control } from '../types';
import type { Resource, ResourceLoadMatch } from '../HypixelTypes';
declare class ResourceEntity extends HypixelEntityBase<Resource> {
    constructor(client: HypixelSDK, entopts: any);
    make(this: ResourceEntity): ResourceEntity;
    load(this: any, reqmatch?: ResourceLoadMatch, ctrl?: Control): Promise<ResourceEntity>;
}
export { ResourceEntity };
