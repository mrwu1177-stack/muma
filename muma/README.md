# Muma - 加密货币异动监控平台

## 部署到 Railway

### 快速部署（3 步）

#### 1. 推送到 GitHub
```bash
cd muma
git init
git add .
git commit -m "Initial commit"
git remote add origin https://github.com/你的用户名/muma.git
git branch -M main
git push -u origin main
```

#### 2. 在 Railway 部署
- 访问 [Railway](https://railway.com/)
- 点击 "New Project" → "Deploy from GitHub repo"
- 选择 `muma` 仓库
- 点击 "Deploy Now"
- 等待 2-3 分钟自动部署

#### 3. 访问应用
部署完成后，Railway 会提供 HTTPS URL，直接访问即可！

## 本地运行

```bash
cd muma
npm install
npm start
# 访问 http://localhost:3000
```

## 项目文件

```
muma/
├── public/
│   └── helloyan.html       # 主应用文件
├── server.js               # Express 服务器
├── package.json            # 项目配置
├── package-lock.json       # 依赖锁定
├── railway.json            # Railway 配置
├── nixpacks.toml           # 构建配置
└── .gitignore              # Git 忽略
```

## 技术栈

- 前端: 原生 JavaScript + Tailwind CSS
- 后端: Node.js + Express
- 数据源: Binance API, OKX API, Bybit API, Followin API

## 更新部署

修改代码后，只需推送代码，Railway 会自动重新部署：
```bash
git add .
git commit -m "Update code"
git push
```
