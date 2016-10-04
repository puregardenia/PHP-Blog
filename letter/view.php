<?php
  session_start();
  require('../common/config.php');
  require('../common/conn.php');
  require('config.php');
  $read=$_GET['read']?$_GET['read']:0;
?>
<html>
<head>
  <meta http-equiv="content-type" content="text/html;charset=utf8">
  <link rel="stylesheet" href="../css/style.css">
  <link rel="stylesheet" href="../css/toolbar.css">
  <title>我的私信</title>
</head>
<body>
  <div class="bar"><?php require('../bar/header.php');?></div>
  <br><br><br>
  <div class="bar">
    <div class="tag"><a href="view.php?read=1">查看已读</a></div>
    <div class="tag"><a href="view.php?read=0">查看未读</a></div>
  </div>
  <div id="mainbox">
    <?php
      if(!$login)
        exit("<font color='red'>您尚未登录！</font>");
      @$p=$_GET['p']?$_GET['p']:1;
      $offset = ($p-1)*$Pagesize;   											//数据库排序后的起始id
      if(!$read)
        $sql = "SELECT * FROM letter where isread = '0' ORDER BY id DESC LIMIT  $offset , $Pagesize";
      else
        $sql = "SELECT * FROM letter where isread = '1' ORDER BY id DESC LIMIT  $offset , $Pagesize";
      $result = $pdo->query($sql);
      if(!$result)     exit('查询数据错误');
      while($data = $result->fetch())
      {
        $id = $data['id'];												//私信对应id
        $letter = nl2br($data['letter']);
        $email = nl2br($data['email']);
        $isread='<div align="right"><div class="tag"><a href="deal.php?id='.$id.'">标记为已读</a></div></div>';
        $delete='<div align="right"><div class="tag"><a href="deal.php?id='.$id.'&del=1">删除私信</a></div></div>';
        echo '<font color="#0075A9">'.$email.'</font>';
        if(!$read)
          echo '<table width="800px"><tr><td width="90%" align="left">'.$letter.'</td><td width="10%" align="right">'.$isread.'</td></tr></table>';
        else
          echo '<table width="800px"><tr><td width="90%" align="left">'.$letter.'</td><td width="10%" align="right">'.$delete.'</td></tr></table>';
        echo '<div class="line"></div>';
        echo '<div class="createtime">'.date("Y-m-d H:i", $data['createtime']).'</div>';
      }
      if(!$read)
        $count_array=$pdo->query("SELECT count(*) FROM letter WHERE isread = 0")->fetch();
      else
        $count_array=$pdo->query("SELECT count(*) FROM letter WHERE isread = 1")->fetch();
      $letterCount=$count_array[0];
      $pagenum=ceil($letterCount/$Pagesize);//计算文章数量

      echo '共 ',$letterCount,'条私信&nbsp;&nbsp;';
      if ($pagenum > 1)
      {
        for($i=1;$i<=$pagenum;$i++) {
          if($i==$p)
          {
            echo '&nbsp;[',$i,']';
          } else
          {
            echo '&nbsp;<a href="view.php?p=',$i,'&read='.$read.'">'.$i.'</a>';
          }
        }
      }
    ?>
  </div>
  <div class="bar"><?php require('../bar/footer.php');?></div>
</body>
</html>