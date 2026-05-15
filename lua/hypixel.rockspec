package = "voxgig-sdk-hypixel"
version = "0.0-1"
source = {
  url = "git://github.com/voxgig-sdk/hypixel-sdk.git"
}
description = {
  summary = "Hypixel SDK for Lua",
  license = "MIT"
}
dependencies = {
  "lua >= 5.3",
  "dkjson >= 2.5",
  "dkjson >= 2.5",
}
build = {
  type = "builtin",
  modules = {
    ["hypixel_sdk"] = "hypixel_sdk.lua",
    ["config"] = "config.lua",
    ["features"] = "features.lua",
  }
}
