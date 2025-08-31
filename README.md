# LumenX Linux

![LumenX Logo](docs/logo.png) 
一个轻量级、高度可定制的Linux发行版，从内核到用户空间完全由个人构建。

## ✨ 特性
- 基于Linux 6.16.3内核深度优化
- 极简主义设计，专注开发体验
- 支持主流硬件架构（x86_64）
- 可选的GNOME/XFCE桌面环境集成

## 🚀 快速开始

### 编译要求
- Ubuntu 22.04+ 系统
- 至少20GB磁盘空间
- GCC 11+ 工具链

1. 克隆仓库
git clone https://github.com/Skyward-Will/LumenX.git

cd LumenX

2. 编译内核
make -C src/kernel defconfig

make -C src/kernel -j$(nproc)

3. 构建ISO镜像
./tools/iso_builder.sh

## 📜 许可证
本项目采用 **[GPL-2.0](#)** 许可证发布 - 详见 [LICENSE](LICENSE) 文件。

## 🤝 参与贡献
欢迎提交Issue或Pull Request！请确保：
1. 代码符合GPL-2.0要求
2. 提交前运行 `scripts/checkpatch.pl` 检查代码风格

## 📧 联系作者
- GitHub: [@Skyward-Will](https://github.com/Skyward-Will)
- 微信公众号: 嗨出新天地

⚖️ ​许可证选择建议​
作为个人开发者，推荐使用 ​GPL-2.0​（GNU通用公共许可证第2版），原因：

1.
​传染性​：确保你的内核修改成果保持开源

2.
​Linux兼容​：与官方Linux内核许可证一致

3.
​广泛认可​：最受开源社区信任的许可证之一

如何添加许可证：
1.
在仓库根目录创建 LICENSE文件

2.
复制官方文本：GPL-2.0全文

3.
或者用GitHub自动生成：
curl -o LICENSE https://www.gnu.org/licenses/old-licenses/gpl-2.0.txt
🔧 ​初始化仓库的完整命令​

# 创建仓库目录结构
mkdir -p LumenX/{docs,src/kernel,src/scripts,configs,tools}
cd LumenX

# 初始化README和许可证
curl -o LICENSE https://www.gnu.org/licenses/old-licenses/gpl-2.0.txt
echo "# LumenX Linux" > README.md

# 创建.gitignore（避免上传临时文件）
cat > .gitignore << EOF
*.o
*.ko
*.mod
*.cmd
.tmp_versions/
modules.order
Module.symvers
EOF

# 初始化Git仓库
git init
git add .
git commit -m "Initial commit: LumenX project structure"
git remote add origin https://github.com/Skyward-Will/LumenX.git
git push -u origin main
