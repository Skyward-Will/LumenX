#!/bin/bash
# LumenX ISO 构建脚本
# 用法: ./build_iso.sh [输出路径]

set -e

# 参数检查
OUTPUT_DIR=${1:-$HOME/LumenX-ISO}
KERNEL_IMG="../kernel/bzImage"
MODULES_DIR="../kernel/modules"

# 创建临时工作目录
WORK_DIR=$(mktemp -d)
mkdir -p $WORK_DIR/{isolinux,live}

# 复制内核文件
echo "Copying kernel files..."
cp $KERNEL_IMG $WORK_DIR/live/vmlinuz
cp initrd.img $WORK_DIR/live/initrd

# 复制模块
if [ -d "$MODULES_DIR" ]; then
    echo "Copying kernel modules..."
    mkdir -p $WORK_DIR/live/modules
    cp -r $MODULES_DIR/* $WORK_DIR/live/modules/
fi

# 创建引导配置
cat > $WORK_DIR/isolinux/isolinux.cfg << EOF
DEFAULT LumenX
LABEL LumenX
  KERNEL /live/vmlinuz
  APPEND initrd=/live/initrd root=live:CDLABEL=LumenX boot=live
EOF

# 生成ISO
echo "Building ISO image..."
xorriso -as mkisofs \
    -volid "LumenX" \
    -output $OUTPUT_DIR/LumenX-$(date +%Y%m%d).iso \
    -b isolinux/isolinux.bin \
    -no-emul-boot \
    -boot-load-size 4 \
    -boot-info-table \
    $WORK_DIR

# 清理
rm -rf $WORK_DIR
echo "ISO created at: $OUTPUT_DIR/LumenX-$(date +%Y%m%d).iso"
