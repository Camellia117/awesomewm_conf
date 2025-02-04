local awful = require('awful')
local wibox = require('wibox')

local top_widget = require("widgets.topBar")

local module = require(... .. '.module')

return function(s)
   -- s.mypromptbox = awful.widget.prompt() -- Create a promptbox.

   -- Create the wibox
   s.mywibox = awful.wibar({
      position = 'top',
      screen   = s,

      -- 加载顶部组件
      top_widget.init(s),
   })
end
