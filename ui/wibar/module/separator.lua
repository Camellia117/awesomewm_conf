local wibox = require('wibox')
local beautiful = require('beautiful')

return function(width)
    return wibox.widget {
        widget = wibox.widget.separator,
        orientation = 'vertical',
        forced_width = width or 10,
        color = beautiful.bg_normal,
        opacity = 0.2
    }
end