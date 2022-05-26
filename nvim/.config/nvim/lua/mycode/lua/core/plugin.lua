---------------------------------------------------------------------------------------------------
-- Plugin handler
---------------------------------------------------------------------------------------------------
-- handle if there are not packer installed.
local installed, packer  = pcall(require, "packer")
if not installed  then
    vim.fn.delete(mycode.packer.install, "rf")
    vim.fn.system {
      "git",
      "clone",
      "https://github.com/wbthomason/packer.nvim",
      "--depth",
      "1",
      mycode.packer.install,
    }

    vim.cmd "packadd packer.nvim"
    local ok, packer  = pcall(require, "packer")
    print "Packer cloned successfully."
end

-- set packer options and init it
local options = {
  package_root  = mycode.packer.dir,
  compile_path  = mycode.packer.compiled,
  snapshot_path = mycode.packer.snapshot,
  display = {
     open_fn = function()
        return require("packer.util").float { border = "rounded" }
     end,
  },
  git = {
     clone_timeout = 60, -- seconds
  },
  auto_clean = true,
  compile_on_sync = true,
}

if not installed then
  optios.snapshot = mycode.packer.snapshot_def
end

if is_in_headless() then
  options.display = nil
end

packer.init(options)

-- handle plugins if that neened to config and setup
local plugins = require("plugins")
for k, plugin in pairs(plugins) do
  for v, m in pairs(plugin) do
    if type(m) == "string" then
      -- find repository
      local repository = string.gsub(m, ".*/(%w+)", "%1")
      -- remove file extension .nvim and .lua
      repository = string.gsub(string.gsub(repository, "(%w+)(%.nvim)", "%1"), "(%w+)(%.lua)", "%1")
      -- remove nvim- and replace xxx-xxx to xxx_xx
      local module = string.gsub(string.gsub(repository, "(nvim%-)(%w+)", "%2"), "%-", "%_")
      local ok, conf = pcall(require, "plugins." .. repository)
--      print(repository)
--      print(conf)
      if ok then
        mycode.infra[repository] = {}
        plugins[k].setup = conf.setup(module)
        plugins[k].config = conf.config(module)
      end
    end
  end
end

return packer.startup(function(use)
  for _, v in pairs(plugins) do
    use(v)
  end
end)
