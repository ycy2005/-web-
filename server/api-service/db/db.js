const mysql = require('mysql');

// 导入数据库连接
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'qazokm123456',
  database: 'agile',
})

connection.connect((err) => {
  if (err) {
    console.log('数据库连接失败', err);
  }
  console.log('数据库连接成功');
})

module.exports = connection