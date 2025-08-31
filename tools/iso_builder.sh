#!/bin/bash
# 描述：将编译好的内核和根文件系统打包成可启动ISO
# 用法：./tools/iso_builder.sh

set -e  # 遇到错误立即退出

# 检查是否在仓库根目录运行
if [ ! -f "README.md" ]; then
    echo "错误：请在仓库根目录运行此脚本！"
    exit 1
fi

# 定义变量
ISO_DIR="lumenx_iso"
OUTPUT_ISO="LumenX-$(date +%Y%m%d).iso"
KERNEL_VERSION="6.16.3-MyCustomLinux"

# 创建ISO目录结构
mkdir -p ${ISO_DIR}/{boot/grub,EFI}

# 复制内核文件
cp /boot/vmlinuz-${KERNEL_VERSION} ${ISO_DIR}/boot/
cp /boot/initrd.img-${KERNEL_VERSION} ${ISO_DIR}/boot/

# 创建GRUB配置文件
cat > ${ISO_DIR}/boot/grub/grub.cfg << EOF
menuentry "LumenX Linux" {
    linux /boot/vmlinuz-${KERNEL_VERSION} root=/dev/sda1 quiet splash
    initrd /boot/initrd.img-${KERNEL_VERSION}
}
EOF

# 生成ISO文件
grub-mkrescue -o ${OUTPUT_ISO} ${ISO_DIR}

echo "[SUCCESS] ISO已生成: $(pwd)/${OUTPUT_ISO}"
