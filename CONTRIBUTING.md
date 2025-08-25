# 如何为 LumenX 贡献代码

欢迎参与 LumenX 项目！以下是贡献代码的规范流程：

## 🛠️ 开发环境准备
1. 确保已安装 Git 和基础开发工具：
bash

sudo apt install git build-essential

2. 克隆仓库到本地：
bash

git clone https://github.com/Skyward-Will/LumenX.git

cd LumenX

## 📝 贡献流程
1. **创建分支**  
基于 `main` 分支创建新分支：
bash

git checkout -b feat/your-feature-name

2. **代码规范**  
- Shell 脚本使用 2 空格缩进
- 配置文件保持与 Deepin 原版相同的格式
- 所有修改需添加注释说明

3. **提交信息**  
使用规范化的提交信息格式：
类型(范围): 简要描述

详细说明（可选）

Fixes #Issue编号（如适用）

**类型示例**：`feat`, `fix`, `docs`, `style`, `refactor`

4. **推送代码**
bash

git push origin feat/your-feature-name

5. **创建 Pull Request**  
在 GitHub 页面发起 PR，需包含：
- 修改目的说明
- 测试结果（如有）
- 关联的 Issue 编号

## 🐛 报告问题
在 [Issues](https://github.com/Skyward-Will/LumenX/issues) 中提交问题时请注明：
1. 系统环境（Deepin 版本/硬件）
2. 复现步骤
3. 错误日志（使用 `journalctl -xe` 获取）

## 📜 行为准则
本项目遵循 [开源社区行为准则](https://www.contributor-covenant.org/)，请保持专业友善的交流态度。
