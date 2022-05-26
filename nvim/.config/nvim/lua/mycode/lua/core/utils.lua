---------------------------------------------------------------------------------------------------
-- Utils
---------------------------------------------------------------------------------------------------
local uv = vim.loop
local path_sep = uv.os_uname().version:match "Windows" and "\\" or "/"

function _G.load_override(default, plugin)
  if mycode ~= nil then
    print(mycode.env.file.spell)
  end
end

function _G.is_in_headless()
    return #vim.api.nvim_list_uis() == 0
end

function _G.is_directory(path)
  local stat = uv.fs_stat(path)
  return stat and stat.type == "directory" or false
end

-- Join path segments that were passed as input
function _G.join_paths(...)
  local result = table.concat({ ... }, path_sep)
  return result
end

-- ~/.locol/share/nvim
function _G.get_dir_runtime()
  return vim.call("stdpath", "data")
end

-- ~/.config/nvim
function _G.get_dir_config()
  return vim.call("stdpath", "config")
end

-- ~/.config/nvim
function _G.get_dir_cache()
  return vim.call("stdpath", "cache")
end

-- Overridden it, since a lot of plugins call this function interally
vim.fn.stdpath = function(what)
  if what == "cache" then
    return _G.get_dir_cache()
  end
  return vim.call("stdpath", what)
end
