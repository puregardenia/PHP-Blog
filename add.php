<?php
  session_start();
  if(file_exists('common/config.php')){
    require('common/config.php');
  }else
    Header('Location:./install/');
?>
<!DOCTYPE html>
<html>
<head>
  <title><?php echo $BlogName.'-发表文章';?></title>
  <meta http-equiv="Content-Type" content="text/html;charset=utf8"/>
  <link rel="stylesheet" type="text/css" href="css/style.css">
  <link rel="stylesheet" type="text/css" href="css/toolbar.css">
  <script type="text/javascript">
    function InputCheck(obj){
      //注意value
      if(obj.articletitle.value==""){
        obj.articletitle.focus();
        return false;
      }
      if (obj.content.value=="") {
        obj.content.focus();
        return false;
      }
    }
  </script>
</head>
<body>
  <div class="bar"><?php require('bar/header.php');?></div>
  <div class="main">
    <h2 style="font-size:12pt;color:#09C">轻博客 | 发表一篇新文章</h2>
    <hr>
    <form method="POST" action="submit.php" onsubmit="return InputCheck(this)">
      <table>
        <p>
          <label for="title">标题：<br>
            <div class="textarea-wrapper">
              <div class="textarea-minishadow">
                  <input type="text" class="textarea-box" name="articletitle" id="title" style="width:845px;"/>
              </div>
            </div>
          </label>
        </p>
        <p>
          <label for="art">正文：<br>
            <div class="textarea-wrapper">
              <div class="textarea-minishadow" style="height:350px;">     <!--由于textbox标签的问题textarea-minishadow和textarea-box都要指定高度-->
                  <textarea type="text" class="textarea-box" name="content" id="art" style="width:845px;height:340px;resize:none"></textarea>
              </div>
            </div>
          </label>
        </p>
        <input class="button" type="submit" name="submit" value="  确定  ">
        <a class="tag" href="javascript:history.back()"><font size="3">取消</font></a>
      </table>
    </form>
    <div class="signature"><hr><?php echo $Signature;?></div>
  </div>
  <div class="bar"><?php require('bar/footer.php');?></div>
</body>
</html>