---------------------------------------------------------------------------------------------------
-- The environment of the my-code.
---------------------------------------------------------------------------------------------------
local options = {
  -- file
  fileencoding = "utf-8",                        -- the encoding written to a file.
  backup = false,                                -- creates a backup file.
  writebackup = false,                           -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited.
  swapfile = false,                              -- don't creates a swap file.
  -- editor
  showtabline = 2,                               -- always show tab line.
  wrap = false,                                  -- display lines as one long line.
  hidden = true,                                 -- required to keep multiple buffers and open multiple buffers.
  completeopt = { "menuone", "noselect" },       -- about auto completeopt.
  pumheight = 10,                                -- pop up menu height.
  undofile = true,                               -- enable persistent undo.
  ---- tab key
  expandtab = true,                              -- convert tabs to spaces.
  tabstop = 4,                                   -- the number of spaces for a tab.
  ---- indent
  autoindent = true,                             --
  smartindent = true,                            -- make indenting smarter again.
  shiftwidth = 4,                                -- the number of spaces inserted for each indentation.
  ---- search
  hlsearch = true,                               -- highlight all matches on previous search pattern.
  ignorecase = true,                             -- ignore case in search patterns.
  smartcase = true,                              -- smart case for search.
  incsearch = true,                              -- search when type.
  ---- scroll
  scrolloff = 8,                                 -- minimal number of screen lines to keep above and below the cursor.
  sidescrolloff = 8,                             -- minimal number of screen lines to keep left and right of the cursor.
  ---- number
  number = true,                                 -- numbered lines.
  relativenumber = true,                         -- relative numbered lines.
  numberwidth = 2,                               -- number column width.
  signcolumn = "yes",                            -- always show the sign column, otherwise it would shift the text each time.
  ---- cursor
  cursorline = true,                             -- highlight the current line.
  cursorcolumn = false,                          -- highlight the current line.
  colorcolumn = "120",                           -- fixes indent line for now.
  ---- time
  updatetime = 300,                              -- faster completion
  timeoutlen = 250,                              -- time to wait for a mapped sequence to complete (in milliseconds).
  -- cmd
  cmdheight = 2,                                 -- more space in the neovim command line for displaying messages.
  -- split
  splitbelow = true,                             -- force all horizontal splits to go below current window.
  splitright = true,                             -- force all vertical splits to go to the right of current window.
  -- spell
  spell = true,                                  -- spell check.
  spelllang = "en_us,cjk",                       -- spell check language.
  -- others
  title = true,                                  -- set the title of window to the value of the titlestring.
  --titlestring = "%<%F%=%l/%L - nvim",            -- what the title of the window will be set to.
  termguicolors = true,                          -- set term gui colors (most terminals support this).
  showmode = false,                              -- show mode, like INSERT, VIEW, ..., etc.
  clipboard = "unnamedplus",                     -- allows neovim to access the system clipboard.
  guifont = "monospace:h17",                     -- the font used in graphical neovim applications
  -- plugin
  -- conceallevel = 0, -- so that `` is visible in markdown files
  -- foldmethod = "manual", -- folding, set to "expr" for treesitter based folding
  -- foldexpr = "", -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
}

if is_in_headless() then
  vim.opt.shortmess = ""                         -- try to prevent echom from cutting messages off or prompting
  vim.opt.more = false                           -- don't pause listing when screen is filled
  vim.opt.cmdheight = 9999                       -- helps avoiding |hit-enter| prompts.
  vim.opt.columns = 9999                         -- set the widest screen possible
  vim.opt.swapfile = false                       -- don't use a swap file
  return
end

vim.opt.shortmess:append "c"                     -- don't show redundant messages from ins-completion-menu
vim.opt.shortmess:append "I"                     -- don't show the default intro message
vim.opt.whichwrap:append "<,>,[,],h,l"

for k, v in pairs(mycode.env.file) do
  vim.opt[k .. "file"] = v
end

vim.g.mapleader = " "

for k, v in pairs(options) do
  vim.opt[k] = v
end


