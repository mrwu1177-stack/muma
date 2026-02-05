#!/bin/bash

echo "=========================================="
echo "Muma - Railway 部署准备脚本"
echo "=========================================="
echo ""

# 检查是否在 muma 目录
if [ ! -f "package.json" ]; then
  echo "❌ 错误：请在 muma 目录下运行此脚本"
  exit 1
fi

echo "📦 步骤 1: 安装依赖..."
npm install
if [ $? -ne 0 ]; then
  echo "❌ 依赖安装失败"
  exit 1
fi
echo "✅ 依赖安装成功"
echo ""

echo "🧪 步骤 2: 本地测试..."
echo "启动服务器，按 Ctrl+C 停止..."
npm start &
SERVER_PID=$!
echo "✅ 服务器已启动 (PID: $SERVER_PID)"
echo "等待 5 秒..."
sleep 5

# 测试健康检查
HEALTH_CHECK=$(curl -s http://localhost:3000/health)
if [ $? -eq 0 ]; then
  echo "✅ 健康检查通过: $HEALTH_CHECK"
else
  echo "⚠️  健康检查失败，但继续..."
fi

# 停止服务器
kill $SERVER_PID 2>/dev/null
echo "✅ 服务器已停止"
echo ""

echo "📋 步骤 3: Git 仓库初始化..."
if [ -d ".git" ]; then
  echo "⚠️  Git 仓库已存在，跳过初始化"
else
  git init
  git add .
  git commit -m "Initial commit"
  echo "✅ Git 仓库初始化完成"
fi
echo ""

echo "=========================================="
echo "✅ 部署准备完成！"
echo "=========================================="
echo ""
echo "下一步操作："
echo "1. 在 GitHub 上创建新仓库：https://github.com/new"
echo "2. 运行以下命令推送到 GitHub："
echo ""
echo "   git remote add origin https://github.com/你的用户名/muma.git"
echo "   git branch -M main"
echo "   git push -u origin main"
echo ""
echo "3. 在 Railway 上部署："
echo "   - 访问 https://railway.com/"
echo "   - 点击 'New Project' -> 'Deploy from GitHub repo'"
echo "   - 选择 muma 仓库"
echo "   - Railway 会自动部署"
echo ""
echo "=========================================="
