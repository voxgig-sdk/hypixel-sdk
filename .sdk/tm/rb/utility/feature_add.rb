# Hypixel SDK utility: feature_add
module HypixelUtilities
  FeatureAdd = ->(ctx, f) {
    ctx.client.features << f
  }
end
