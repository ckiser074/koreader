local util = require("ffi/util")
local Version = require("version")

local function probeDevice()
    local platform = Version:getCurrentPlatform()
    if platform and platform:sub(1, #"android") == "android" then
        return require("device/android/device")
    end
    if util.loadSDL3() then
        return require("device/sdl/device")
    end
    error("Could not find hardware abstraction for this platform. Supported platforms are Android and Linux (SDL).")
end

local dev = probeDevice()
dev:init()
return dev
