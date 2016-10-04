<?php
  $id=$_GET['id'];
  $delCommentSql="delete from comments where id=$id";
  $delBlogSql="delete from qingblog where id=$id";
  require('../common/config.php');
  require('../common/conn.php');
  //删除评论
  $delComment=$pdo->query($delCommentSql);
  //删除博客
  $delBlog=$pdo->query($delBlogSql);
  if(!$delComment) exit("删除评论失败！");
  if(!$delBlog) exit("删除博客失败！");
  else{
    ?>
    <html>
    <head>
      <?php
        echo '<meta http-equiv="content-type" content="text/html;charset=utf8">';
        echo '<meta http-equiv="refresh" content="1;url='.$Website.'"/>';
        echo '<title>删除成功</title>';
      ?>
    </head>
    </html>
    <body>
      <p align="center">删除成功！<br>请稍后，页面正在返回...</p>
    </body>
  <?php
  }?>