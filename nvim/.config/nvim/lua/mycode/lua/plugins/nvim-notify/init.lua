local Log = require "core.log"

local M = {}

M.setup = function(module)
  mycode.infra[module] = {
    ---@usage Animation style one of { "fade", "slide", "fade_in_slide_out", "static" }
    stages = "slide",
  
    ---@usage Function called when a new window is opened, use for changing win settings/config
    on_open = nil,
  
    ---@usage Function called when a window is closed
    on_close = nil,
  
    ---@usage timeout for notifications in ms, default 5000
    timeout = 5000,
  
    -- Render function for notifications. See notify-render()
    render = "default",
  
    ---@usage highlight behind the window for stages that change opacity
    background_colour = "Normal",
  
    ---@usage minimum width for notification windows
    minimum_width = 50,
  
    ---@usage Icons for the different levels
    icons = {
      ERROR = "",
      WARN  = "",
      INFO  = "",
      DEBUG = "",
      TRACE = "✎",
    },
  }

  if not mycode.ui.use_icons then
    defaults.opts.icons = {
      ERROR = "[ERROR]",
      WARN  = "[WARNING]",
      INFO  = "[INFO]",
      DEBUG = "[DEBUG]",
      TRACE = "[TRACE]",
    }
  end
end

M.config = function(module)
  if is_in_headless() then
    return
  end

  pcall(function()
    local m = require("notify")
    m.setup(mycode.infra[module])
    vim.notify = m
    Log:configure_notifications(m)
  end)
end

return M
