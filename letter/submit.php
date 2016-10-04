<?php
  session_start();
  require('../common/config.php');
  require('../common/conn.php');
  if(!isset($_POST['letter'])){
    exit('非法访问!');
  }
  if(get_magic_quotes_gpc()){
    $email = htmlspecialchars(trim($_POST['email']));
    $content = htmlspecialchars(trim($_POST['content']));
  } else {
    $email = addslashes(htmlspecialchars(trim($_POST['email'])));
    $content = addslashes(htmlspecialchars(trim($_POST['content'])));
  }
  if(strlen($email)>60){
    exit('错误：邮箱不得超过15个字符串 [ <a href="javascript:history.back()">返 回</a> ]');
  }
  $createtime = time();
  $sql = "INSERT INTO letter(id,email,letter,createtime,isread)VALUES";
  //id可以设置为空
  $sql .= "('','$email','$content',$createtime,0)";
  if($pdo->query($sql)) {
    ?>
    <html>
    <head>
      <meta http-equiv="content-type" content="text/html;charset=utf8">
      <?php echo '<meta http-equiv="Refresh" content="1;url='.$Website.'index.php?p='.$_SESSION['page'].'">'; ?>
      <link rel="stylesheet" href="../css/style.css">
      <link rel="stylesheet" href="../css/toolbar.css">
      <title>私信</title>
    </head>
    <body>
    <p align="center">私信发送成功！<br>请稍后，页面正在返回...</p>
    </body>
    </html>
    <?php
  }else{
    echo '留言失败： [ <a href="javascript:history.back()">返 回</a> ]';
  }
    ?>