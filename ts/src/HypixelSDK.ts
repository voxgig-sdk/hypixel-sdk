// Hypixel Ts SDK

import { GuildEntity } from './entity/GuildEntity'
import { HousingEntity } from './entity/HousingEntity'
import { OtherEntity } from './entity/OtherEntity'
import { PlayerEntity } from './entity/PlayerEntity'
import { PlayerDataEntity } from './entity/PlayerDataEntity'
import { ResourceEntity } from './entity/ResourceEntity'
import { SkyBlockEntity } from './entity/SkyBlockEntity'

export type * from './HypixelTypes'


import { inspect } from 'node:util'

import type { Context, Feature } from './types'

import { config } from './Config'
import { HypixelEntityBase } from './HypixelEntityBase'
import { Utility } from './utility/Utility'


import { BaseFeature } from './feature/base/BaseFeature'


const stdutil = new Utility()


class HypixelSDK {
  _mode: string = 'live'
  _options: any
  _utility = new Utility()
  _features: Feature[]
  _rootctx: Context

  constructor(options?: any) {

    this._rootctx = this._utility.makeContext({
      client: this,
      utility: this._utility,
      config,
      options,
      shared: new WeakMap()
    })

    this._options = this._utility.makeOptions(this._rootctx)

    const struct = this._utility.struct
    const getpath = struct.getpath
    const items = struct.items

    if (true === getpath(this._options.feature, 'test.active')) {
      this._mode = 'test'
    }

    this._rootctx.options = this._options

    this._features = []

    const featureAdd = this._utility.featureAdd
    const featureInit = this._utility.featureInit

    items(this._options.feature, (fitem: [string, any]) => {
      const fname = fitem[0]
      const fopts = fitem[1]
      if (fopts.active) {
        featureAdd(this._rootctx, this._rootctx.config.makeFeature(fname))
      }
    })

    if (null != this._options.extend) {
      for (let f of this._options.extend) {
        featureAdd(this._rootctx, f)
      }
    }

    for (let f of this._features) {
      featureInit(this._rootctx, f)
    }

    const featureHook = this._utility.featureHook
    featureHook(this._rootctx, 'PostConstruct')
  }


  options() {
    return this._utility.struct.clone(this._options)
  }


  utility() {
    return this._utility.struct.clone(this._utility)
  }


  async prepare(fetchargs?: any) {
    const utility = this._utility
    const struct = utility.struct
    const clone = struct.clone

    const {
      makeContext,
      makeFetchDef,
      prepareHeaders,
      prepareAuth,
    } = utility

    fetchargs = fetchargs || {}

    let ctx: Context = makeContext({
      opname: 'prepare',
      ctrl: fetchargs.ctrl || {},
    }, this._rootctx)

    const options = this._options

    // Build spec directly from SDK options + user-provided fetch args.
    const spec: any = {
      base: options.base,
      prefix: options.prefix,
      suffix: options.suffix,
      path: fetchargs.path || '',
      method: fetchargs.method || 'GET',
      params: fetchargs.params || {},
      query: fetchargs.query || {},
      headers: prepareHeaders(ctx),
      body: fetchargs.body,
      step: 'start',
    }

    ctx.spec = spec

    // Merge user-provided headers over SDK defaults.
    if (fetchargs.headers) {
      const uheaders = fetchargs.headers
      for (let key in uheaders) {
        spec.headers[key] = uheaders[key]
      }
    }

    // Apply SDK auth (apikey, auth prefix, etc.)
    const authResult = prepareAuth(ctx)
    if (authResult instanceof Error) {
      return authResult
    }

    return makeFetchDef(ctx)
  }


  async direct(fetchargs?: any) {
    const utility = this._utility
    const fetcher = utility.fetcher
    const makeContext = utility.makeContext

    const fetchdef = await this.prepare(fetchargs)
    if (fetchdef instanceof Error) {
      return fetchdef
    }

    let ctx: Context = makeContext({
      opname: 'direct',
      ctrl: (fetchargs || {}).ctrl || {},
    }, this._rootctx)

    try {
      const fetched = await fetcher(ctx, fetchdef.url, fetchdef)

      if (null == fetched) {
        return { ok: false, err: ctx.error('direct_no_response', 'response: undefined') }
      }
      else if (fetched instanceof Error) {
        return { ok: false, err: fetched }
      }

      const status = fetched.status

      // No body responses (204 No Content, 304 Not Modified) and explicit
      // zero content-length must skip JSON parsing — fetched.json() would
      // throw `Unexpected end of JSON input` on an empty body.
      const headers = fetched.headers
      const contentLength = headers && 'function' === typeof headers.get
        ? headers.get('content-length')
        : (headers || {})['content-length']
      const noBody = 204 === status || 304 === status || '0' === String(contentLength)

      let json: any = undefined
      if (!noBody) {
        try {
          json = 'function' === typeof fetched.json ? await fetched.json() : fetched.json
        }
        catch (parseErr) {
          // Body wasn't valid JSON — surface the raw response rather than
          // throwing. data stays undefined; callers can inspect status/headers.
          json = undefined
        }
      }

      return {
        ok: status >= 200 && status < 300,
        status,
        headers: fetched.headers,
        data: json,
      }
    }
    catch (err: any) {
      return { ok: false, err }
    }
  }



