#!/bin/bash

# awful.spawn.with_shell("fcitx5 &")
# awful.spawn.with_shell("nm-applet &")
# awful.spawn.with_shell("flameshot &")
# awful.spawn.with_shell("xrandr --output eDP --mode 1920x1200 --rate 120")

xrandr --output eDP --mode 1920x1200 --rate 120
# volumeicon &
# nm-applet &
# blueman-applet &
# flameshot &
# fcitx5 &

# 定义服务和启动命令的数组
services=(
    "fcitx5:fcitx5"
    "nm-applet:nm-applet"
    "volumeicon:volumeicon"
    "blueman-applet:blueman-applet"
    "flameshot:flameshot"
    # 添加其他服务，格式为 "服务名:启动命令"
    # "service_name:command_to_start_service"
)

# 遍历数组并启动未运行的服务
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




# start_if_not_running() {
#   local service_name = "$1"
#   local exec_command = "$2"
#
#   if ! pgrep -x "$service_name" > /dev/null; then
#     eval "exec_command &"
#     echo "Started $service_name"
#   else
#     echo "$service_name is already running"
#   fi
# }
#
#
#
#
