local Log = require "core.log"

local M = { }

M.setup = function(module)
  local vim_show_icons = mycode.ui.use_icons and 1 or 0
  mycode.infra[module] = {
    setup = {
      disable_netrw = true,
      hijack_netrw = true,
      open_on_setup = false,
      open_on_setup_file = false,
      sort_by = "name",
      ignore_buffer_on_setup = false,
      ignore_ft_on_setup = {
        "startify",
        "dashboard",
        "alpha",
      },
      auto_reload_on_write = true,
      hijack_unnamed_buffer_when_opening = false,
      hijack_directories = {
        enable = true,
        auto_open = true,
      },
      open_on_tab = false,
      hijack_cursor = false,
      update_cwd = false,
      diagnostics = {
        enable = mycode.ui.use_icons,
        show_on_dirs = false,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        },
      },
      update_focused_file = {
        enable = true,
        update_cwd = true,
        ignore_list = {},
      },
      system_open = {
        cmd = nil,
        args = {},
      },
      git = {
        enable = true,
        ignore = false,
        timeout = 200,
      },
      view = {
        width = 30,
        height = 30,
        hide_root_folder = false,
        side = "left",
        preserve_window_proportions = false,
        mappings = {
          custom_only = false,
          list = {},
        },
        number = false,
        relativenumber = false,
        signcolumn = "yes",
      },
      renderer = {
        indent_markers = {
          enable = false,
          icons = {
            corner = "└ ",
            edge = "│ ",
            none = "  ",
          },
        },
        icons = {
          webdev_colors = mycode.ui.use_icons,
        },
      },
      filters = {
        dotfiles = false,
        custom = { "node_modules", "\\.cache" },
        exclude = {},
      },
      trash = {
        cmd = "trash",
        require_confirm = true,
      },
      log = {
        enable = false,
        truncate = false,
        types = {
          all = false,
          config = false,
          copy_paste = false,
          diagnostics = false,
          git = false,
          profile = false,
        },
      },
      actions = {
        use_system_clipboard = true,
        change_dir = {
          enable = true,
          global = false,
          restrict_above_cwd = false,
        },
        open_file = {
          quit_on_open = false,
          resize_window = false,
          window_picker = {
            enable = true,
            chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
            exclude = {
              filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
              buftype = { "nofile", "terminal", "help" },
            },
          },
        },
      },
    },
    show_icons = {
      git = vim_show_icons,
      folders = vim_show_icons,
      files = vim_show_icons,
      folder_arrows = vim_show_icons,
    },
    git_hl = 1,
    root_folder_modifier = ":t",
    icons = {
      default = "",
      symlink = "",
      git = {
        deleted = "",
        ignored = "◌",
        renamed = "➜",
        staged = "✓",
        unmerged = "",
        unstaged = "✗",
        untracked = "★",
--        unstaged = "",
--        staged = "S",
--        unmerged = "",
--        renamed = "➜",
--        deleted = "",
--        untracked = "U",
--        ignored = "◌",
      },
      folder = {
        default = "",
        empty = "",
        empty_open = "",
        open = "",
        symlink = "",
        symlink_open = "",
        arrow_open = "",
        arrow_closed = "",
--        default = "",
--        open = "",
--        empty = "",
--        empty_open = "",
--        symlink = "",
      },
    },
  }
--  mycode.infra.which_key.mappings["e"] = { "<cmd>NvimTreeToggle<CR>", "Explorer" }  
end

M.config = function(module)
  local ok_nvim_tree, nvim_tree = pcall(require, "nvim-tree")
  if not ok_nvim_tree then
    Log:error "Failed to load nvim-tree"
    return
  end

  for opt, val in pairs(mycode.infra[module]) do
    vim.g["nvim_tree_" .. opt] = val
  end

  -- Implicitly update nvim-tree when project module is active
  local ok_project, project = pcall(require, "project")
  if ok_project then
    mycode.infra[module].respect_buf_cwd = 1
    mycode.infra[module].setup.update_cwd = true
    mycode.infra[module].setup.update_focused_file = { enable = true, update_cwd = true }
  end

  local function telescope_find_files(_)
    require("plugins.nvim-tree.function").start_telescope "find_files"
  end
  local function telescope_live_grep(_)
    require("plugins.nvim-tree.function").start_telescope "live_grep"
  end

  -- Add useful keymaps
  if #mycode.infra[module].setup.view.mappings.list == 0 then
    mycode.infra[module].setup.view.mappings.list = {
      { key = { "l", "<CR>", "o" }, action = "edit", mode = "n" },
      { key = "h", action = "close_node" },
      { key = "v", action = "vsplit" },
      { key = "C", action = "cd" },
      { key = "gtf", action = "telescope_find_files", action_cb = telescope_find_files },
      { key = "gtg", action = "telescope_live_grep", action_cb = telescope_live_grep },
    }
  end

  nvim_tree.setup(mycode.infra[module].setup)
end

return M
