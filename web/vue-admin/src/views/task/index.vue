<template>
  <div class="container">
    <div class="app-container">
      <div class="role-operate">
        <el-button
          size="mini"
          type="primary"
          @click="showDialog = true"
        >新增任务</el-button>
      </div>
      <!-- 放置table组件 -->
      <el-table :data="taskList">
        <!-- 放置列 -->
        <el-table-column prop="TaskID" align="center" width="200" label="任务ID" />
        <el-table-column prop="ProjectID" align="center" width="200" label="项目编号" />
        <el-table-column prop="TaskName" align="center" width="200" label="任务名称" />
        <el-table-column prop="Status" align="center" label="状态">
          <template slot-scope="scope">
            <el-tag v-if="scope.row.Status === 0" type="danger">未开始</el-tag>
            <el-tag v-if="scope.row.Status === 1" type="success">进行中</el-tag>
            <el-tag v-if="scope.row.Status === 2" type="info">已完成</el-tag>
          </template>
        </el-table-column>
        <el-table-column align="center" label="描述" />
        <el-table-column align="center" label="操作">
          <template slot-scope="scope">
            <el-button type="text" size="mini" @click="score(scope.row)">评价</el-button>
            <el-button type="text" size="mini" @click="show(scope.row)">查看评价</el-button>
          </template>
        </el-table-column>
      </el-table>
      <!-- 放置分页组件 -->
      <el-row type="flex" style="height: 60px" align="middle" justify="end">
        <!-- 放置分页组件 -->
        <el-pagination layout="prev, pager, next" />
      </el-row>
    </div>
    <el-dialog width="600px" title="新增任务" :visible.sync="showDialog">
      <!-- 表单内容 -->
      <el-form label-width="90px">
        <el-form-item label="请选择关联项目">
          <el-select v-model="ProjectID" placeholder="请选择项目">
            <el-option v-for="item in projectList" :key="item.ProjectID" :label="item.ProjectName" :value="item.ProjectID" />
          </el-select>
        </el-form-item>
        <el-form-item label="任务名称">
          <el-input v-model="TaskName" placeholder="请输入任务名称" />
        </el-form-item>
        <el-form-item label="任务分配">
          <el-select v-model="AssigneeID" placeholder="请选择人员">
            <el-option v-for="item in userInfo" :key="item.UserID" :label="item.Username" :value="item.UserID" />
          </el-select>
        </el-form-item>
        <el-form-item label="任务内容">
          <el-input
            v-model="Detail"
            placeholder="请输入任务内容"
            type="textarea"
            :rows="3"
            style="width: 300px"
            size="mini"
          />
        </el-form-item>
        <el-form-item label="文件上传">
          <el-upload
            class="upload-demo"
            drag
            action="http://localhost:3000/upload"
            multiple
          >
            <i
              class="el-icon-
  upload"
            />
            <div class="el-upload__text">将文件拖到此处，或<em>点击上传</em></div>
            <!-- <div slot="tip" class="el-upload__tip">只能上传jpg/png文件，且不超过500kb</div> -->
          </el-upload>
        </el-form-item>
        <el-form-item>
          <el-row type="flex" justify="center">
            <el-button type="primary" size="mini" @click="isOk">确定</el-button>
            <el-button size="mini" @click="showDialog = false">取消</el-button>
          </el-row>
        </el-form-item>
      </el-form>
    </el-dialog>
    <el-dialog width="600px" title="任务评价" :visible.sync="showDialogEdit">
      <!-- 表单内容 -->
      <el-form label-width="120px">
        <el-form-item label="内容评价">
          <el-input
            v-model="Comment"
            placeholder="请输入任务内容"
            type="textarea"
            :rows="3"
            style="width: 300px"
            size="mini"
          />
        </el-form-item>
        <el-form-item>
          <el-row type="flex" justify="center">
            <el-button type="primary" size="mini" @click="isOkEdit">确定</el-button>
            <el-button size="mini" @click="showDialogEdit = false">取消</el-button>
          </el-row>
        </el-form-item>
      </el-form>
    </el-dialog>
    <el-dialog width="600px" title="新增任务" :visible.sync="showDialog">
      <!-- 表单内容 -->
      <el-form label-width="90px">
        <el-form-item label="请选择关联项目">
          <el-select v-model="ProjectID" placeholder="请选择项目">
            <el-option v-for="item in projectList" :key="item.ProjectID" :label="item.ProjectName" :value="item.ProjectID" />
          </el-select>
        </el-form-item>
        <el-form-item label="任务名称">
          <el-input v-model="TaskName" placeholder="请输入任务名称" />
        </el-form-item>
        <el-form-item label="任务分配">
          <el-select v-model="AssigneeID" placeholder="请选择人员">
            <el-option v-for="item in userInfo" :key="item.UserID" :label="item.Username" :value="item.UserID" />
          </el-select>
        </el-form-item>
        <el-form-item label="任务内容">
          <el-input
            v-model="Detail"
            placeholder="请输入任务内容"
            type="textarea"
            :rows="3"
            style="width: 300px"
            size="mini"
          />
        </el-form-item>
        <el-form-item label="文件上传">
          <el-upload
            class="upload-demo"
            drag
            action="http://localhost:3000/upload"
            multiple
          >
            <i
              class="el-icon-
  upload"
            />
            <div class="el-upload__text">将文件拖到此处，或<em>点击上传</em></div>
            <!-- <div slot="tip" class="el-upload__tip">只能上传jpg/png文件，且不超过500kb</div> -->
          </el-upload>
        </el-form-item>
        <el-form-item>
          <el-row type="flex" justify="center">
            <el-button type="primary" size="mini" @click="isOk">确定</el-button>
            <el-button size="mini" @click="showDialog = false">取消</el-button>
          </el-row>
        </el-form-item>
      </el-form>
    </el-dialog>
    <el-dialog width="600px" title="任务评价" :visible.sync="showScore">
      <!-- 表单内容 -->
      <el-form label-width="120px">
        <el-card class="box-card">
          <div slot="header" class="clearfix">
            <span>查看评价</span>
          </div>
          <div v-for="item in TaskScoreList" :key="item.TaskID" class="text item">
            {{ item.CommentID + '、' + item.Comment }}
          </div>
        </el-card>
      </el-form>
    </el-dialog>
  </div>
