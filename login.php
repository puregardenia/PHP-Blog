<!DOCTYPE html>
<?php
  session_start();
  require("common/config.php");
  //判断页面是否是首次加载的
  if(!isset($_POST['submit'])){
    if(!isset($_SERVER["HTTP_REFERER"]))      /*直接访问login.php页面的*/
      $_SESSION['goUrl']=$Website.'index.php';
    else                                            /*从其他页面跳转过来的*/
      $_SESSION['goUrl']=$_SERVER['HTTP_REFERER'];
  }else{
    //本页面提交给自己的
    if(isset($_POST['user_login']) && isset($_POST['user_pass']))
    {
      $user=$_POST['user_login'];
      $passwd=md5($_POST['user_pass']);
      if($user!=$UserName||$passwd!=$PassWord)
      {
        echo '<br><br><br><div align="center"><strong><font color="red">用户名或密码错误！</font></strong></div>';
      }else
      {
        $_SESSION['user']=$user;
        echo '<script>window.location.href="'.$_SESSION['goUrl'].'"</script>';
      }
    }
  }
?>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=utf8"/>
  <link rel="stylesheet" type="text/css" href="css/style.css">
  <link rel="stylesheet" type="text/css" href="css/toolbar.css">
  <link rel="stylesheet" type="text/css" href="css/login.css">
  <title><?php echo $BlogName.'-登陆'?></title>
  <script type="text/javascript">
    function InputCheck(obj)
    {
      if(obj.user_login.value=="")
      {
        obj.user_login.focus();
        return false;
      }
      if (obj.user_pass.value=="") {
        obj.user_pass.focus();
        return false;
      }
      //默认返回真，所以不用默认指定返回真
    }
  </script>
</head>
<body>
  <div id="bar"><?php require("bar/header.php");?></div>
  <div class="login">
  <form method="POST" action="login.php" id="login" onsubmit="return InputCheck(this)">
    <p>
      <label for="log">用户名<br>
        <input name="user_login" type="text" id="log" class="input" size="20" autofocus="autofocus">
      </label>
    </p>
    <p>
      <label for="pass">密码<br>
        <input name="user_pass" type="password" id="pass" class="input" size="20">
      </label>
    </p>
    <p class="forgetmenot">
      <label for="rememberme"> <input name="rememberme" type="checkbox" id="rememberme" > 记住我的登录信息</label>
    </p>
    <p>
      <input name="submit" type="submit" class="button-primary" value=" 登录 ">
    </p>
  </form>
  </div>
  <div><?php require("bar/footer.php")?></div>
</body>
</html>