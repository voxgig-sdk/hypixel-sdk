# Hypixel SDK

require_relative 'utility/struct/voxgig_struct'
require_relative 'core/utility_type'
require_relative 'core/spec'
require_relative 'core/helpers'

# Load utility registration
require_relative 'utility/register'

# Load config and features
require_relative 'config'
require_relative 'feature/base_feature'
require_relative 'features'

# Load typed models (Struct value objects).
require_relative 'Hypixel_types'


class HypixelSDK
  attr_accessor :mode, :features, :options

  def initialize(options = {})
    @mode = "live"
    @features = []
    @options = nil

    utility = HypixelUtility.new
    @_utility = utility

    config = HypixelConfig.make_config

    @_rootctx = utility.make_context.call({
      "client" => self,
      "utility" => utility,
      "config" => config,
      "options" => options || {},
      "shared" => {},
    }, nil)

    @options = utility.make_options.call(@_rootctx)

    if VoxgigStruct.getpath(@options, "feature.test.active") == true
      @mode = "test"
    end

    @_rootctx.options = @options

    # Add features from config.
    feature_opts = HypixelHelpers.to_map(VoxgigStruct.getprop(@options, "feature"))
    if feature_opts
      items = VoxgigStruct.items(feature_opts)
      if items
        items.each do |item|
          fname = item[0]
          fopts = HypixelHelpers.to_map(item[1])
          if fopts && fopts["active"] == true
            utility.feature_add.call(@_rootctx, HypixelFeatures.make_feature(fname))
          end
        end
      end
    end

    # Add extension features.
    extend_val = VoxgigStruct.getprop(@options, "extend")
    if extend_val.is_a?(Array)
      extend_val.each do |f|
        if f.respond_to?(:get_name)
          utility.feature_add.call(@_rootctx, f)
        end
      end
    end

    # Initialize features.
    @features.each do |f|
      utility.feature_init.call(@_rootctx, f)
    end

    utility.feature_hook.call(@_rootctx, "PostConstruct")
  end

  def options_map
    out = VoxgigStruct.clone(@options)
    out.is_a?(Hash) ? out : {}
  end

  def get_utility
    HypixelUtility.copy(@_utility)
  end

  def get_root_ctx
    @_rootctx
  end

  def prepare(fetchargs = {})
    utility = @_utility
    fetchargs ||= {}

    ctrl = HypixelHelpers.to_map(VoxgigStruct.getprop(fetchargs, "ctrl")) || {}

    ctx = utility.make_context.call({
      "opname" => "prepare",
      "ctrl" => ctrl,
    }, @_rootctx)

    opts = @options
    path = VoxgigStruct.getprop(fetchargs, "path") || ""
    path = "" unless path.is_a?(String)
    method_val = VoxgigStruct.getprop(fetchargs, "method") || "GET"
    method_val = "GET" unless method_val.is_a?(String)
    params = HypixelHelpers.to_map(VoxgigStruct.getprop(fetchargs, "params")) || {}
    query = HypixelHelpers.to_map(VoxgigStruct.getprop(fetchargs, "query")) || {}
    headers = utility.prepare_headers.call(ctx)

    base = VoxgigStruct.getprop(opts, "base") || ""
    base = "" unless base.is_a?(String)
    prefix = VoxgigStruct.getprop(opts, "prefix") || ""
    prefix = "" unless prefix.is_a?(String)
    suffix = VoxgigStruct.getprop(opts, "suffix") || ""
    suffix = "" unless suffix.is_a?(String)

    ctx.spec = HypixelSpec.new({
      "base" => base, "prefix" => prefix, "suffix" => suffix,
      "path" => path, "method" => method_val,
      "params" => params, "query" => query, "headers" => headers,
      "body" => VoxgigStruct.getprop(fetchargs, "body"),
      "step" => "start",
    })

    # Merge user-provided headers.
    uh = VoxgigStruct.getprop(fetchargs, "headers")
    if uh.is_a?(Hash)
      uh.each { |k, v| ctx.spec.headers[k] = v }
    end

    _, err = utility.prepare_auth.call(ctx)
    raise err if err

    utility.make_fetch_def.call(ctx)
  end

  def direct(fetchargs = {})
    utility = @_utility

    # direct() is the raw-HTTP escape hatch: it always returns a result hash
    # ({ "ok" => ..., ... }) and never raises. prepare() raises on error, so
    # trap that and surface it in the hash.
    begin
      fetchdef = prepare(fetchargs)
    rescue HypixelError => err
      return { "ok" => false, "err" => err }
    end

    fetchargs ||= {}
    ctrl = HypixelHelpers.to_map(VoxgigStruct.getprop(fetchargs, "ctrl")) || {}

    ctx = utility.make_context.call({
      "opname" => "direct",
      "ctrl" => ctrl,
    }, @_rootctx)

    url = fetchdef["url"] || ""
    fetched, fetch_err = utility.fetcher.call(ctx, url, fetchdef)

    return { "ok" => false, "err" => fetch_err } if fetch_err

    if fetched.nil?
      return {
        "ok" => false,
        "err" => ctx.make_error("direct_no_response", "response: undefined"),
      }
    end

    if fetched.is_a?(Hash)
      status = HypixelHelpers.to_int(VoxgigStruct.getprop(fetched, "status"))
      headers = VoxgigStruct.getprop(fetched, "headers") || {}

      # No-body responses (204, 304) and explicit zero content-length must
      # skip JSON parsing — calling json() on an empty body errors.
      content_length = headers.is_a?(Hash) ? headers["content-length"] : nil
      no_body = status == 204 || status == 304 || content_length.to_s == "0"

      json_data = nil
      unless no_body
        jf = VoxgigStruct.getprop(fetched, "json")
        if jf.is_a?(Proc)
          begin
            json_data = jf.call
          rescue StandardError
            # Non-JSON body — leave data nil, keep status/headers.
            json_data = nil
          end
        end
      end

      return {
        "ok" => status >= 200 && status < 300,
        "status" => status,
        "headers" => headers,
        "data" => json_data,
      }
    end

    return {
      "ok" => false,
      "err" => ctx.make_error("direct_invalid", "invalid response type"),
    }
  end


  # Idiomatic facade: client.guild.list / client.guild.load({ "id" => ... })
  def guild
    require_relative 'entity/guild_entity'
    @guild ||= GuildEntity.new(self, nil)
  end

  # Deprecated: use client.guild instead.
  def Guild(data = nil)
    require_relative 'entity/guild_entity'
    GuildEntity.new(self, data)
  end


  # Idiomatic facade: client.housing.list / client.housing.load({ "id" => ... })
  def housing
    require_relative 'entity/housing_entity'
    @housing ||= HousingEntity.new(self, nil)
  end

  # Deprecated: use client.housing instead.
  def Housing(data = nil)
    require_relative 'entity/housing_entity'
    HousingEntity.new(self, data)
  end


  # Idiomatic facade: client.other.list / client.other.load({ "id" => ... })
  def other
    require_relative 'entity/other_entity'
    @other ||= OtherEntity.new(self, nil)
  end

  # Deprecated: use client.other instead.
  def Other(data = nil)
    require_relative 'entity/other_entity'
    OtherEntity.new(self, data)
  end


  # Idiomatic facade: client.player.list / client.player.load({ "id" => ... })
  def player
    require_relative 'entity/player_entity'
    @player ||= PlayerEntity.new(self, nil)
  end

  # Deprecated: use client.player instead.
  def Player(data = nil)
    require_relative 'entity/player_entity'
    PlayerEntity.new(self, data)
  end


  # Idiomatic facade: client.player_data.list / client.player_data.load({ "id" => ... })
  def player_data
    require_relative 'entity/player_data_entity'
    @player_data ||= PlayerDataEntity.new(self, nil)
  end

  # Deprecated: use client.player_data instead.
  def PlayerData(data = nil)
    require_relative 'entity/player_data_entity'
    PlayerDataEntity.new(self, data)
  end


  # Idiomatic facade: client.resource.list / client.resource.load({ "id" => ... })
  def resource
    require_relative 'entity/resource_entity'
    @resource ||= ResourceEntity.new(self, nil)
  end

  # Deprecated: use client.resource instead.
  def Resource(data = nil)
    require_relative 'entity/resource_entity'
    ResourceEntity.new(self, data)
  end


  # Idiomatic facade: client.sky_block.list / client.sky_block.load({ "id" => ... })
  def sky_block
    require_relative 'entity/sky_block_entity'
    @sky_block ||= SkyBlockEntity.new(self, nil)
  end

  # Deprecated: use client.sky_block instead.
  def SkyBlock(data = nil)
    require_relative 'entity/sky_block_entity'
    SkyBlockEntity.new(self, data)
  end



  def self.test(testopts = nil, sdkopts = nil)
    sdkopts = sdkopts || {}
    sdkopts = VoxgigStruct.clone(sdkopts)
    sdkopts = {} unless sdkopts.is_a?(Hash)

    testopts = testopts || {}
    testopts = VoxgigStruct.clone(testopts)
    testopts = {} unless testopts.is_a?(Hash)
    testopts["active"] = true

    VoxgigStruct.setpath(sdkopts, "feature.test", testopts)

    sdk = HypixelSDK.new(sdkopts)
    sdk.mode = "test"
    sdk
  end
end
