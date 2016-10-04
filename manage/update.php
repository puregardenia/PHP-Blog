<?php
  session_start();
  if(!isset($_POST['edit']))
    exit('非法访问！');
  $id=$_SESSION['eid'];
  if(get_magic_quotes_gpc()){
    $articleTitle=trim(htmlspecialchars($_POST['articletitle']));
    $content=trim(htmlspecialchars($_POST['content']));
  }else{
    $articleTitle=addslashes(trim(htmlspecialchars($_POST['articletitle'])));
    $content=addslashes(trim(htmlspecialchars($_POST['content'])));
  }
  if(strlen($articleTitle)>64){
    exit('错误：标题不得超过16个字符串 [ <a href="javascript:history.back()">返 回</a> ]');
  }
  require('../common/config.php');
  require('../common/conn.php');
  $sql="update qingblog set ArticleTitle='$articleTitle',content='$content' where id=$id";
  if($pdo->query($sql)){
    ?>
    <html>
    <head>
      <meta http-equiv="refresh" content="1;url=<?php echo $Website;?>"/>
      <meta http-equiv="content-type" content="text/html;charset=utf8"/>
      <title>更新成功</title>
    </head>
    <body>
      <p align="center">更新数据成功！<br>请稍后，页面正在返回...</p>
    </body>
    </html>
    <?php
  }else{
    exit('数据更新失败！ [<a href="javascript:history.back()"> 返回 </a>] ');
  }
?>

