<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2015/7/27
 * Time: 10:09
 */
  session_start();
  require('common/config.php');
  $id=$_GET['id'];
  //跳转到submitcomment.php时需要用到
  $_SESSION['id']=$id;
  @$title=$_GET['title'];
?>
<html>
<head>
  <meta http-equiv="content-type" content="text/html;charset=utf8">
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="css/toolbar.css">
  <title><?php echo $title.'-'.$BlogName.'-blog';?></title>
  <script type="text/javascript">
    function InputCheck(obj){
      if(obj.nickname.value==''){
        obj.nickname.focus();
        return false
      }
      if(obj.email.value==''){
        obj.email.focus();
        return false
      }
      if(obj.content.value==''){
        obj.content.focus();
        return false
      }
    }
  </script>
</head>
<body>
  <div class="bar"><?php require('bar/header.php');?></div>
  <div class="bar"><?php require('bar/blogname.php');?></div>
  <div id="mainbox">
    <?php
      require('common/conn.php');

      $stmt=$pdo->prepare("select * from qingblog where id = ?");
      //数据绑定，注意offset和Pagesize都要转换为整形
      $stmt->bindParam(1,$id,PDO::PARAM_INT);
      //设置返回的数据类型为关联数组
      $stmt->setFetchMode(PDO::FETCH_ASSOC);

      if(!$stmt->execute())
        exit('数据库查询错误');

      $data=$stmt->fetch();
      $title=$data['ArticleTitle'];
      $content=nl2br($data['content']);
      $readTimes=$data['ReadTimes'];
      //阅读次数加1
      $pdo->query("update qingblog set ReadTimes =ReadTimes+1 where id=".$id);
      //$pdo->query("update qingblog set ReadTimes ='".($readTimes+1)."' where id='".$id."'");    //可用
      echo '<div class="articletitle">'.$title.'</div>';
      echo '<div class="line"></div>';
      echo '<div align="right" class="createtime">'.date("Y-m-d H:i",$data["createtime"]).'</div>';
      echo '<div class="content">'.$content.'</div>';
      $divStart='<div style="font-size:14px;">';
      $divEnd='</div>';
      $editLink='<a href="manage/edit.php?id='.$id.'&title='.$title.'">编辑  </a>';
      $delLink='<a href="manage/delok.php?id='.$id.'&title='.$title.'"> | 删除</a>';
      if($login)
        $menu=$divStart.$editLink.$delLink.$divEnd;
      else
        $menu=$divStart.$divEnd;
      echo '<table width="100%" height="50px"><tr><td align="left"></td><td align="right">'.$menu.'</td></tr></table>';
    ?>
  </div>
  <div class="main">
    <br><br>
    <div style="font-size:18pt">Comments</div>
    <?php
      $stmt=$pdo->prepare("select * from comments where id=? order by createtime DESC ");
      $stmt->bindParam(1,strval($id),PDO::PARAM_STR);
      $stmt->setFetchMode(PDO::FETCH_ASSOC);

      if(!$stmt->execute())
        exit('数据库查询失败');
      while($data=$stmt->fetch()){
        $createTime=date("Y-m-d H:i",$data['createtime']);
        $email=$data['email'];
        $nickName=$data['NickName'];
        $comment=$data['comments'];
        echo '<div class="line"></div>';
        echo '<div class="createtime">'.$createTime.'</div>';
        echo $nickName.':<br>';
        echo $comment.'<br>';
        echo '<div style="text-align:right;color:gray;">'.$email.'</div>';
      }
    ?>
    <br><br>
    <form action="submitcomment.php" method="POST" name="comment" onsubmit="return InputCheck(this)">
        <label for="nick">昵称<br>
          <div class="textarea-wrapper">
            <div class="textarea-minishadow">
              <input type="text" class="textarea-box" name="nickname" id="nick" style="width:857px;">
            </div>
          </div>
        </label>
        <label for="ema">E-Mail<br>
          <div class="textarea-wrapper">
            <div class="textarea-minishadow">
              <input type="text" class="textarea-box" name="email" id="ema" style="width:857px;">
            </div>
          </div>
        </label>
        <label for="con">评论内容：<br>
          <div class="textarea-wrapper">
            <div class="textarea-minishadow">
              <textarea class="textarea-box" name="content" id="con" style="width:857px;height:100px;resize:none;"></textarea>
            </div>
          </div>
        </label>
        <div style="text-align:right;margin-top:10px;">
          <!--name="submit"，可用来判断是否是提交过去的isset($_POST['submit'])-->
          <input type="submit" class="button" name="submit" value=" 发表评论 "/>
        </div>
    </form>
  </div>
  <div class="bar"><?php require('bar/footer.php');?></div>
</body>
</html>