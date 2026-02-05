# Muma - 加密货币异动监控平台

## 项目简介

Muma 是一个综合性的加密货币监控平台，提供以下功能：
- 实时价格异动监控（基于波浪理论判断）
- 新闻资讯聚合
- 热门交易对追踪
- 多数据源支持（Binance/OKX/Bybit）
- 亮色/暗色主题切换

## 技术栈

- **前端**: 原生 JavaScript + Tailwind CSS
- **后端**: Node.js + Express
- **数据源**: Binance API, OKX API, Bybit API, Followin API

## Railway 部署指南

### 方式一：通过 GitHub 部署（推荐）

1. **初始化 Git 仓库**
```bash
cd muma
git init
git add .
git commit -m "Initial commit"
```

2. **推送到 GitHub**
```bash
# 创建 GitHub 仓库后
git remote add origin https://github.com/你的用户名/muma.git
git branch -M main
git push -u origin main
```

3. **在 Railway 上部署**
   - 访问 [Railway](https://railway.com/)
   - 点击 "New Project" -> "Deploy from GitHub repo"
   - 选择刚刚推送的 `muma` 仓库
   - Railway 会自动检测 Node.js 项目并开始部署
   - 部署完成后，Railway 会提供一个 HTTPS URL

### 方式二：通过 Railway CLI 部署

1. **安装 Railway CLI**
```bash
npm install -g @railway/cli
```

2. **登录 Railway**
```bash
railway login
```

3. **初始化项目**
```bash
cd muma
railway init
```

4. **部署**
```bash
railway up
```

### 部署后配置

1. **设置自定义域名**（可选）
   - 在 Railway 项目设置中，点击 "Domains"
   - 添加自定义域名并配置 DNS

2. **环境变量**（可选）
   - 目前项目无需额外环境变量
   - 如需配置，可在 Railway 项目设置的 "Variables" 中添加

## 本地运行

1. **安装依赖**
```bash
cd muma
npm install
```

2. **启动服务器**
```bash
npm start
```

3. **访问应用**
   - 打开浏览器访问 `http://localhost:3000`

## 项目结构

```
muma/
├── public/
│   └── helloyan.html       # 主应用文件
├── server.js               # Express 服务器
├── package.json            # 项目配置和依赖
├── railway.json            # Railway 部署配置
├── .gitignore             # Git 忽略文件
└── README.md              # 项目说明
```

## 注意事项

1. **端口配置**
   - Railway 自动分配 PORT 环境变量
   - 代码已适配 Railway 的端口配置

2. **健康检查**
   - 提供 `/health` 端点用于 Railway 健康检查
   - 部署前确保服务正常运行

3. **构建配置**
   - 使用 Nixpacks 进行构建
   - 自动安装 Node.js 依赖

4. **跨域问题**
   - 所有 API 请求已在前端处理
   - 服务器仅提供静态文件服务

## 更新部署

当你修改了代码后，只需推送到 GitHub，Railway 会自动重新部署：

```bash
git add .
git commit -m "Update code"
git push
```

## 常见问题

### Q: 部署后页面无法访问？
A: 检查 Railway 日志，确认服务是否正常启动。确保 `server.js` 和 `package.json` 配置正确。

### Q: API 数据无法加载？
A: 这是前端直接调用交易所 API， Railway 服务器不需要做额外配置。如果仍有问题，检查浏览器的开发者工具（F12）查看网络请求状态。

### Q: 如何查看部署日志？
A: 在 Railway 项目页面，点击 "Logs" 查看实时日志。

### Q: 如何回滚到之前的版本？
A: 在 Railway 项目页面，点击 "Deployments"，选择之前的部署版本并点击 "Redeploy"。

## 许可证

MIT License

## 联系方式

如有问题，请通过 GitHub Issues 提交。
