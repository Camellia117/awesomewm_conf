local naughty = require("naughty")
naughty.connect_signal("added", function(n)
    -- 打开文件用于追加内容
    local file = io.open(os.getenv("HOME") .. "/.config/awesome/notification_history_file.log", "a")
    if file then
      local get_time = os.date("%Y-%m-%d %H:%M:%S")
    local app_name = n.app_name or "Unknown"
        file:write("[" .. get_time .. "]: " .. app_name .. ":" ..  n.title .. ": " .. (n.message or "Unknown") .. "\n")
        file:close()
    end
end)
