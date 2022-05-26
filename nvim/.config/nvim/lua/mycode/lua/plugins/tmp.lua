local Log = require "core.log"

local M = { }

M.setup = function(module)
  mycode.infra[module] = {
  
  }
end

M.config = function(module)
  pcall(function()
    require("").setup(mycode.infra[module])
  end)
end

return M
