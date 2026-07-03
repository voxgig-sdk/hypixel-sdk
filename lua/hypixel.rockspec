package = "voxgig-sdk-hypixel"
version = "0.0.1-1"
source = {
  -- git+https (GitHub dropped git:// in 2022); pin the install to the release
  -- tag pushed by `make publish`, and point at the lua/ subdir of the monorepo.
  url = "git+https://github.com/voxgig-sdk/hypixel-sdk.git",
  tag = "lua/v0.0.1",
  dir = "hypixel-sdk/lua"
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
