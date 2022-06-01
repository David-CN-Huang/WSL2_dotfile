---------------------------------------------------------------------------------------------------
-- Plugins 
---------------------------------------------------------------------------------------------------
return {
  { "wbthomason/packer.nvim", },
  { "lewis6991/impatient.nvim", },
  { "neovim/nvim-lspconfig", },
  { "tamago324/nlsp-settings.nvim", },
  { "jose-elias-alvarez/null-ls.nvim", },
  { "antoinemadec/FixCursorHold.nvim", }, -- Needed while issue https://github.com/neovim/neovim/issues/12587 is still open
  { "williamboman/nvim-lsp-installer", },
  { "lunarvim/onedarker.nvim",
    config = function()
      pcall(function()
        if mycode and mycode.ui.colorscheme == "onedarker" then
          require("onedarker").setup()
          mycode.plugins.lualine.options.theme = "onedarker"
        end
      end)
    end,
  },
  { "rcarriga/nvim-notify",
    requires = { "nvim-telescope/telescope.nvim" },
--    config = function()
--      require("lvim.core.notify").setup()
--    end,
  },
  { "Tastyep/structlog.nvim", },
  { "nvim-lua/popup.nvim", },
  { "nvim-lua/plenary.nvim", },
  -- Telescope
  { "nvim-telescope/telescope.nvim",
--    config = function()
--      require("lvim.core.telescope").setup()
--    end,
  },
  { "nvim-telescope/telescope-fzf-native.nvim",
    requires = { "nvim-telescope/telescope.nvim" },
    run = "make",
  },
  -- Install nvim-cmp, and buffer source as a dependency
  { "hrsh7th/nvim-cmp",
    requires = { "L3MON4D3/LuaSnip", },
--    config = function()
--      if lvim.builtin.cmp then
--        require("lvim.core.cmp").setup()
--      end
--    end,
  },
  { "rafamadriz/friendly-snippets", },
  { "L3MON4D3/LuaSnip",
--    config = function()
--      local utils = require "lvim.utils"
--      local paths = {}
--      if lvim.builtin.luasnip.sources.friendly_snippets then
--        paths[#paths + 1] = utils.join_paths(get_runtime_dir(), "site", "pack", "packer", "start", "friendly-snippets")
--      end
--      local user_snippets = utils.join_paths(get_config_dir(), "snippets")
--      if utils.is_directory(user_snippets) then
--        paths[#paths + 1] = user_snippets
--      end
--      require("luasnip.loaders.from_lua").lazy_load()
--      require("luasnip.loaders.from_vscode").lazy_load {
--        paths = paths,
--      }
--      require("luasnip.loaders.from_snipmate").lazy_load()
--    end,
  },
  { "hrsh7th/cmp-nvim-lsp", },
  { "saadparwaiz1/cmp_luasnip", },
  { "hrsh7th/cmp-buffer", },
  { "hrsh7th/cmp-path", },
  { "max397574/lua-dev.nvim",  -- NOTE: Temporary fix till folke comes back
    module = "lua-dev",
  },
  -- Autopairs
  { "windwp/nvim-autopairs",
--    config = function()
--      require("lvim.core.autopairs").setup()
--    end,
  },
  -- Treesitter
  { "nvim-treesitter/nvim-treesitter",
    -- run = ":TSUpdate",
--    config = function()
--      require("lvim.core.treesitter").setup()
--    end,
  },
  { "JoosepAlviste/nvim-ts-context-commentstring",
    event = "BufReadPost",
  },
  -- NvimTree
  { "kyazdani42/nvim-tree.lua",
    -- event = "BufWinOpen",
    -- cmd = "NvimTreeToggle",
--    config = function()
--      require("lvim.core.nvimtree").setup()
--    end,
  },
  { "lewis6991/gitsigns.nvim",
--    config = function()
--      require("lvim.core.gitsigns").setup()
--    end,
    event = "BufRead",
  },
  -- Whichkey
  { "max397574/which-key.nvim",
--    config = function()
--      require("lvim.core.which-key").setup()
--    end,
    event = "BufWinEnter",
  },
  -- Comments
  { "numToStr/Comment.nvim",
    event = "BufRead",
--    config = function()
--      require("lvim.core.comment").setup()
--    end,
  },
  -- project.nvim
  { "ahmedkhalf/project.nvim",
--    config = function()
--      require("lvim.core.project").setup()
--    end,
  },
  -- Icons
  { "kyazdani42/nvim-web-devicons", },
  -- Status Line and Bufferline
  { "nvim-lualine/lualine.nvim",
--    config = function()
--      require("lvim.core.lualine").setup()
--    end,
  },
  { "akinsho/bufferline.nvim",
--    config = function()
--      require("lvim.core.bufferline").setup()
--    end,
    branch = "main",
    event = "BufWinEnter",
  },
  -- Debugging
  { "mfussenegger/nvim-dap",
    -- event = "BufWinEnter",
--    config = function()
--      require("lvim.core.dap").setup()
--    end,
  },
  -- Debugger management
  { "Pocco81/dap-buddy.nvim",
    branch = "dev",
    -- event = "BufWinEnter",
    -- event = "BufRead",
  },
  -- alpha
  { "goolord/alpha-nvim",
--    config = function()
--      require("lvim.core.alpha").setup()
--    end,
  },
  -- Terminal
  { "akinsho/toggleterm.nvim",
    event = "BufWinEnter",
    branch = "main",
--    config = function()
--      require("lvim.core.terminal").setup()
--    end,
  },
  -- SchemaStore
  { "b0o/schemastore.nvim", },
}
