local utils = require("utils")
local gears = require("gears")
-- Add a titlebar if titlebars_enabled is set to true for the client in `config/rules.lua`.
client.connect_signal("request::titlebars", function(c)
  -- While this isn't actually in the example configuration, it's the most sane thing to do.
  -- If a client expressly says not to draw titlebars on it, just don't.
  if c.requests_no_titlebars then
    return
  end

  require("ui.titlebar").normal(c)
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
  c:activate({ context = "mouse_enter", raise = false })
end)

client.connect_signal("manage", function(c)
  c.border_color = "#5654a2"
  local function update_shape()
    if c.fullscreen then
      c.shape = gears.shape.rectangle
      c.border_width = 0
    else
      c.shape = utils.ui.rounded_rect(20)
      c.border_width = utils.ui.dpiSize(1)
    end
  end
  update_shape()
  c:connect_signal("property::fullscreen", update_shape)
end)

-- client.connect_signal("focus", function(c)
--   if c.floating or c.maximized then
--     return
--   end
-- end)

-- client.connect_signal("unfocus", function(c)
--   c.border_width = 0
-- end)
