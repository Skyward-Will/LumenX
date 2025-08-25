#!/bin/bash
# LumenX ISO 构建脚本
set -e  # 遇到任何错误立即退出

echo "[INFO] 开始构建 LumenX 系统镜像..."

# ==================== 配置阶段 ====================
echo "[1/4] 配置构建环境..."
lb config \
  --distribution unstable \
  --architectures amd64 \
  --binary-images iso-hybrid \
  --mirror-bootstrap "https://community-packages.deepin.com/deepin/" \
  --mirror-chroot "https://community-packages.deepin.com/deepin/" \
  --mirror-chroot-security "https://security.debian.org/debian-security" \
  --archive-areas "main contrib non-free" \
  --bootloader grub-efi \
  --debian-installer live \
  --system live \
  --apt-indices false \
  --firmware-chroot true \
  --updates true \
  --security true

# ==================== 注入自定义配置 ====================
echo "[2/4] 注入 LumenX 自定义配置..."
if [ -d "../config" ]; then
    cp -rv ../config/* ./config/
else
    echo "[WARN] 未找到自定义配置目录 '../config'，使用默认配置"
fi

# ==================== 构建阶段 ====================
echo "[3/4] 开始构建系统镜像（此过程需要较长时间）..."
sudo lb build 2>&1 | tee build.log

# ==================== 后处理阶段 ====================
echo "[4/4] 生成校验文件和重命名镜像..."
# 创建输出目录
mkdir -p ../output
# 重命名镜像文件（添加日期版本标识）
ISO_FILE="../output/lumenx-$(date +%Y%m%d)-amd64.iso"
mv live-image-amd64.hybrid.iso "$ISO_FILE"
# 生成校验文件
cd ../output
sha256sum $(basename "$ISO_FILE") > SHA256SUMS

echo "[SUCCESS] 构建完成！"
echo "镜像文件: $(realpath "$ISO_FILE")"
echo "校验文件: $(realpath "SHA256SUMS")"
