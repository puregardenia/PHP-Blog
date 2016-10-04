<?php
  require('../common/config.php');
  require('../common/conn.php');
?>
<html>
<head>
  <meta http-equiv="content-type" content="text/html;charset=utf8">
  <link rel="stylesheet" href="../css/style.css">
  <link rel="stylesheet" href="../css/toolbar.css">
  <title>私信</title>
  <script>
    function DisplayDiv(){
      var objDiv=document.getElementById('email');
      objDiv.style.display='block';
    }
    function HidDiv(){
      var objDiv=document.getElementById('email');
      objDiv.style.display='none';
    }
    function InputCheck(obj){
      //去除两边的空格
      var compare=obj.content.value.replace(/(^\s+)|(\s+$)/g,'');
      if(compare=='@轻博客:' | compare==''){
        obj.content.value='@轻博客:';
        obj.content.focus();
        return false;
      }
      /*错误，不能嵌套获取标签或者结点
        function SetValue(){
          var objDiv=document.getElementsByName('content');
          document.write(objDiv);
          //objDiv.focus();
          //objDiv.value="....";
        }
      */
    }
  </script>
</head>
<body>
  <div class="bar"><?php require('../bar/header.php');?></div>
  <br><br><br>
  <div id="mainbox">
    <form action="submit.php" method="post" onsubmit="return InputCheck(this)">
    <div class="textarea-wrapper">
      <div class="textarea-minishadow">
        <textarea type="text" class="textarea-box" name="content" style="width:797px;height:300px;resize:none;">@轻博客:</textarea>
      </div>
    </div>
    <div style="margin-top:10px;">
      <table width="800">
        <tr>
          <td width="50%" align="left">
            <b>
              <font color="red">#</font>
            </b>
            <div class="tag" onmouseover="DisplayDiv()">点击留下我的邮箱</div>
          </td>
          <td width="50%" align="right"><input type="submit" class="button" name="letter" value="  发私信  "></td>
        </tr>
      </table>
    </div>
      <div class="textarea-wrapper" id="email" onmouseover="DisplayDiv()" onmouseout="HidDiv()" style="width:250px;display:none;-webkit-border-radius:5px;-moz-border-radius:5px;border-radius:20px;">
        <div class="textarea-minishadow" style="-webkit-border-radius:5px;-moz-border-radius:5px;border-radius:20px;">
          <input type="text" class="textarea-box" name="email" style="width:249px;-webkit-border-radius:5px;-moz-border-radius:5px;border-radius:20px;"/>
        </div>
      </div>
    </form>
  </div>
  <div class="bar"><?php require('../bar/footer.php');?></div>
</body>
</html>