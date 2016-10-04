<!DOCTYPE html>
<?php 
  session_start();
  require('../common/config.php');
?>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=utf8"/>
  <link rel="stylesheet" type="text/css" href="../css/style.css">
  <link rel="stylesheet" type="text/css" href="../css/toolbar.css">
  <title><?php echo $BlogName.'-Blog';?></title>
</head>
<body>
  <div class="bar"><?php require('../bar/header.php');?></div>
  <div class="bar"><?php require('../bar/blogname.php');?></div>
  <div id="mainbox">
    <p><?php echo "博客名称：".$BlogName ?></p>
    <p><?php echo "作者信息：".$AuthorName ?></p>
    <p><?php echo "关于：".$About ?></p>
    <p><?php echo "博客创建日期：".$BlogCreateTime ?></p>
    <p><?php echo "联系方式：".$Email ?></p>
    <p><?php echo "Signature：".$Signature ?></p>
  </div>
  <div class="bar">
    <div class="signature"><hr><?php echo $Signature;?></div>
  </div>
  <div class="bar"><?php require('../bar/footer.php')?></div>
</body>
</html>