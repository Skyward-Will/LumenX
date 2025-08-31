#!/bin/bash
# 描述：用QEMU测试内核或ISO
# 用法：./tools/qemu_test.sh [模式: kernel/iso] [文件路径]

MODE=$1
FILE=$2
MEMORY="2048M"

case ${MODE} in
    kernel)
        qemu-system-x86_64 -kernel ${FILE} -append "console=ttyS0" -m ${MEMORY} -nographic
        ;;
    iso)
        qemu-system-x86_64 -cdrom ${FILE} -m ${MEMORY} -vga virtio
        ;;
    *)
        echo "用法: $0 [kernel|iso] [文件路径]"
        exit 1
        ;;
esac
