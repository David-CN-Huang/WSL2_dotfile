---------------------------------------------------------------------------------------------------
-- The entry point of my-code
---------------------------------------------------------------------------------------------------
-- find the path and dir of my-code. 
-- path_init = ~/.config/nvim/lua/mycode/init.lua
-- dir_base  = ~/.config/nvim/lua/mycode
local path_init = debug.getinfo(1, "S").source:sub(2)
local dir_base = path_init:match("(.*[/\\])"):sub(1, -2)

-- Append the my-code path into nvim's enviornment.
if not vim.tbl_contains(vim.opt.rtp:get(), dir_base) then
  vim.opt.rtp:append(dir_base)
end

-- bootstap ---------------------------------------------------------------------------------------
local bootstrap = {
  "impatient",      -- Speed up loading Lua modules in Neovim to startup time.
  "utils",          -- Util function
  "environment",    -- Global variable using to recording and transfer information.
  "option",         -- Neovim options, ex. set number ... etc.
  "keymapping",     -- Neovim keybind
  "colorscheme",    -- Colorscheme settings
  "plugin",         -- Process plugins
--  "command",        --
}

for _, module in pairs(bootstrap) do
  local ok, err = pcall(require, "core." .. module)
  if not ok then
    vim.notify("Boot failed, case of " .. err)
  end
end 
