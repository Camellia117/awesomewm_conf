local beautiful = require("beautiful")
local awful = require("awful")
local utils = require("utils")
local wibox = require("wibox")
local gears = require("gears")
local my_widgets = require("widgets")
local net_speed_widget = require("widgets.net-speed-widget.net-speed")
local my_volume = my_widgets.volume()

os.setlocale("zh_CN.UTF-8")

M_top_widget = {
	init = function(screen)
		local top = awful.wibar({
			height = utils.ui.dpiSize(35),
			type = "dock",
			bg = "#20243680",
			position = "top",
			screen = screen,
			widget = M_top_widget.topWidgetList(),
		})
		return top
	end,

	topWidgetList = function()
		return wibox.widget({
			M_top_widget.left_widget(),
			nil,
			M_top_widget.right_widget(),
			right = utils.ui.dpiSize(20),
			layout = wibox.layout.align.horizontal,
			widget = wibox.container.margin,
		})
	end,

	-- 右边组件：wifi, net_speed, volume, systray;
	right_widget = function()
		return wibox.widget({
			wibox.widget({
				layout = wibox.layout.fixed.horizontal,
				spacing = utils.ui.dpiSize(8),
				net_speed_widget(),
				my_widgets.temp,
				my_volume,
				M_top_widget.tag_now(),
				M_top_widget.sysTray(),
			}),
			right = utils.ui.dpiSize(10),
			widget = wibox.container.margin,
		})
	end,
	left_widget = function()
		return wibox.widget({
			{
				wibox.widget({
					wibox.widget({
						format = "%m-%d %H:%M %A ",
						widget = wibox.widget.textclock,
						font = beautiful.font,
					}),
					fg = "#ffffff",
					widget = wibox.container.background,
				}),
				layout = wibox.layout.fixed.horizontal,
				spacing = 3,
			},
			left = utils.ui.dpiSize(10),
			widget = wibox.container.margin,
		})
	end,

	sysTray = function()
		local initSysTray = wibox.widget({
			horizontal = true,
			base_size = utils.ui.dpiSize(22),
			forced_height = utils.ui.dpiSize(22),
			-- BUG:
			-- opacity = 0.8,
			widget = wibox.widget.systray,
		})

		return wibox.widget({
			wibox.widget({
				wibox.widget({
					initSysTray,
          margin = 5,
					-- top = utils.ui.dpiSize(2),
					-- bottom = utils.ui.dpiSize(2),
					-- left = utils.ui.dpiSize(10),
					-- right = utils.ui.dpiSize(10),
					widget = wibox.container.margin,
          kjkj 
				}),
				shape = gears.shape.rounded_rect,
        shape_clip = true,
				bg = "#ffffff",
				widget = wibox.container.place,
			}),
			align = "center",
			valign = "center",
			widget = wibox.container.place,
		})
	end,

	-- 监听systray
	tag_now = function()
		local tagList = { "󰣇 Dock", " Code", "󰭻 Chat", " Music", " Other" }
    -- local tagList = { "1", "2", "3", "4", "5" }
		local tag_name_widget = wibox.widget({
			text = "󰣇 Dock",
			widget = wibox.widget.textbox,
		})
		tag.connect_signal("property::selected", function(t)
			local index = tonumber(t.name)
	     if index ~= nil and index >= 1 and index <= #tagList then
				tag_name_widget:set_markup(tagList[index])
			else
				tag_name_widget:set_markup(" Other" .. index)
			end
		end)
		return tag_name_widget
	end,
}

return M_top_widget
