# Hypixel SDK utility: make_context
require_relative '../core/context'
module HypixelUtilities
  MakeContext = ->(ctxmap, basectx) {
    HypixelContext.new(ctxmap, basectx)
  }
end