</template>

<script>
import request from '@/utils/request'
export default {
  name: 'Score',
  data() {
    return {
      showDialog: false,
      showDialogEdit: false,
      showScore: false,
      radio: '1',
      projectList: [],
      ProjectName: '',
      Description: '',
      ProjectID: '',
      TaskName: '',
      Detail: '',
      AssigneeID: '',
      CreatorID: '',
      userInfo: [],
      taskList: [],
      Comment: '',
      TaskID: '',
      TaskScoreList: []
    }
  },
  created() {
    this.getProjectID()
    this.getUserInfo()
    this.getTaskList()
  },
  methods: {
    async getProjectID() {
      const res = await request.get('/project')
      console.log(res)
      this.projectList = res.data
    },
    async getUserInfo() {
      const res = await request.get('/user')
      this.userInfo = res.data
    },
    async getTaskList() {
      const res = await request.get('/task')
      this.taskList = res.data
    },
    score(row) {
      this.showDialogEdit = true
      this.TaskID = row.TaskID
    },
    show(row) {
      this.getScoreList(row.TaskID)
    },
    async getScoreList(TaskID) {
      console.log(TaskID)
      const res = await request.get(`/rating?TaskID=${TaskID}`)
      this.TaskScoreList = res.data
      this.showScore = true
    },
    async isOkEdit() {
      const id = localStorage.getItem('UserID')
      await request.post(`/comment?TaskID=${this.TaskID}&UserID=${id}&Comment=${this.Comment}`)
      this.showDialogEdit = false
      this.$message.success('评价成功')
      this.Comment = ''
    },
    async isOk() {
      this.showDialog = false
      const id = localStorage.getItem('UserID')
      this.CreatorID = id
      const res = await request.post(`/task?ProjectID=${this.ProjectID}&TaskName=${this.TaskName}&Detail=${this.Detail}&AssigneeID=${this.AssigneeID}&CreatorID=${this.CreatorID}`)
      console.log(res)
      if (res.status === 200) {
        this.$message.success('添加成功')
        this.getTaskList()
      } else {
        this.$message.error('添加失败')
      }
    }
  }
}
</script>
  <style lang="scss" scoped>
  .role-operate {
    padding: 10px;
  }
  .text {
    font-size: 14px;
  }
  </style>
