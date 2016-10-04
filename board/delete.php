<?php
$id=$_GET['id'];
$sql="delete from board where id=$id";
require('../common/conn.php');
$result=$pdo->query($sql);
if(!$result) exit("删除留言失败！");
else{
  ?>
  <html>
  <head>
    <?php
    echo '<meta http-equiv="content-type" content="text/html;charset=utf8">';
    echo '<meta http-equiv="refresh" content="0;url=index.php"/>';
    echo '<title>删除成功</title>';
    ?>
  </head>
  </html>
  <body>
  <p align="center">删除成功！<br>请稍后，页面正在返回...</p>
  </body>
  <?php
}?>