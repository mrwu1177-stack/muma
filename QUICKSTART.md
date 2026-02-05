# Muma - 快速启动指南

## 🚀 3 步快速部署到 Railway

### 第 1 步：推送到 GitHub

```bash
# 1. 进入项目目录
cd muma

# 2. 运行部署准备脚本（可选，但推荐）
./setup.sh

# 3. 或者手动执行：
git init
git add .
git commit -m "Initial commit"

# 4. 在 GitHub 创建新仓库：https://github.com/new

# 5. 推送到 GitHub（替换你的用户名）
git remote add origin https://github.com/你的用户名/muma.git
git branch -M main
git push -u origin main
```

### 第 2 步：在 Railway 部署

1. 访问 [Railway](https://railway.com/)
2. 点击 **New Project** → **Deploy from GitHub repo**
3. 选择 `muma` 仓库
4. 点击 **Deploy Now**
5. 等待 2-3 分钟，Railway 会自动部署

### 第 3 步：访问应用

部署完成后，Railway 会提供一个 HTTPS URL，例如：
```
https://muma-production.up.railway.app
```

直接访问这个 URL 即可使用应用！

---

## 💻 本地运行

### 方式一：使用 npm

```bash
cd muma
npm install
npm start
```

然后访问 `http://localhost:3000`

### 方式二：使用 Docker（可选）

```bash
cd muma
docker build -t muma .
docker run -p 3000:3000 muma
```

然后访问 `http://localhost:3000`

---

## 📋 项目文件清单

### 核心文件
- ✅ `public/helloyan.html` - 主应用（271KB）
- ✅ `server.js` - Express 服务器
- ✅ `package.json` - 项目配置

### 部署配置
- ✅ `railway.json` - Railway 配置
- ✅ `nixpacks.toml` - 构建配置
- ✅ `Dockerfile` - Docker 配置

### 辅助文件
- ✅ `setup.sh` - 快速部署脚本
- ✅ `.gitignore` - Git 忽略规则
- ✅ `.env.example` - 环境变量示例

### 文档
- ✅ `README.md` - 完整说明文档
- ✅ `DEPLOYMENT_CHECKLIST.md` - 部署检查清单
- ✅ `PROJECT_STRUCTURE.md` - 项目结构说明
- ✅ `QUICKSTART.md` - 本文件

---

## 🔍 验证部署

### 检查清单

- [ ] 代码已推送到 GitHub
- [ ] Railway 项目已创建
- [ ] 部署成功（绿色勾）
- [ ] 点击 Railway 提供的 URL 可以访问
- [ ] 页面加载正常
- [ ] 数据加载正常

### 测试步骤

1. 访问 Railway 提供的 URL
2. 检查页面是否正常显示
3. 打开浏览器开发者工具（F12）
4. 查看 Console 是否有错误
5. 查看 Network 选项卡，确认 API 请求正常

---

## ⚡ 一键部署脚本

```bash
#!/bin/bash
# 一键部署到 Railway

echo "🚀 开始部署到 Railway..."

# 1. 初始化 Git 仓库
if [ ! -d ".git" ]; then
  git init
  git add .
  git commit -m "Initial commit"
  echo "✅ Git 仓库初始化完成"
fi

# 2. 推送到 GitHub
echo "📤 推送到 GitHub..."
git push origin main

# 3. 提示去 Railway 部署
echo ""
echo "✅ 代码已推送！"
echo ""
echo "下一步："
echo "1. 访问 https://railway.com/"
echo "2. 点击 'New Project' -> 'Deploy from GitHub repo'"
echo "3. 选择 muma 仓库"
echo "4. 点击 'Deploy Now'"
echo ""
echo "等待 2-3 分钟，部署完成后即可访问！"
```

保存为 `deploy.sh` 并执行：
```bash
chmod +x deploy.sh
./deploy.sh
```

---

## 🆘 常见问题

### Q: 部署失败怎么办？
A: 查看 Railway 项目页面的 "Logs"，查看错误信息。常见问题：
- 依赖安装失败：检查 `package.json` 配置
- 端口配置错误：确认 `server.js` 使用了 `process.env.PORT`
- 健康检查失败：确认 `/health` 端点正常响应

### Q: 如何更新应用？
A: 只需推送代码到 GitHub，Railway 会自动重新部署：
```bash
git add .
git commit -m "Update code"
git push
```

### Q: 如何查看部署日志？
A: 在 Railway 项目页面，点击 "Logs" 查看实时日志。

### Q: 数据加载失败怎么办？
A: 这是前端直接调用交易所 API，Railway 不影响。检查：
- 浏览器网络连接
- API 端点是否可访问
- 浏览器开发者工具（F12）查看 Network 状态

### Q: 如何添加自定义域名？
A: 在 Railway 项目设置中，点击 "Domains"，添加自定义域名并配置 DNS。

---

## 📚 更多文档

- 📖 [完整说明文档](README.md)
- ✅ [部署检查清单](DEPLOYMENT_CHECKLIST.md)
- 🏗️ [项目结构说明](PROJECT_STRUCTURE.md)

---

## 🎉 完成！

恭喜你完成了 Muma 的 Railway 部署！

如有任何问题，请查看文档或提交 Issue。

**祝使用愉快！** 🚀
