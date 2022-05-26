-- plugin
require('packer').startup(function(use)
  -- Packer can manage itself
  use {
	  'asvetliakov/vim-easymotion'
  }
end)

-- local settings
local map = vim.api.nvim_set_keymap
local opt = {
    noremap = true,
    silent = true
}

-- Modes
-- n: normal
-- i: insert
-- v: visual
-- x: visual_block
-- t: term
-- c: comand

-- Switch window
map("n", "<C-j>", ":call VSCodeNotify('workbench.action.navigateDown')<CR>", opt)
map("n", "<C-k>", ":call VSCodeNotify('workbench.action.navigateUp')<CR>", opt)
map("n", "<C-h>", ":call VSCodeNotify('workbench.action.navigateLeft')<CR>", opt)
map("n", "<C-l>", ":call VSCodeNotify('workbench.action.navigateRight')<CR>", opt)

-- QuickFix
map("n", "z=", ":call VSCodeNotify('keyboard-quickfix.openQuickFix')<CR>", {
    noremap = true,
    silent = false
})

-- easymotion
map("n", "s", "<Plug>(easymotion-s2)", {
    noremap = false,
    silent = false
})

map("n", "t", "<Plug>(easymotion-t2)", {
    noremap = false,
    silent = false
})
vim.g.EasyMotion_smartcase = 1

-- general
vim.wo.cursorline = true
vim.o.smartcase = true
vim.o.ignorecase = true

-- keymap
map("n", "<up>", "<Nop>", opt)
map("n", "<down>", "<Nop>", opt)
map("n", "<right>", "<Nop>", opt)
map("n", "<left>", "<Nop>", opt)
map("i", "<up>", "<Nop>", opt)
map("i", "<down>", "<Nop>", opt)
map("i", "<right>", "<Nop>", opt)
map("i", "<left>", "<Nop>", opt)
