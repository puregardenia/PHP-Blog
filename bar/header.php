<?php
  if(isset($_SESSION['user']))
    $login=true;
  else
    $login=false;
  require('conn.php');
  $LetterCount=$pdo->query("SELECT count(*) FROM letter WHERE isread = 0")->fetch();
?>
<header class="topbar">
<div class="wrapper-box">
  <div class="left-box">
    <ul class="menubox">
      <li class="menuitem"><a href="<?php echo $Website;?>" title="返回站点首页"><font size="3" color="skyblue">首页</font></a></li>
      <li class="menuitem"><a href="<?php echo $Website;?>search.php" title="搜索本博客">搜索</a></li>
      <?php
        if($login)
        echo '<li class="menuitem"><a href="'.$Website.'add.php">发表博文</a></li>';
        echo '<li class="menuitem"><a href="'.$Website.'manage/">文章管理</a></li>';
      ?>
    </ul>
  </div>
  <div class="right-box">
    <ul class="navbox">
      <?php
        if($login)
          echo '<li class="navitem"><a href="'.$Website.'common/logout.php"><font color="red">退出</font></a></li>';
        else
          echo '<li class="navitem"><a href="'.$Website.'login.php"><font color="red">登录</font></a></li>';
      ?>
      <li class="navitem"><a href="<?php echo $Website;?>board/" title="传送你的心声，和大家一起分享"><b>#</b>小纸条</a></li>
      <?php
        if ($login)
          echo '<li class="navitem"><a href="'.$Website.'letter/view.php" title="留下你的悄悄话">私信<font color="red">('.$LetterCount[0].')</font></a></li>';
        else
          echo '<li class="navitem"><a href="'.$Website.'letter/" title="留下你的悄悄话">私信</a></li>';
      ?>
      <li class="navitem"><a href="<?php echo $Website;?>common/about.php" title="关于本博客"><font color="teal">关于</font></a></li>
    </ul>
  </div>
</div>
</header>