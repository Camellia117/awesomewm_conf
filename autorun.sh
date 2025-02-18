#!/bin/bash

# awful.spawn.with_shell("fcitx5 &")
# awful.spawn.with_shell("nm-applet &")
# awful.spawn.with_shell("flameshot &")
# awful.spawn.with_shell("xrandr --output eDP --mode 1920x1200 --rate 120")

xrandr --output eDP --mode 1920x1200 --rate 120

services=(
    "fcitx5:fcitx5"
    "nm-applet:nm-applet"
    "volumeicon:volumeicon"
    "blueman-applet:blueman-applet"
    "flameshot:flameshot"
    "picom:picom --experimental-backends --config ~/.config/picom/picom.conf"
)

for item in "${services[@]}"; do
    service_name="${item%%:*}"  # 提取服务名
    command="${item#*:}"        # 提取启动命令

    # 检测服务是否已经在运行
    if ! pgrep -x "$service_name" > /dev/null; then
        # 如果没有运行，则启动服务
        eval "$command &"
        echo "Started $service_name"
    else
        echo "$service_name is already running"
    fi
done
