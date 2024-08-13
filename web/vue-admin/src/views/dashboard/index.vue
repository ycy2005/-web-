<template>
  <div class="dashboard-container">
    <el-table>
      <el-table-column align="center" label="头像" />
      <el-table-column label="姓名" />
      <el-table-column label="账号" />
      <el-table-column label="当前积分" sortable />
      <el-table-column label="原始积分" />
      <el-table-column label="增加积分" />
      <el-table-column label="扣除积分" />
      <el-table-column label="操作" width="280px">
        <template>
          <el-button size="mini" type="text">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    <!-- 分页 -->
    <el-row style="height: 60px" align="middle" type="flex" justify="end">
      <el-pagination layout="total,prev, pager, next" :total="1000" />
    </el-row>
  </div>
</template>

<script>
import { mapGetters } from "vuex";

export default {
  name: "Dashboard",
  computed: {
    ...mapGetters(["name"]),
  },
};
</script>

<style lang="scss" scoped>
.dashboard {
  &-container {
    margin: 30px;
  }
  &-text {
    font-size: 30px;
    line-height: 46px;
  }
}
</style>
