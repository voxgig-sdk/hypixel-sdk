-- Hypixel SDK error

local HypixelError = {}
HypixelError.__index = HypixelError


function HypixelError.new(code, msg, ctx)
  local self = setmetatable({}, HypixelError)
  self.is_sdk_error = true
  self.sdk = "Hypixel"
  self.code = code or ""
  self.msg = msg or ""
  self.ctx = ctx
  self.result = nil
  self.spec = nil
  return self
end


function HypixelError:error()
  return self.msg
end


function HypixelError:__tostring()
  return self.msg
end


return HypixelError
