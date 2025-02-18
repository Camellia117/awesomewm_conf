local awful = require('awful')
local wibox = require('wibox')
local beautiful = require('beautiful')

local module = require(... .. '.module')

return function(s)
   -- 创建分隔符
   local separator = require('ui.wibar.module.separator')

   -- 创建系统托盘
   local systray = wibox.widget.systray()
   systray:set_horizontal(true)
   systray:set_base_size(20)

   -- 创建时钟
   local clock = wibox.widget.textclock(
      '<span font="Maple Mono 10"> %a %d %b %Y %H:%M:%S </span>'
   )

   -- 创建顶部栏
   s.mywibox = awful.wibar({
      position = 'top',
      screen   = s,
      height   = 30,
      bg       = beautiful.bg_normal,
      fg       = beautiful.fg_normal,
      widget   = {
         layout = wibox.layout.align.horizontal,
         -- Left widgets.
         {
            layout = wibox.layout.fixed.horizontal,
            spacing = 10,
            module.launcher(),
            module.taglist(s),
            s.mypromptbox
         },
         {-- Middle widgets.
            layout = wibox.layout.flex.horizontal,
            module.tasklist(s),
         },
         -- Right widgets.
         {
            layout = wibox.layout.fixed.horizontal,
            spacing = 10,
            systray,
            separator(5),
            clock,
            separator(5),
            module.layoutbox(s) -- 布局框
         }
      }
   })
end
