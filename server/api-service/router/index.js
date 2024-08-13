// 引入express
const router = require("express").Router(); // 创建一个路由对象
const db = require("../db/db"); // 引入数据库连接模块

/*
 * 获取用户列表信息
 * GET /user
 */
router.get("/user", (req, res) => {
  const sql = "SELECT * FROM Users";
  db.query(sql, (err, result) => {
    if (err) {
      return res.send({ message: "获取用户列表失败", status: 500 });
    }
    return res.send({ message: "获取用户列表成功", status: 200, data: result });
  });
});

/*
 * 登录
 * POST /login
 */
router.post("/login", (req, res) => {
  // 前端传递对象
  const { username, password } = req.query
  console.log(req.query)
  const sql = `SELECT * FROM users WHERE Username = '${username}' AND Pssword = ${password}`;
  db.query(sql, (err, result) => {
    if (err) {
      return res.send({ message: "登录失败", status: 500 });
    }
    if (result.length === 0) {
      return res.send({ message: "用户名或密码错误", status: 400 });
    }
    return res.send({ message: "登录成功", status: 200, data: result });
  });
});

/*
 * 项目创建
 * POST /project
 */
router.post("/project", (req, res) => {
  const { ProjectName, Description, AdminID } = req.query;
  console.log(ProjectName, Description, AdminID);
  const sql = `INSERT INTO Projects (ProjectName, Description, AdminID) VALUES ('${ProjectName}', '${Description}', ${AdminID})`;
  db.query(sql, (err, result) => {
    if (err) {
      return res.send({ message: "项目创建失败", status: 500 });
    }
    return res.send({ message: "项目创建成功", status: 200, data: result });
  });
});

/*
 * 项目列表
 * GET /project
 */
router.get("/project", (req, res) => {
  const sql = "SELECT * FROM Projects";
  db.query(sql, (err, result) => {
    if (err) {
      return res.send({ message: "获取项目列表失败", status: 500 });
    }
    return res.send({ message: "获取项目列表成功", status: 200, data: result });
  });
});

/*
 * 添加任务
 * POST /task
 */
router.post("/task", (req, res) => {
  const { ProjectID, TaskName, Detail, AssigneeID, CreatorID } = req.query;
  const time = new Date().toLocaleString();
  const sql = `INSERT INTO Tasks (ProjectID, TaskName, Detail, Status, AssigneeID, CreatorID, CreatedDate) VALUES 
    (${ProjectID}, '${TaskName}', '${Detail}', ${AssigneeID},${CreatorID},0,'${time}');`;
  db.query(sql, (err, result) => {
    if (err) {
      return res.send({ message: "添加任务失败", status: 500 });
    }
    return res.send({
      message: "添加任务成功",
      status: 200,
      data: result,
    });
  });
});

/*
 * 获取任务列表
 * GET /task
 */
router.get("/task", (req, res) => {
  const sql = "SELECT * FROM Tasks";
  db.query(sql, (err, result) => {
    if (err) {
      return res.send({ message: "获取任务列表失败", status: 500 });
    }
    return res.send({ message: "获取任务列表成功", status: 200, data: result });
  });
});

/*
 * 任务评论
 * POST /comment
 */
router.post("/comment", (req, res) => {
  const { TaskID, UserID, Comment } = req.query;
  console.log(TaskID, UserID, Comment);
  const sql = `INSERT INTO Comments (TaskID, UserID, Comment) VALUES (${TaskID}, ${UserID}, '${Comment}');`;
  db.query(sql, (err, result) => {
    if (err) {
      return res.send({ message: "添加评论失败", status: 500 });
    }
    return res.send({ message: "添加评论成功", status: 200, data: result });
  });
});

/*
 * 获取任务评论
 * GET /comment
 */
router.get("/comment", (req, res) => {
  const sql = "SELECT * FROM Comments";
  db.query(sql, (err, result) => {
    if (err) {
      return res.send({ message: "获取评论失败", status: 500 });
    }
    return res.send({ message: "获取评论成功", status: 200, data: result });
  });
});

/*
 * 添加任务附件
 * POST /attachment
 */
const multer = require('multer');
const upload = multer({ dest: 'uploads/' }) // 配置multer

router.post("/upload", upload.single('file'),(req,res)=> {
  console.log(req.query);
    const taskID = req.query.TaskID
    console.log(taskID)
    console.log(req.file)
    // 将文件信息存储到数据库中
    // INSERT INTO Attachments (AttachmentID, TaskID, FileName, FilePath, UploadDate) 
    // VALUES (4, 3, 'file3.jpg', '/files/', '2022-01-04');
    const path = req.file.path
    console.log(path)
    const escapedPath = db.escape(path)
    const sql = `INSERT INTO Attachments (TaskID, FileName, FilePath) VALUES (${1}, '${req.file.originalname}', ${escapedPath})`;
    db.query(sql, (err, result) => {
      console.log(err)
      if (err) {
        return res.send({ message: "上传失败", status: 500 });
      }
      console.log(result)
      return res.send({ message: "上传成功", status: 200, data: result });
    })
});

/*
 * 根据任务ID获取任务评分内容
 * GET /rating
 */
router.get("/rating", (req, res) => {
  const sql = `SELECT * FROM comments WHERE TaskID = ${req.query.TaskID}`;
  db.query(sql, (err, result) => {
    if (err) {
      return res.send({ message: "获取评分失败", status: 500 });
    }
    return res.send({ message: "获取评分成功", status: 200, data: result })
  })
})

exports.router = router;
