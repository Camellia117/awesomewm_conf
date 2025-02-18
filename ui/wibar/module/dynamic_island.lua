local wibox = require('wibox')
local beautiful = require('beautiful')
local gears = require('gears')

return function()
    local island = wibox.widget {
        {
            {
                text = "hello dynamic island",  -- 默认显示内容
                widget = wibox.widget.textbox,
            },
            margins = 6,
            widget = wibox.container.margin,
        },
        shape = gears.shape.rounded_rect,
        bg = beautiful.bg_normal,
        widget = wibox.container.background,
    }

    -- 这里可以添加动态更新内容的逻辑
    -- 例如音乐播放、通知等

    return island
end
