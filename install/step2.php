<!DOCTYPE html>
<html>
<head>
  <title>安装轻博客</title>
  <meta http-equiv="ContentType" type="text/html" charset="utf8"/>
  <link rel="stylesheet" type="text/css" href="../css/style.css">
  <script type="text/javascript">
  function InputCheck(register){
    if(register.UserName.value==""){
      var objlab =document.getElementById('username_label');
      objlab.style.display="block";
      register.UserName.focus();
      return false;
    }
    if(register.PassWord.value.length < 3){
      var objlab = document.getElementById('password_label');
      objlab.style.display="block";
      register.PassWord.focus();
      return false;
    }
    if(register.PassWord.value!=register.PassWord_Confirm.value){
      var objlab = document.getElementById('passwordconfirm_label');
      objlab.style.display="block";
      register.PassWord.focus();
      return false;
    }
  }
  </script>
</head>
<body>
  <div style="margin:40px 260px;"><h1>QingBlog安装向导</h1></div>
  <div id="mainbox">
    <div style="margin:0 auto;width:700px;">
    <form method="POST" name="register" action="register.php" onsubmit="return InputCheck(this)">
      <table>
        <tr>
          <td>用户名:</td>
          <td><input type="text" name="UserName" size="50"/></td>
          <td>
            <div id="username_label" class="errorlabel">
              <label>用户名不能为空！</label>
            </div>
          </td>
        </tr>
        <tr>
          <td>密码:</td>
          <td><input type="password" name="PassWord" size="50"/></td>
          <td>
            <div id="password_label" class="errorlabel">
              <label>密码不能太短！</label>
            </div>
          </td>
        </tr>
        <tr>
          <td>确认密码:</td>
          <td><input type="password" name="PassWord_Confirm" size="50"/></td>
          <td>
            <div id="passwordconfirm_label" class="errorlabel">
              <label>两次输入的密码不一样！</label>
            </div>
          </td>
        </tr>
        <tr>
          <td>博客名称:</td>
          <td><input type="text" name="BlogName" size="50" value="轻博客" /></td>

        </tr>
        <tr>
          <td>博客地址:</td>
          <td><input type="text" name="Website" size="50" value="http://localhost/blog/"/></td>
        </tr>
        <tr>
          <td>关于作者:</td>
          <td><input type="text" name="AuthorName" size="50"/></td>
        </tr>
        <tr>
          <td>作者邮箱:</td>
          <td><input type="text" name="Email" size="50"/></td>
        </tr>
        <tr>
          <td>个性签名:</td>
          <td><input type="text" name="Signature" size="50" value="你若喜欢自己的价值，就必须为世界创造价值！" /></td>
        </tr>
        <tr>
          <td>个人简介:</td>
          <td><input type="text" name="About" size="50"/></td>
        </tr>
        <tr>
          <td>每页显示文章:</td>
          <td><input type="text" name="PageSize" size="50" value="6" /></td>
        </tr>
      </table>
      <div align="right">
        <input type="submit" class="button" value="  提交  "/>
      </div>
    </form>
    </div>
  </div>
  <?php require("../bar/footer.php");?>
</body>
</html>