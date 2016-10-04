<?php
  if(!isset($_POST['note'])) exit("非法访问");
  if(get_magic_quotes_gpc()){
    $name=htmlspecialchars(trim($_POST['name']));
    $content=htmlspecialchars(trim($_POST['content']));
  }else{
    $name=addslashes(htmlspecialchars(trim($_POST['name'])));
    $content=addslashes(htmlspecialchars(trim($_POST['content'])));
  }
  require('../common/conn.php');
  $result=$pdo->query("insert into board(nickname,content,createtime)VALUES('".$name."','".$content."',".time().")");
  if($result){
  ?>
  <html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;charset=utf8"/>
    <meta http-equiv="Refresh" content="0;url=index.php">
    <title>留言成功</title>
  </head>
  <body>
  <p align="center">留言成功！<br>请稍后，页面正在返回...</p>
  </body>
  </html>
  <?php
  }else{
    echo '留言失败：','[ <a href="javascript:history.back()"> 返 回 </a> ]';
  }
  ?>