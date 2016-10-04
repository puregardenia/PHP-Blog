<!DOCTYPE html>
<?php
  session_start();
  require("common/config.php");
?>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=utf8" />
  <link rel="stylesheet" type="text/css" href="css/style.css">
  <link rel="stylesheet" type="text/css" href="css/toolbar.css">
  <title><?php echo $BlogName.'-Search'?></title>
  <script type="text/javascript">
    function InputCheck(obj){
      if(obj.searchword.value==""){
        obj.searchword.focus();
        return false;
      }
    }
  </script>
</head>
<body>
  <div class="bar"><?php require("bar/header.php"); ?></div>
  <div class="image" style="margin-top:150px;"> <img src="common/pic/search.png"> </div> 
  <div style="margin:0 auto;padding-top:40px">
    <form name="search" method="POST" action="searchresult.php" onsubmit="return InputCheck(this)">
    <table style="width:700px;margin:auto;">
      <tr>
        <td width="70%" align="right">
          <div class="textarea-wrapper">
            <div class="textarea-minishadow">
              <input class="textarea-box" type="text" name="searchword" style="overflow:hidden;width:620px;border:0"/>
            </div>
          </div>
        </td>
        <td width="30%" align="left">
          <input type="submit" name="submit" value="站内搜索" class="button" />
        </td>
      </tr>
    </table>
    </form>
  </div>
</body>
</html>
