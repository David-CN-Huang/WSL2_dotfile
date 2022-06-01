---------------------------------------------------------------------------------------------------
-- Generic, global, default
---------------------------------------------------------------------------------------------------
_G.mycode = {
  env = {}
}

--------------
-- function --
--------------
local path_sep = vim.loop.os_uname().version:match "Windows" and "\\" or "/"

local make_path = function(...)
  local result = table.concat({ ... }, path_sep)
  return result
end

-- reference LaurVim
-- Gets a list of dictionaries representing attached UIs.
mycode.is_in_headless = function()
  return #vim.api.nvim_list_uis() == 0
end

-- reference NvChad
mycode.lazy_load = function(plugin, timer)
  if plugin then
    timer = timer or 0
    vim.defer_fn(function()
      require("packer").loader(plugin)
    end, timer)
  end
end

mycode.load_keymaps = function(keymaps)
  require("mycode.keymappings").load_keymaps(keymaps)
end

-------------
-- params. --
-------------
mycode.env.dir = {
  runtime = vim.fn.stdpath "data",
  config  = vim.fn.stdpath "config",
  cache   = vim.fn.stdpath "cache",
  vsnip   = make_path(vim.loop.os_homedir(), ".config", "snippets"),
  undo    = make_path(vim.fn.stdpath "cache", "undo"),
}

mycode.env.file = {
  spell    = make_path(mycode.env.dir.config, "spell", "en.utf-8.add"),
  shada    = make_path(mycode.env.dir.cache, "mycode.shada"),
}

mycode.packer = {
  dir      = make_path(mycode.env.dir.runtime, "site", "pack"),
  install  = make_path(mycode.env.dir.runtime, "site", "pack", "packer", "start", "packer.nvim"),
  compiled = make_path(mycode.env.dir.config, "plugin", "packer_compiled.lua"),
  snapshot = make_path(mycode.env.dir.cache, "snapshots"),
}

mycode.ui = {
  colorscheme = "onedarker",
  transparent = true,
  use_icons = true,
}

mycode.opts = {
  leader = " ",
}

mycode.plugins = {}

mycode.keys = {}
