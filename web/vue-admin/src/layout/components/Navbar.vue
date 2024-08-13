<template>
  <div class="navbar">
    <hamburger
      :is-active="sidebar.opened"
      class="hamburger-container"
      @toggleClick="toggleSideBar"
    />

    <breadcrumb class="breadcrumb-container" />

    <div class="right-menu">
      <el-dropdown class="avatar-container" trigger="click">
        <div class="avatar-wrapper">
          <!-- 头像 -->
          <img v-if="avatar" :src="avatar" class="user-avatar" />
          <!-- name?.charAt(0) 问号是可选链操作符 最低支持版本2.7.0 -->
          <span v-else class="username">{{ "a" }}</span>
          <!-- 用户名称 -->
          <span class="name">{{ "admin" }}</span>
          <!-- 图标 -->
          <i class="el-icon-setting" />
        </div>
        <el-dropdown-menu slot="dropdown" class="user-dropdown">
          <router-link to="/">
            <el-dropdown-item> 首页 </el-dropdown-item>
          </router-link>
          <a target="_blank" @click.prevent="updatePassword">
            <el-dropdown-item>修改密码</el-dropdown-item>
          </a>
          <el-dropdown-item @click.native="logout">
            <span style="display: block">登出</span>
          </el-dropdown-item>
        </el-dropdown-menu>
      </el-dropdown>
    </div>
    <el-dialog width="500px" title="修改密码" :visible.sync="showDialog">
      <el-form label-width="120px">
        <el-form-item label="旧密码">
          <el-input show-password size="small" />
        </el-form-item>
        <el-form-item label="新密码">
          <el-input show-password size="small" />
        </el-form-item>
        <el-form-item label="重复密码">
          <el-input show-password size="small" />
        </el-form-item>
        <el-form-item>
          <el-button size="mini" type="primary" @click="btnUpdate">确认修改</el-button>
          <el-button size="mini" @click="btnCancel">取消</el-button>
        </el-form-item>
      </el-form>
    </el-dialog>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
import Breadcrumb from "@/components/Breadcrumb";
import Hamburger from "@/components/Hamburger";

export default {
  data() {
    return {
      updatePasswordVisible: false,
      showDialog: false,
    };
  },
  components: {
    Breadcrumb,
    Hamburger,
  },
  computed: {
    ...mapGetters(["sidebar", "avatar"]),
  },
  methods: {
    updatePassword() {
      this.showDialog = true
    },
    btnCancel() {
      this.showDialog = false
    },
    btnUpdate() {
      this.showDialog = false
    },
    toggleSideBar() {
      this.$store.dispatch("app/toggleSideBar");
    },
    logout() {
      this.$router.push("/login");
    }
  },
};
</script>

<style lang="scss" scoped>
.username {
  width: 30px;
  height: 30px;
  text-align: center;
  line-height: 30px;
  border-radius: 50%;
  background: #04c9be;
  color: #fff;
  margin-right: 4px;
}
.avatar-wrapper {
  margin-top: 5px;
  position: relative;
  display: flex;
  align-items: center;
  .name {
    //  用户名称距离右侧距离
    margin-right: 10px;
    font-size: 16px;
  }
  .el-icon-setting {
    font-size: 20px;
  }
  .user-avatar {
    cursor: pointer;
    width: 30px;
    height: 30px;
    border-radius: 50%;
  }
}

.navbar {
  height: 50px;
  overflow: hidden;
  position: relative;
  background: #fff;
  box-shadow: 0 1px 4px rgba(0, 21, 41, 0.08);

  .hamburger-container {
    line-height: 46px;
    height: 100%;
    float: left;
    cursor: pointer;
    transition: background 0.3s;
    -webkit-tap-highlight-color: transparent;

    &:hover {
      background: rgba(0, 0, 0, 0.025);
    }
  }

  .breadcrumb-container {
    float: left;
  }

  .right-menu {
    float: right;
    height: 100%;
    line-height: 50px;

    &:focus {
      outline: none;
    }

    .right-menu-item {
      display: inline-block;
      padding: 0 8px;
      height: 100%;
      font-size: 18px;
      color: #5a5e66;
      vertical-align: text-bottom;

      &.hover-effect {
        cursor: pointer;
        transition: background 0.3s;

        &:hover {
          background: rgba(0, 0, 0, 0.025);
        }
      }
    }

    .avatar-container {
      margin-right: 30px;

      .avatar-wrapper {
        margin-top: 5px;
        position: relative;

        .user-avatar {
          cursor: pointer;
          width: 40px;
          height: 40px;
          border-radius: 10px;
        }

        .el-icon-caret-bottom {
          cursor: pointer;
          position: absolute;
          right: -20px;
          top: 25px;
          font-size: 12px;
        }
      }
    }
  }
}
</style>
