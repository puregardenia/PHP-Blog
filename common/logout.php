<?php
  session_start();
  unset($_SESSION['user']);
  $goUrl=$_SERVER['HTTP_REFERER'];
  echo '<script>window.location.href="'.$goUrl.'"</script>';
?>