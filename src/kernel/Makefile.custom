# LumenX 自定义内核编译规则
# 用法: make -f Makefile.custom [target]

# 目标架构
ARCH ?= x86_64
# 内核版本
KERNEL_VERSION := 6.16.3
# 自定义标识
EXTRAVERSION := -LumenX

# 默认配置
DEFCONFIG := lumenx_defconfig

.PHONY: all clean iso

all:
	@echo "Building Linux kernel $(KERNEL_VERSION)$(EXTRAVERSION)"
	$(MAKE) -C $(CURDIR) O=$(CURDIR)/build ARCH=$(ARCH) $(DEFCONFIG)
	$(MAKE) -C $(CURDIR) O=$(CURDIR)/build ARCH=$(ARCH) -j$(shell nproc)

clean:
	rm -rf build modules.img

iso: all
	@echo "Preparing kernel for ISO..."
	cp build/arch/$(ARCH)/boot/bzImage ../tools/kernel.img
	$(MAKE) -C $(CURDIR) O=$(CURDIR)/build ARCH=$(ARCH) modules_install INSTALL_MOD_PATH=../tools/modules
