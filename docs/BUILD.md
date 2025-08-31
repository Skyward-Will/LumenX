# LumenX 构建指南

## 1. 准备环境
  
bash

sudo apt update

sudo apt install -y build-essential libncurses-dev libssl-dev \

flex bison bc qemu qemu-kvm xorriso
## 2. 内核配置
  
bash

cd src/kernel

make defconfig          # 生成默认配置

make menuconfig         # 自定义配置（可选）
## 3. 编译安装
bash

make -j$(nproc)         # 编译内核

sudo make modules_install

sudo make install

## 4. 制作ISO
bash

./tools/iso_builder.sh --kernel 6.16.3 --output lumenx.iso
