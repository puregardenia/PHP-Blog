<!DOCTYPE html>
<?php 
  session_start();
    require('../common/config.php');

?>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=utf8">
  <link rel="stylesheet" type="text/css" href="../css/style.css">
  <link rel="stylesheet" type="text/css" href="../css/toolbar.css">
  <title><?php echo $BlogName.'-博文管理';?></title>
</head>
<body>
  <div class="bar" ><?php require('../bar/header.php');?></div>
  <div class="bar"><?php require('../bar/blogname.php');?></div>
  <div id ="mainbox">
    <?php
      require('../common/conn.php');
      $p=@$_GET['p']?$_GET['p']:1;
      $_SESSION['page']=$p;   //注册session变量，方便从其他页面跳转到当前页面
      $offset=($p-1)*intval($PageSize);

      $stmt=$pdo->prepare("select * from qingblog order by id desc limit ?,?");
      //数据绑定，注意offset和Pagesize都要转换为整形
      $stmt->bindParam(1,$offset,PDO::PARAM_INT);
      $stmt->bindParam(2,intval($PageSize),PDO::PARAM_INT);
      //设置返回的数据类型为关联数组
      $stmt->setFetchMode(PDO::FETCH_ASSOC);

      if(!$stmt->execute()) exit('数据库查询错误');

      while($data=$stmt->fetch()){
        $id=$data['id'];
        $title=$data['ArticleTitle'];

        echo '<div class="articletitle"><a class="articletitle" href="../articleread.php?id=' .$id.'&title='.$title.'">'.$title.'</a></div>';
        echo '<div class="line"></div>';
        $createTime='<div align="left" class="createtime">'.date("Y-m-d H:i",$data["createtime"]).'</div>';

        $divStart='<div style="font-size:14px;">';
        $divEnd='</div>';
        $allContent='<a href="../articleread.php?id='.$id.'&title='.$title.'">全文  </a>';
        $editLink='<a href="edit.php?id='.$id.'&title='.$title.'"> | 编辑  </a>';
        $delLink='<a href="delok.php?id='.$id.'&title='.$title.'"> | 删除</a>';
        if($login)
          $menu=$divStart.$allContent.$editLink.$delLink.$divEnd;
        else
          $menu=$divStart.$allContent.$divEnd;
        echo '<table width="100%" height="50px"><tr><td align="left">'.$createTime.'</td><td align="right">'.$menu.'</td></tr></table><br>';
      }
      $count_result=$pdo->query("select count(*) from qingblog");    //查询共有多少id
      $count_array=$count_result->fetch();
      $pageNum=ceil($count_array['count(*)']/$PageSize);      //计算页数
      echo ' 共 '.$count_array['count(*)'].' 篇博文  ';
      if($pageNum>1&&$pageNum<10){
        for($i=1;$i<=$pageNum;$i++){
          if($i==$p)
            echo '&nbsp;['.$i.']';
          else
            echo '&nbsp;<a href="'.$Website.'index.php?p='.$i.'">'.$i.'</a>';
        }
      }
    ?>
  </div>
  <table align="center" width="860" height="50" style="margin-top:40px">
    <tr>
      <?php
      if($p>1)
        echo '<td align="left"><a href="index.php?p='.($p-1).'"><input type="submit" class="button" value="上一页"></a></td>';
      if($p<$pageNum)
        echo '<td align="right"><a href="index.php?p='.($p+1).'"><input type="submit" class="button" value="下一页"></a></td>';
      ?>
    </tr>
  </table>
  <div class="bar"><hr><div class="signature"><?php echo $Signature?></div></div>
  <div class="bar"><?php require("../bar/footer.php");?></div>
</body>
</html>