  _guild?: GuildEntity

  // Idiomatic facade: `client.guild.list()` / `client.guild.load({ id })`.
  get guild(): GuildEntity {
    return (this._guild ??= new GuildEntity(this, undefined))
  }

  /** @deprecated Use `client.guild` instead. */
  Guild(data?: any) {
    const self = this
    return new GuildEntity(self,data)
  }


  _housing?: HousingEntity

  // Idiomatic facade: `client.housing.list()` / `client.housing.load({ id })`.
  get housing(): HousingEntity {
    return (this._housing ??= new HousingEntity(this, undefined))
  }

  /** @deprecated Use `client.housing` instead. */
  Housing(data?: any) {
    const self = this
    return new HousingEntity(self,data)
  }


  _other?: OtherEntity

  // Idiomatic facade: `client.other.list()` / `client.other.load({ id })`.
  get other(): OtherEntity {
    return (this._other ??= new OtherEntity(this, undefined))
  }

  /** @deprecated Use `client.other` instead. */
  Other(data?: any) {
    const self = this
    return new OtherEntity(self,data)
  }


  _player?: PlayerEntity

  // Idiomatic facade: `client.player.list()` / `client.player.load({ id })`.
  get player(): PlayerEntity {
    return (this._player ??= new PlayerEntity(this, undefined))
  }

  /** @deprecated Use `client.player` instead. */
  Player(data?: any) {
    const self = this
    return new PlayerEntity(self,data)
  }


  _player_data?: PlayerDataEntity

  // Idiomatic facade: `client.player_data.list()` / `client.player_data.load({ id })`.
  get player_data(): PlayerDataEntity {
    return (this._player_data ??= new PlayerDataEntity(this, undefined))
  }

  /** @deprecated Use `client.player_data` instead. */
  PlayerData(data?: any) {
    const self = this
    return new PlayerDataEntity(self,data)
  }


  _resource?: ResourceEntity

  // Idiomatic facade: `client.resource.list()` / `client.resource.load({ id })`.
  get resource(): ResourceEntity {
    return (this._resource ??= new ResourceEntity(this, undefined))
  }

  /** @deprecated Use `client.resource` instead. */
  Resource(data?: any) {
    const self = this
    return new ResourceEntity(self,data)
  }


  _sky_block?: SkyBlockEntity

  // Idiomatic facade: `client.sky_block.list()` / `client.sky_block.load({ id })`.
  get sky_block(): SkyBlockEntity {
    return (this._sky_block ??= new SkyBlockEntity(this, undefined))
  }

  /** @deprecated Use `client.sky_block` instead. */
  SkyBlock(data?: any) {
    const self = this
    return new SkyBlockEntity(self,data)
  }




  static test(testoptsarg?: any, sdkoptsarg?: any) {
    const struct = stdutil.struct
    const setpath = struct.setpath
    const getdef = struct.getdef
    const clone = struct.clone
    const setprop = struct.setprop

    const sdkopts = getdef(clone(sdkoptsarg), {})
    const testopts = getdef(clone(testoptsarg), {})
    setprop(testopts, 'active', true)
    setpath(sdkopts, 'feature.test', testopts)

    const testsdk = new HypixelSDK(sdkopts)
    testsdk._mode = 'test'

    return testsdk
  }


  tester(testopts?: any, sdkopts?: any) {
    return HypixelSDK.test(testopts, sdkopts)
  }


  toJSON() {
    return { name: 'Hypixel' }
  }

  toString() {
    return 'Hypixel ' + this._utility.struct.jsonify(this.toJSON())
  }

  [inspect.custom]() {
    return this.toString()
  }

}




const SDK = HypixelSDK


export {
  stdutil,

  BaseFeature,
  HypixelEntityBase,

  HypixelSDK,
  SDK,
}


