---------------------------------------------------------------------------------------------------
-- The environment of the my-code.
---------------------------------------------------------------------------------------------------
_G.mycode = {}

mycode.env = {
  dir = {
    root    = (debug.getinfo(1, "S").source:sub(2)):match("(.*[/\\])"):sub(1, -string.len("/lua/config/")+1),
    runtime = get_dir_runtime(),
    config  = get_dir_config(),
    cache   = get_dir_cache(),
    vsnip   = join_paths(vim.loop.os_homedir(), ".config", "snippets"),
    undo    = join_paths(get_dir_cache(), "undo"),
  },
  file = {
    spell    = join_paths(get_dir_config(), "spell", "en.utf-8.add"),
    shada    = join_paths(get_dir_cache(), "mycode.shada"),
  }
}

mycode.packer = {
  dir          = join_paths(get_dir_runtime(), "site", "pack"),
  install      = join_paths(get_dir_runtime(), "site", "pack", "packer", "start", "packer.nvim"),
  compiled     = join_paths(get_dir_config(), "plugin", "packer_compiled.lua"),
  snapshot     = join_paths(get_dir_cache(), "snapshots"),
  snapshot_def = join_paths(get_dir_cache(), "snapshots", "default.json"),
}

mycode.infra = { }

mycode.ui = {
  colorscheme = "onedarker",
  transparent = true,
  use_icons = true,
}

mycode.log = {
  ---@usage can be { "trace", "debug", "info", "warn", "error", "fatal" },
  level = "warn",
  viewer = {
    ---@usage this will fallback on "less +F" if not found
    cmd = "lnav",
    layout_config = {
      ---@usage direction = 'vertical' | 'horizontal' | 'window' | 'float',
      direction = "horizontal",
      open_mapping = "",
      size = 40,
      float_opts = {},
    },
  },
  -- currently disabled due to instabilities
  override_notify = false,
}

mycode.opts = {
  leader = "space",
} 

mycode.keys = {}

mycode.plugins = {
  override = {},
}

mycode.autocommands = {}
