# LumenX 系统构建指南

## 基础要求
- 已安装 Deepin 25.0.1 的 x86_64 设备
- 至少 50GB 可用磁盘空间
- 稳定的网络连接

## 🧰 准备工具
bash

sudo apt install git live-build squashfs-tools xorriso

## 🔧 构建步骤
1. 获取构建脚本：
bash

git clone https://github.com/Skyward-Will/LumenX.git--depth=1

cd LumenX/tools # 假设脚本存放在此目录

2. 执行自动化构建：
bash

sudo ./build-iso.sh

*脚本示例内容见下文*

3. 输出文件：
- 生成的 ISO 位于 `./output/lumenx-$(date +%Y%m%d).iso`
- 校验文件：`./output/SHA256SUMS`

## 📁 脚本示例 (`tools/build-iso.sh`)
bash

!/bin/bash
set -e

初始化构建环境
lb config \

--distribution unstable \

--architectures amd64 \

--binary-images iso-hybrid \

--mirror-bootstrap https://community-packages.deepin.com/deepin/\

--mirror-chroot-security https://security.debian.org/

复制自定义配置
cp -r config/* ./config/

构建镜像
sudo lb build 2>&1 | tee build.log

生成校验文件
sha256sum *.iso > SHA256SUMS

## ⚠️ 注意事项
1. 首次构建需下载约 5GB 的基础包
2. 建议在 screen/tmux 会话中运行
3. 完整构建需要 2-4 小时（取决于硬件性能）
