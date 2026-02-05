# Muma 项目结构说明

## 📁 目录结构

```
muma/
├── public/                    # 静态文件目录
│   └── helloyan.html         # 主应用文件（单页面应用）
│
├── server.js                  # Express 服务器（提供静态文件服务）
├── package.json              # Node.js 项目配置和依赖
├── railway.json              # Railway 部署配置
├── nixpacks.toml             # Nixpacks 构建配置
├── Dockerfile                # Docker 镜像配置（可选）
├── .gitignore                # Git 忽略规则
├── .env.example              # 环境变量示例
│
├── setup.sh                  # 快速部署准备脚本
├── README.md                 # 项目说明文档
├── DEPLOYMENT_CHECKLIST.md   # 部署检查清单
└── PROJECT_STRUCTURE.md      # 本文件
```

## 📄 文件说明

### 核心文件

#### `public/helloyan.html`
- **作用**: 主应用文件，包含所有前端逻辑
- **内容**:
  - HTML 结构
  - Tailwind CSS（通过 CDN）
  - JavaScript 代码
  - API 调用逻辑
  - UI 组件和交互
- **特点**:
  - 单文件应用，无需构建
  - 响应式设计
  - 支持亮色/暗色主题
  - 实时数据更新

#### `server.js`
- **作用**: Express 服务器，提供静态文件服务
- **主要功能**:
  - 提供 `public/` 目录的静态文件
  - 处理根路由 `/` 重定向到 helloyan.html
  - 提供 `/health` 健康检查端点
  - 支持 gzip 压缩
- **端口**:
  - 生产环境：使用 `process.env.PORT`（Railway 自动设置）
  - 本地开发：默认 3000

### 配置文件

#### `package.json`
- **作用**: Node.js 项目配置
- **关键配置**:
  ```json
  {
    "name": "muma-crypto-monitor",
    "main": "server.js",
    "scripts": {
      "start": "node server.js"
    },
    "engines": {
      "node": ">=18.0.0"
    },
    "dependencies": {
      "express": "^4.18.2",
      "compression": "^1.7.4"
    }
  }
  ```

#### `railway.json`
- **作用**: Railway 平台特定配置
- **关键配置**:
  ```json
  {
    "build": {
      "builder": "NIXPACKS"
    },
    "deploy": {
      "startCommand": "node server.js",
      "healthcheckPath": "/health"
    }
  }
  ```

#### `nixpacks.toml`
- **作用**: Nixpacks 构建配置（Railway 默认构建器）
- **关键配置**:
  ```toml
  [phases.build]
  cmds = ["npm install"]

  [phases.start]
  cmds = ["node server.js"]
  ```

#### `Dockerfile`
- **作用**: Docker 镜像配置（备选方案）
- **用途**: 如果需要使用 Docker 部署而非 Railway

### 辅助文件

#### `.gitignore`
- **作用**: 指定 Git 忽略的文件和目录
- **忽略内容**:
  - `node_modules/` - 依赖目录
  - `.env` - 环境变量
  - `.railway/` - Railway 本地配置
  - IDE 配置文件

#### `.env.example`
- **作用**: 环境变量示例模板
- **用途**: 复制为 `.env` 后根据需要配置

#### `setup.sh`
- **作用**: 快速部署准备脚本
- **功能**:
  - 安装依赖
  - 本地测试
  - 初始化 Git 仓库
  - 提供后续部署指引

### 文档文件

#### `README.md`
- **作用**: 项目主文档
- **内容**:
  - 项目简介
  - 技术栈
  - Railway 部署指南
  - 本地运行说明
  - 常见问题

#### `DEPLOYMENT_CHECKLIST.md`
- **作用**: 部署检查清单
- **内容**:
  - 部署前检查项
  - 部署步骤
  - 部署后验证
  - 故障排查

#### `PROJECT_STRUCTURE.md`
- **作用**: 本文件，项目结构说明

## 🔧 工作流程

### 本地开发流程

```
1. 修改代码 (helloyan.html 或 server.js)
2. 启动本地服务器: npm start
3. 访问 http://localhost:3000 测试
4. 提交代码: git add . && git commit -m "..."
5. 推送到 GitHub: git push
6. Railway 自动部署
```

### Railway 部署流程

```
GitHub 仓库
    ↓
Railway 检测到推送
    ↓
克隆代码
    ↓
安装依赖 (npm install)
    ↓
启动服务 (node server.js)
    ↓
健康检查 (/health)
    ↓
部署成功 → 提供访问 URL
```

## 🚀 启动流程

### 本地启动

```bash
# 1. 进入项目目录
cd muma

# 2. 安装依赖（首次运行）
npm install

# 3. 启动服务器
npm start

# 4. 访问应用
# 打开浏览器访问 http://localhost:3000
```

### Railway 启动（自动化）

```bash
# Railway 自动执行以下步骤：
1. npm install
2. node server.js
3. 健康检查 /health
4. 暴露服务到公网
```

## 📊 数据流

### 前端数据流

```
helloyan.html (浏览器)
    ↓
直接调用交易所 API
    ↓
Binance API → 返回价格/成交量
OKX API → 返回价格/成交量
Bybit API → 返回价格/成交量
Followin API → 返回新闻
    ↓
数据处理和渲染
    ↓
显示在页面上
```

### 后端服务流

```
客户端请求
    ↓
server.js (Express)
    ↓
静态文件服务
    ↓
返回 helloyan.html
    ↓
前端在浏览器中运行
```

## 🔒 安全考虑

1. **环境变量**: 敏感配置使用 `.env` 文件
2. **CORS**: 前端直接调用交易所 API，后端不做限制
3. **依赖**: 仅使用必要的 npm 包
4. **健康检查**: 提供 `/health` 端点用于监控

## 📈 性能优化

1. **Gzip 压缩**: 服务器自动压缩静态文件
2. **CDN**: Tailwind CSS 通过 CDN 加载
3. **缓存**: 前端使用 localStorage 缓存数据
4. **按需加载**: API 请求按需发起

## 🛠️ 扩展建议

### 可能的扩展方向

1. **后端 API**:
   - 添加代理服务解决 CORS 问题
   - 实现数据聚合和缓存
   - 添加用户认证

2. **数据库**:
   - PostgreSQL 存储历史数据
   - Redis 缓存热点数据
   - MongoDB 存储用户配置

3. **监控**:
   - 添加错误追踪（Sentry）
   - 性能监控（New Relic）
   - 日志聚合（Loggly）

4. **功能增强**:
   - WebSocket 实时推送
   - 用户订阅通知
   - 数据导出功能

## 📝 注意事项

1. **端口配置**: 必须使用 `process.env.PORT` 以适配 Railway
2. **健康检查**: 必须提供 `/health` 端点
3. **静态文件**: 所有前端文件必须在 `public/` 目录
4. **依赖更新**: 定期更新 npm 包以确保安全

## 🆘 获取帮助

- 查看日志: Railway 项目 → Logs
- 查看 README.md 了解部署步骤
- 查看 DEPLOYMENT_CHECKLIST.md 进行故障排查
