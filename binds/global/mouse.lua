local awful = require("awful")

--- Global mouse bindings
awful.mouse.append_global_mousebindings({
	awful.button(nil, 3, function() require('ui.menu').main:toggle() end),
	awful.button(nil, 4, awful.tag.viewprev),
	awful.button(nil, 5, awful.tag.viewnext)
	--

	-- awful.button({}, 1, function(c)
	-- 	c:activate({ context = "mouse_click" })
	-- end),
	-- awful.button({ modkey }, 1, function(c)
	-- 	c:activate({ context = "mouse_click", action = "mouse_move" })
	-- end),
	-- awful.button({ modkey }, 3, function(c)
	-- 	c:activate({ context = "mouse_click", action = "mouse_resize" })
	-- end),
})
