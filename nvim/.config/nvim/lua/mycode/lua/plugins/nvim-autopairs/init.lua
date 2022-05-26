local Log = require "core.log"

local M = {}

M.setup = function(module)
  mycode.infra[module] = {
    ---@usage  modifies the function or method delimiter by filetypes
    map_char = {
      all = "(",
      tex = "{",
    },
    ---@usage check bracket in same line
    enable_check_bracket_line = false,
    ---@usage check treesitter
    check_ts = true,
    ts_config = {
      lua = { "string", "source" },
      javascript = { "string", "template_string" },
      java = false,
    },
    disable_filetype = { "TelescopePrompt", "spectre_panel" },
    ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]], "%s+", ""),
    enable_moveright = true,
    ---@usage disable when recording or executing a macro
    disable_in_macro = false,
    ---@usage add bracket pairs after quote
    enable_afterquote = true,
    ---@usage map the <BS> key
    map_bs = true,
    ---@usage map <c-w> to delete a pair if possible
    map_c_w = false,
    ---@usage disable when insert after visual block mode
    disable_in_visualblock = false,
    ---@usage  change default fast_wrap
    fast_wrap = {
      map = "<M-e>",
      chars = { "{", "[", "(", '"', "'" },
      pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
      offset = 0, -- Offset from pattern match
      end_key = "$",
      keys = "qwertyuiopzxcvbnmasdfghjkl",
      check_comma = true,
      highlight = "Search",
      highlight_grey = "Comment",
    },  
  }
end

M.config = function(module)
  local autopairs = require "nvim-autopairs"
  local Rule = require "nvim-autopairs.rule"

  autopairs.setup {
    check_ts = mycode.infra[module].check_ts,
    enable_check_bracket_line = mycode.infra[module].enable_check_bracket_line,
    ts_config = mycode.infra[module].ts_config,
    disable_filetype = mycode.infra[module].disable_filetype,
    disable_in_macro = mycode.infra[module].disable_in_macro,
    ignored_next_char = mycode.infra[module].ignored_next_char,
    enable_moveright = mycode.infra[module].enable_moveright,
    enable_afterquote = mycode.infra[module].enable_afterquote,
    map_c_w = mycode.infra[module].map_c_w,
    map_bs = mycode.infra[module].map_bs,
    disable_in_visualblock = mycode.infra[module].disable_in_visualblock,
    fast_wrap = mycode.infra[module].fast_wrap,
  }

  pcall(function()
    require("nvim-treesitter.configs").setup { autopairs = { enable = true } }
  end)

  local ts_conds = require "nvim-autopairs.ts-conds"

  -- TODO: can these rules be safely added from "config.lua" ?
  -- press % => %% is only inside comment or string
  autopairs.add_rules {
    Rule("%", "%", "lua"):with_pair(ts_conds.is_ts_node { "string", "comment" }),
    Rule("$", "$", "lua"):with_pair(ts_conds.is_not_ts_node { "function" }),
  }
end

return M