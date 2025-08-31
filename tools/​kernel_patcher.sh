#!/bin/bash
# 描述：自动化应用内核补丁
# 用法：./tools/kernel_patcher.sh [补丁目录]

PATCH_DIR=${1:-"patches"}
KERNEL_DIR="../src/kernel"

if [ ! -d "${PATCH_DIR}" ]; then
    echo "错误：补丁目录 ${PATCH_DIR} 不存在"
    exit 1
fi

for patch in ${PATCH_DIR}/*.patch; do
    echo "应用补丁: $(basename ${patch})"
    patch -d ${KERNEL_DIR} -p1 < ${patch} || {
        echo "应用补丁失败: ${patch}"
        exit 1
    }
done
