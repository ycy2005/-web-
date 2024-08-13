<template>
  <div class="container">
    <div class="app-container">
      <!-- 角色管理内容 -->
      <div class="role-operate">
        <el-button size="mini" type="primary" @click="showDialog = true"
          >新增项目</el-button
        >
      </div>
      <!-- 放置table组件 -->
      <el-table :data="projectList" border>
        <!-- 放置列 -->
        <el-table-column prop="ProjectID" align="center" width="200" label="项目编号" />
        <el-table-column prop="ProjectName" align="center" width="200" label="项目名称" />
        <el-table-column prop="Description" align="center" width="200" label="任务描述" sortable />
        <!-- <el-table-column align="center" label="操作">
          <template>
            <el-button size="mini" type="text">删除</el-button>
          </template>
        </el-table-column> -->
      </el-table>
      <!-- 放置分页组件 -->
      <el-row type="flex" style="height: 60px" align="middle" justify="end">
        <!-- 放置分页组件 -->
        <el-pagination layout="prev, pager, next" />
      </el-row>
    </div>
    <el-dialog width="600px" title="新增项目" :visible.sync="showDialog">
      <!-- 表单内容 -->
      <el-form label-width="120px">
        <el-form-item label="项目名称">
          <el-input
            v-model="ProjectName"
            type="input"
            style="width: 200px"
            size="mini"
          />
        </el-form-item>
        <el-form-item label="项目描述">
          <el-input
            v-model="Description"
            type="textarea"
            :rows="3"
            style="width: 300px"
            size="mini"
          />
        </el-form-item>
        <el-form-item>
          <el-row type="flex" justify="center">
            <el-button type="primary" size="mini" @click="isOK">确定</el-button>
            <el-button size="mini">取消</el-button>
          </el-row>
        </el-form-item>
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
      radio: '1',
      projectList: [],
      ProjectName: '',
      Description: ''
    }
  },
  created() {
    this.getProjectList()
  },
  methods: {
    // 查看项目列表
    async getProjectList() {
      const res = await request.get('/project')
      this.projectList = res.data
    },
    async isOK() {
      this.showDialog = false
      const UserID = localStorage.getItem('UserID')
      // 发送请求
      const res = await request.post(`/project?ProjectName=${this.ProjectName}&Description=${this.Description}&AdminID=${UserID}`)
      if (res.status === 200) {
        this.$message.success('添加成功')
        this.getProjectList()
      } else {
        this.$message.error('添加失败')
      }
      this.ProjectName = ''
      this.Description = ''
    }
  }
}
</script>

<style lang="scss" scoped>
.role-operate {
  padding: 10px;
}
</style>
