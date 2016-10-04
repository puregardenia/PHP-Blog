<?php
  session_start();
  if(!isset($_POST['submit']))
    exit('非法访问！');
  $id=intval($_SESSION['id']);
  if(get_magic_quotes_gpc()){
    $nickName=htmlspecialchars(trim($_POST['nickname']));
    $email=htmlspecialchars(trim($_POST['email']));
    $content=htmlspecialchars(trim($_POST['content']));
  }else{
    $nickName=addslashes(htmlspecialchars(trim($_POST['nickname'])));
    $email=addslashes(htmlspecialchars(trim($_POST['email'])));
    $content=addslashes(htmlspecialchars(trim($_POST['content'])));
  }
  if(strlen($nickName)>64)
    exit('错误：昵称不能大于16个字符 [<a href="javascript:history.back()"> 返回 </a>]');
  if(strlen($email)>60)
    exit('错误：邮箱不能大于15个字符 [<a href="javascript:history.back()"> 返回 </a>]');
  require('common/conn.php');
  $time=time();
  $sql="insert into comments(id,NickName,email,comments,createtime) VALUES(?,?,?,?,?)";
  $stmt=$pdo->prepare($sql);
  $stmt->bindParam(1,$id,PDO::PARAM_INT);
  $stmt->bindParam(2,$nickName,PDO::PARAM_STR);
  $stmt->bindParam(3,$email,PDO::PARAM_STR);
  $stmt->bindParam(4,$content,PDO::PARAM_STR);
  $stmt->bindParam(5,intval($time),PDO::PARAM_INT);

  if($stmt->execute()){
    ?>
    <html>
    <head>
      <meta http-equiv="content-type" content="text/html;charset=utf8"/>
      <?php
        echo '<meta http-equiv="Refresh" content="1;url=articleread.php?id='.$id.'">';
      ?>
      <title>留言成功</title>
    </head>
    <body>
      <p align="center">留言成功！<br>请稍后，页面正在返回...</p>
    </body>
    </html>
    <?php
  }else{
    print_r($stmt);
    echo '留言失败：[<a href="javascript:history.back()"> 返回 </a>]';
  }