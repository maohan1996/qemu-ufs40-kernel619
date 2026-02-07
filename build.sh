#!/bin/bash

# 脚本名：branch_by_param.sh
# 用法：./branch_by_param.sh [1|2|3]

# 第一步：校验参数数量（必须传入1个参数）
if [ $# -ne 1 ]; then
    echo "❌ 错误：请传入1个参数（仅支持1/2/3）！"
    echo "✅ 用法：$0 [1|2|3]"
    exit 1
fi

# 第二步：提取参数并清洗（去空格、转数字，避免非法字符）
param=$(echo "$1" | xargs)  # 去首尾空格

# 第三步：if/elif/else 分支判断
if [ "${param}" == "1" ]; then
    echo "📌 你输入了参数1，执行【分支1】逻辑..."
    make  O=/home/maohan/linux/qemu/kernel/buildout vexpress_defconfig
    echo "✅ 分支1执行完成：启用UFS核心驱动"

elif [ "${param}" == "2" ]; then
    echo "📌 你输入了参数2，执行【分支2】逻辑..."
    make  O=/home/maohan/linux/qemu/kernel/buildout -j16
    echo "✅ 分支2执行完成：启用UFS时钟缩放+写增强"

elif [ "${param}" == "3" ]; then
    echo "📌 你输入了参数3，执行【分支3】逻辑..."
    make  O=/home/maohan/linux/qemu/kernel/buildout dtbs -j16 
    echo "✅ 分支3执行完成：启用UFS调试日志"

else
    echo "❌ 错误：参数仅支持1/2/3，你输入了${param}！"
    exit 1
fi

echo -e "\n🎉 所有操作执行完成！"






