---------------------------------------------------------------------------------------------------
-- key mapping
---------------------------------------------------------------------------------------------------
local M = {}

local generic_opts_any = { noremap = true, silent = true }

local generic_opts = {
  mode_insert       = generic_opts_any,
  mode_normal       = generic_opts_any,
  mode_visual       = generic_opts_any,
  mode_visual_block = generic_opts_any,
  mode_command      = generic_opts_any,
  mode_term         = { silent = true },
}

local mode_adapters = {
  mode_insert       = "i",
  mode_normal       = "n",
  mode_term         = "t",
  mode_visual       = "v",
  mode_visual_block = "x",
  mode_command      = "c",
}

local keymaps = {
  mode_insert = {
    -- 'jk'/'kj'/'jj' for quitting insert mode
    ["jk"] = "<ESC>",
    ["kj"] = "<ESC>",
    ["jj"] = "<ESC>",
    -- Move current line / block with Alt-j/k ala vscode.
    ["<A-k>"] = "<Esc>:m .-2<CR>==gi",
    ["<A-j>"] = "<Esc>:m .+1<CR>==gi",
    -- navigation
    ["<A-Up>"] = "<C-\\><C-N><C-w>k",
    ["<A-Down>"] = "<C-\\><C-N><C-w>j",
    ["<A-Left>"] = "<C-\\><C-N><C-w>h",
    ["<A-Right>"] = "<C-\\><C-N><C-w>l",
  },

  mode_normal = {
    -- Window movement
    ["<C-k>"] = "<C-w>k",
    ["<C-j>"] = "<C-w>j",
    ["<C-h>"] = "<C-w>h",
    ["<C-l>"] = "<C-w>l",

    -- Resize with arrows
    ["<C-Up>"] = ":resize -2<CR>",
    ["<C-Down>"] = ":resize +2<CR>",
    ["<C-Left>"] = ":vertical resize -2<CR>",
    ["<C-Right>"] = ":vertical resize +2<CR>",

    -- Tab switch buffer
    ["<S-l>"] = ":BufferLineCycleNext<CR>",
    ["<S-h>"] = ":BufferLineCyclePrev<CR>",

    -- Move current line / block with Alt-j/k a la vscode.
    ["<A-k>"] = ":m .-2<CR>==",
    ["<A-j>"] = ":m .+1<CR>==",

    -- QuickFix
    ["]q"] = ":cnext<CR>",
    ["[q"] = ":cprev<CR>",
    ["<C-q>"] = ":call QuickFixToggle()<CR>",
  },

  mode_term = {
    -- Terminal window navigation
    ["<C-h>"] = "<C-\\><C-N><C-w>h",
    ["<C-j>"] = "<C-\\><C-N><C-w>j",
    ["<C-k>"] = "<C-\\><C-N><C-w>k",
    ["<C-l>"] = "<C-\\><C-N><C-w>l",
  },

  mode_visual = {
    -- Better indenting
    ["<"] = "<gv",
    [">"] = ">gv",
  },

  mode_visual_block = {
    -- Move selected line / block of text in visual mode
    ["K"] = ":move '<-2<CR>gv-gv",
    ["J"] = ":move '>+1<CR>gv-gv",

    -- Move current line / block with Alt-j/k ala vscode.
    ["<A-j>"] = ":m '>+1<CR>gv-gv",
    ["<A-k>"] = ":m '<-2<CR>gv-gv",
  },

  mode_command = {
    -- navigate tab completion with <c-j> and <c-k>
    -- runs conditionally
    ["<C-j>"] = { 'pumvisible() ? "\\<C-n>" : "\\<C-j>"', { expr = true, noremap = true } },
    ["<C-k>"] = { 'pumvisible() ? "\\<C-p>" : "\\<C-k>"', { expr = true, noremap = true } },
  },
}

--[[
  mode = {
    key = {val, {opt}}
  }
]]--

set_keymaps = function(mode, key, val)
  local opt = generic_opts[mode] or generic_opts_any
  if type(val) == "table" then
    opt = val[2]
    val = val[1]
  end
  if val then
    vim.api.nvim_set_keymap(mode, key, val, opt)
  else
    pcall(vim.api.nvim_del_keymap, mode, key)
  end
end

load_mode = function(mode, keymaps)
  mode = mode_adapters[mode] or mode
  for k, v in pairs(keymaps) do
    set_keymaps(mode, k, v)
  end
end

M.load_keymaps = function(keymaps)
  keymaps = keymaps or {}
  for mode, mapping in pairs(keymaps) do
    load_mode(mode, mapping)
  end
end

M.load_default = function()
  for mode, mapping in pairs(keymaps) do
    load_mode(mode, mapping)
    mycode.keys[mode] = {}
  end
end

return M
