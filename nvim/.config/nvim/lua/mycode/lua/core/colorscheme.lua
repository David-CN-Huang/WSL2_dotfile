---------------------------------------------------------------------------------------------------
-- colorscheme
---------------------------------------------------------------------------------------------------
if mycode.ui.transparent then
  vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
      local hl_groups = {
        "Normal",
        "SignColumn",
        "NormalNC",
        "TelescopeBorder",
        "NvimTreeNormal",
        "EndOfBuffer",
        "MsgArea",
        "CursorLine",
      }
      for _, name in ipairs(hl_groups) do
        vim.cmd(string.format("highlight %s ctermbg=none guibg=none", name))
      end
    vim.cmd("highlight CursorLine cterm=underline gui=underline")
    end,
  })
  vim.opt.fillchars = "eob: "
end
