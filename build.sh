#!/bin/bash

# 第一步：校验参数数量（必须传入1个参数）
if [ $# -ne 1 ]; then
    echo "❌ 错误：请传入1个参数（仅支持[cfg|bd|dtb]）！"
    echo "✅ 用法：$0 [cfg|bd|dtb]"
    exit 1
fi

# 提取参数并清洗（去空格、转数字，避免非法字符）
param=$(echo "$1" | xargs)  # 去首尾空格

if [ "${param}" == "cfg" ]; then
    make  O=/home/maohan/linux/qemu/kernel/buildout vexpress_defconfig

elif [ "${param}" == "bd" ]; then
    make  O=/home/maohan/linux/qemu/kernel/buildout -j16

elif [ "${param}" == "dtb" ]; then
    make  O=/home/maohan/linux/qemu/kernel/buildout dtbs -j16 

else
    echo "❌ 错误：参数仅支持[cfg|bd|dtb]，你输入了${param}！"
    exit 1
fi

echo -e "\n🎉 所有操作执行完成！"






