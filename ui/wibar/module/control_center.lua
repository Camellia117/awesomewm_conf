local awful = require('awful')
local wibox = require('wibox')
local beautiful = require('beautiful')
local gears = require('gears')

local function create_toggle_button(icon, on_click)
    local button = wibox.widget {
        {
            {
                text = icon,
                widget = wibox.widget.textbox,
            },
            margins = 4,
            widget = wibox.container.margin,
        },
        bg = beautiful.bg_normal,
        shape = gears.shape.rounded_rect,
        widget = wibox.container.background,
    }
    
    button:connect_signal("button::press", on_click)
    return button
end

local control_center = function()
    -- 创建控制中心弹出窗口
    local popup = awful.popup {
        ontop = true,
        visible = false,
        shape = gears.shape.rounded_rect,
        maximum_width = 400,
        widget = {
            {
                {
                    -- 快速设置区域
                    {
                        create_toggle_button("󰂯", function() end),  -- WiFi
                        create_toggle_button("󰂯", function() end),  -- 蓝牙
                        create_toggle_button("󰕾", function() end),  -- 音量
                        create_toggle_button("󰃠", function() end),  -- 勿扰
                        spacing = 8,
                        layout = wibox.layout.fixed.horizontal,
                    },
                    -- 亮度滑块
                    {
                        widget = wibox.widget.slider,
                    },
                    -- 音量滑块
                    {
                        widget = wibox.widget.slider,
                    },
                    spacing = 10,
                    layout = wibox.layout.fixed.vertical,
                },
                margins = 10,
                widget = wibox.container.margin,
            },
            bg = beautiful.bg_normal,
            widget = wibox.container.background,
        }
    }

    -- 控制中心触发按钮
    local control_button = wibox.widget {
        {
            text = "  ",
            widget = wibox.widget.textbox,
        },
        bg = beautiful.bg_normal,
        widget = wibox.container.background,
    }

    control_button:connect_signal("button::press", function()
        if popup.visible then
            popup.visible = false
        else
            popup:move_next_to(mouse.current_widget_geometry)
        end
    end)

    return control_button
end

return control_center