#!/bin/bash
# 描述：检查构建依赖是否已安装
# 用法：./tools/deps_checker.sh

DEPS=(
    "gcc"
    "make"
    "flex"
    "bison"
    "xorriso"
    "grub2-common"
)

for dep in ${DEPS[@]}; do
    if ! command -v ${dep} >/dev/null 2>&1; then
        echo "[MISSING] 未找到依赖: ${dep}"
        exit 1
    fi
    echo "[OK] 已安装: ${dep}"
done

echo "所有依赖已满足！"
