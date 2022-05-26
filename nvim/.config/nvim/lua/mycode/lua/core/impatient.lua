--------------------------------------------------------------------------------------------------
-- Speed up loading Lua modules in Neovim to improve startup time.
---------------------------------------------------------------------------------------------------
local ok, impatient = pcall(require, impatient)

if ok then
  impatient.enable_profile()
end
