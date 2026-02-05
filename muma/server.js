const express = require('express');
const path = require('path');
const app = express();
const PORT = process.env.PORT || 3000;

// 启用 gzip 压缩
const compression = require('compression');
app.use(compression());

// 提供静态文件服务
app.use(express.static(path.join(__dirname, 'public')));

// 所有路由重定向到 helloyan.html
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'helloyan.html'));
});

// 健康检查端点
app.get('/health', (req, res) => {
  res.status(200).json({ status: 'ok', timestamp: new Date().toISOString() });
});

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
  console.log(`Access the app at: http://localhost:${PORT}`);
});
