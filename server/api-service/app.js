const express = require("express"); // 引入express
const app = express(); // 得到一个app实例
const { router } = require("./router") // 如果router是个目录 会自动找router/index.js文件
// 导入数据库配置文件
require('./db/db.js')
// 配置cors
const cors = require('cors')
app.use(cors())
// app注册
app.use(router) // 注册路由
app.use(express.json())

app.listen(3000, () => {
  console.log("web服务启动完毕 http://localhost:3000");
})