---------------------------------------------------------------------------------------------------
-- The entry point of my-code
---------------------------------------------------------------------------------------------------
local init_path = debug.getinfo(1, "S").source:sub(2)
local base_dir = init_path:match("(.*[/\\])"):sub(1, -2)

if not vim.tbl_contains(vim.opt.rtp:get(), base_dir) then
  vim.opt.rtp:append(base_dir)
end

local bootstrap = {
  "impatient",    -- Speed up loading Lua modules in Neovim to startup time.
  "utils",        -- Util function
  "options",      -- Neovim options, ex. set number ... etc.
  "keymappings",  -- load default keymappings
  "colorscheme",  -- Colorscheme settings
  "packer",       -- Handle packer and process plugins
--  "command",        --
}

for k, v in pairs(bootstrap) do
  local ok, _ = pcall(require, "core." .. v)
  if not ok then
    print("Bootstrap failed, case of " .. v)
  end
end
