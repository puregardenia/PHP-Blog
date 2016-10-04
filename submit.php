<?php
  session_start();
  if(!isset($_POST['submit']))
    exit('非法访问！');
  //表单信息处理
  /*
   * get_magic_quotes_gpc()
   * 在php中的作用是判断解析用户提示的数据，如包括有:post、get、cookie过来的数据增加转义字符“\”
   * 以确保这些数据不会引起程序，特别是数据库语句因为特殊字符引起的污染而出现致命的错误。
   * 在magic_quotes_gpc=On（1）的情况下，如果输入的数据有单引号（’）、双引号（”）、反斜线（）与 NUL（NULL 字符）等字符都会被加上反斜线。
   * 如果这个选项为off（1），那么我们就必须调用addslashes这个函数来为字符串增加转义。
   */
  if(get_magic_quotes_gpc()){
    $articleTitle=htmlspecialchars(trim($_POST['articletitle']));
    $content=htmlspecialchars($_POST['content']);
  }else{
    $articleTitle=addslashes(htmlspecialchars(trim($_POST['articletitle'])));
    $content=addslashes(htmlspecialchars(trim($_POST['content'])));
  }
  if(strlen($articleTitle)>64)
    exit('错误：标题不能超过16个字符 [<a href="javascript:history.back()"> 返回 </a>]');
  require('common/conn.php');

  $createTime=time();
  $readTimes=0;

  $sql="insert into QingBlog(ArticleTitle,Content,CreateTime,readTimes) values(?,?,?,?)";
  $stmt=$pdo->prepare($sql);

  //绑定索引数组
  $stmt->bindParam(1,$articleTitle,pdo::PARAM_STR);
  $stmt->bindParam(2,$content,pdo::PARAM_STR);
  $stmt->bindParam(3,$createTime,pdo::PARAM_STR);
  $stmt->bindParam(4,$readTimes,pdo::PARAM_INT);

  if($stmt->execute()) {
    ?>
    <html>
    <head>
      <meta http-equiv="Content-Type" content="text/html;charset=utf8"/>
      <!--经过1秒钟自动重定向(不加";url=index.php"为刷新)-->
      <meta http-equiv="Refresh" content="1;url=index.php">
      <title>发表成功</title>
    </head>
    <body>
        <p align="center">发表成功！<br>请稍后，页面正在返回...</p>
    </body>
    </html>
    <?php
  }else{
    echo '留言失败：','[ <a href="javascript:history.back()"> 返 回 </a> ]';
  }
?>