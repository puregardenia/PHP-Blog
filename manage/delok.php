<?php
  session_start();
  require('../common/config.php');
  $id=$_GET['id'];
  $title=$_GET['title'];
  ?>
<html>
<head>
  <meta http-equiv="content-type" content="text/html;charset=utf8">
  <link rel="stylesheet" href="../css/toolbar.css">
  <link rel="stylesheet" href="../css/style.css">
  <title>!!删除<?php echo $title;?></title>
</head>
<body>
  <div class="bar"><?php require('../bar/header.php');?></div>
  <br><br>
  <div id="mainbox">
    <hr>
    <?php
    echo '<p>删除<font color="red">'.$title.'</font>同时会删除所有评论，您是否要继续？</p>';
    echo '<form method="POST" name="delok" action="delete.php?id='.$id.'">';
    ?>
      <input class="button" name="delok" type="submit" value="确定删除">
    <a href="javascript:history.back()"> 取消删除 </a>
    </form>
    <hr>
    <div class="signature" style="margin-top:10px;"><?php echo $Signature;?></div>
  </div>
</body>
</html>
