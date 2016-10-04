<?php
  session_start();
  require('../common/config.php');
  require("../common/conn.php");
  $id = $_GET['id'];
  $del = $_GET['del'];
  $delete = 'DELETE FROM letter WHERE id = '.$id.';';
  $dealLetter = 'UPDATE letter SET isread = 1 WHERE id = '.$id.';';
  if($del==1)
    $pdo->query($delete);
  if($pdo->query($dealLetter)){
  ?>
  <html>
  <head>
    <?php
    if($del==1)
      echo '<meta http-equiv="Refresh" content="0;url='.$Website.'letter/view.php?read=1">';
    else
      echo '<meta http-equiv="Refresh" content="0;url='.$Website.'letter/view.php">';
    ?>
  </head>
  <?php
  } else {
    echo '标记失败：[ <a href="javascript:history.back()">返 回</a> ]';
  }
  ?>
  </html>