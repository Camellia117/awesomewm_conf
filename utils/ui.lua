local beautiful = require("beautiful")
local gears = require("gears")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local M = {}

M.rounded_rect = function(radius)
  radius = radius or beautiful.border_radius
  return function (cr, width, height)
   gears.shape.rounded_rect(cr, width, height, radius) 
  end
end

M.dpiSize = function(nums)
  return dpi(nums)
end

return M
