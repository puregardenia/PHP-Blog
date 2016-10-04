<?php
  session_start();
  $id=$_GET['id'];
  require('../common/config.php');
  require('../common/conn.php');
  $sql="select ArticleTitle,content from qingblog where id=$id";
  $stmt=$pdo->query($sql);
  $stmt->setFetchMode(pdo::FETCH_ASSOC);
  $data=$stmt->fetch();
  $title=$data['ArticleTitle'];
  $content=$data['content'];
  $_SESSION['eid']=$id;
?>
<html>
<head>
  <meta http-equiv="content-type" content="text/html;charset=utf8"/>
  <link rel="stylesheet" href="../css/style.css">
  <link rel="stylesheet" href="../css/toolbar.css">
  <title><?php echo $title.'-编辑';?></title>
  <script>
    function InputCheck(obj){
      if(obj.articletitle.value==''){
        obj.articletitle.focus();
        return false;
      }
      if(obj.content.value==''){
        obj.content.focus();
        return false;
      }
    }
  </script>
</head>
<body>
  <div class="bar"><?php require('../bar/header.php');?></div>
  <br><br><br>
  <div id="mainbox">
    <form action="update.php" method="POST" onsubmit="return InputCheck(this)">
      <h2 style="font-size:12pt;color:#0099CC;"><?php echo $title;?> | 编辑</h2>
      <hr>
      <p>
        <label for="tit">标题：<br>
          <div class="textarea-wrapper">
            <div class="textarea-minishadow">
              <input class="textarea-box" type="text" name="articletitle" id="tit" value="<?php echo $title;?>" style="width:797px;">
            </div>
          </div>
        </label>
      </p>
      <p>
        <label for="con">正文：<br>
          <div class="textarea-wrapper">
            <div class="textarea-minishadow">
              <!--注意textarea和input的值的不同写法-->
              <textarea class="textarea-box" type="text" name="content" id="con" style="width:797px;height:600px;resize:none;"><?php echo $content;?></textarea>
            </div>
          </div>
        </label>
      </p>
      <p>
        <input type="submit" name="edit" class="button" value="  修改  ">
        <a href="javascript:history.back()" class="tag"><font size="3">  取消  </font></a>
      </P>
    </form>
  </div>
  <div class="bar">
    <div class="signature">
      <hr>
      <?php echo $Signature;?>
    </div>
  </div>
  <div class="bar"><?php require('../bar/footer.php') ?></div>
</body>
</html>
