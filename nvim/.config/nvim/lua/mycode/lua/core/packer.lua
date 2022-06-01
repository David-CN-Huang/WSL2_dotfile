---------------------------------------------------------------------------------------------------
-- Plugins handler
---------------------------------------------------------------------------------------------------
-- setting packer config options
local options = {
  auto_clean      = true,
  compile_on_sync = true,
  compile_path    = mycode.packer.compiled,
  display = {
      working_sym = " ﲊ",
      error_sym   = "✗ ",
      done_sym    = " ",
      removed_sym = " ",
      moved_sym   = "",
      open_fn = function()
        return require("packer.util").float { border = "rounded" }
      end,
  },
  git = { clone_timeout = 6000 },
  package_root    = mycode.packer.dir,
  snapshot_path   = mycode.packer.snapshot,
}

-- install packer if needed
local installed = vim.fn.empty(vim.fn.glob(mycode.packer.install)) == 0
if not installed then 
    print("Cloning packer ..")
    vim.fn.system {
      "git",
      "clone",
      "https://github.com/wbthomason/packer.nvim",
      "--depth",
      "1",
      mycode.packer.install,
    }

    vim.cmd "packadd packer.nvim"
end

-- handle plugins if that neened to config and setup
local plugins = require("plugins")
for k, p in pairs(plugins) do
  for _, repo in pairs(p) do
    -- find plugin name pn
    local pn = string.gsub(repo, ".*/(%w+)", "%1")
    -- remove file extension .nvim and .lua
    pn = string.gsub(string.gsub(pn, "(%w+)(%.nvim)", "%1"), "(%w+)(%.lua)", "%1")
    local ok, conf = pcall(require, "plugins." .. pn)
    if ok and conf then
      plugins[k].setup  = conf.setup()
      plugins[k].config = conf.config()
    end
  end
end

local ok, packer = pcall(require, "packer")

if not ok then
  return
end

if mycode.is_in_headless() then
  options.display = nil
end

packer.init(options)
packer.startup(function(use)
  for _, v in pairs(plugins) do
    use(v)
  end
end)

if not installed then
  vim.cmd "PackerSync"
end
