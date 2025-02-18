local awful = require('awful')
local wibox = require('wibox')
local beautiful = require('beautiful')
local gears = require('gears')

local power_menu = function()
    local popup = awful.popup {
        ontop = true,
        visible = false,
        shape = gears.shape.rounded_rect,
        maximum_width = 400,
        offset = { y = 5 },
        widget = {
            {
                {
                    {
                        text = "  关机",
                        widget = wibox.widget.textbox
                    },
                    bg = beautiful.bg_normal,
                    widget = wibox.container.background
                },
                {
                    {
                        text = "  重启",
                        widget = wibox.widget.textbox
                    },
                    bg = beautiful.bg_normal,
                    widget = wibox.container.background
                },
                {
                    {
                        text = "  休眠",
                        widget = wibox.widget.textbox
                    },
                    bg = beautiful.bg_normal,
                    widget = wibox.container.background
                },
                {
                    {
                        text = "  锁定",
                        widget = wibox.widget.textbox
                    },
                    bg = beautiful.bg_normal,
                    widget = wibox.container.background
                },
                spacing = 3,
                layout = wibox.layout.fixed.vertical
            },
            margins = 10,
            widget = wibox.container.margin
        }
    }

    local power_button = wibox.widget {
        {
            text = "  ",
            widget = wibox.widget.textbox
        },
        bg = beautiful.bg_normal,
        widget = wibox.container.background
    }

    power_button:connect_signal("button::press", function()
        if popup.visible then
            popup.visible = false
        else
            popup:move_next_to(mouse.current_widget_geometry)
        end
    end)

    return power_button
end

return power_menu