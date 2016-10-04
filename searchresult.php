<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2015/7/26
 * Time: 10:43
 */
  session_start();
  if(file_exists('common/config.php')){
    require('common/config.php');
  }else
    Header('Location:./install/');
  //liebao不支持
  if(isset($_POST['submit'])) {
    if (isset($_POST['searchword'])) {
      $searchWord = "%" . htmlspecialchars(trim($_POST["searchword"])) . "%";
      $_SESSION['searchword'] = $searchWord;
    } else
      exit('非法访问！');
  }

?>
<!DOCTYPE html>
<html style="background:none">
<head>
  <title><?php echo $BlogName.'-发表文章';?></title>
  <meta http-equiv="Content-Type" content="text/html;charset=utf8"/>
  <link rel="stylesheet" type="text/css" href="css/style.css">
  <link rel="stylesheet" type="text/css" href="css/toolbar.css">

</head>
<body>
<div class="bar"><?php require('bar/header.php');?></div>
<div class="main">
  <h2 style="font-size:12pt;color:#09C">搜索结果</h2>
  <hr>
  <?php
    require('common/conn.php');
    @$p=$_GET['p']?$_GET['p']:1;
    $_SESSION['page']=$p;   //注册session变量，方便从其他页面跳转到当前页面
    $offset=($p-1)*intval($PageSize);

    $stmt=$pdo->prepare("select * from qingblog where ArticleTitle LIKE '".$_SESSION['searchword']."' or content like '".$_SESSION['searchword']."' order by id desc limit ?,?");
    //数据绑定，注意offset和Pagesize都要转换为整形
    $stmt->bindParam(1,$offset,PDO::PARAM_INT);
    $stmt->bindParam(2,intval($PageSize),PDO::PARAM_INT);
    //设置返回的数据类型为关联数组
    $stmt->setFetchMode(PDO::FETCH_ASSOC);

    if(!$stmt->execute())
      exit('数据库查询错误');

    while($data=$stmt->fetch()){
      $id=$data['id'];
      $title=$data['ArticleTitle'];
      //mb_substr()是用来截取中文字符的，需要在配置文件中打开mbstring.dll扩展才能用
      $content=nl2br(mb_substr($data['content'],0,200,"utf8"));

      //返回一个stmt对象
      $stmt_content=$pdo->query("select count(*) from comments where id=$id");
      if(!$stmt_content) exit('查询数据失败');
      $commentCount=$stmt_content->fetch();
      //$commentCount=$pdo->query("select count(*) from comments where id=$id")->fetch();

      $readTimes=$data['ReadTimes'];
      $timesShow='<a class="tag">阅读 ('.$readTimes.') ┆ 评论 ('.$commentCount[0].') </a>';
      //a设置为article可以覆盖a连接默认的样式
      echo '<div class="articletitle" style="font-size:13pt;"><a href="articleread.php?id=' .$id.'&title='.$title.'">'.$title.'</a></div>';
      echo '<div class="line"></div>';
      echo '<div align="right" class="createtime">'.date("Y-m-d H:i",$data["createtime"]).'</div>';
      echo '<div class="content">'.$content.'</div>';
      $divStart='<div style="font-size:14px;">';
      $divEnd='</div>';
      $allContent='<a href="articleread.php?id='.$id.'&title='.$title.'">全文  </a>';
      $editLink='<a href="manage/edit.php?id='.$id.'&title='.$title.'"> | 编辑  </a>';
      $delLink='<a href="manage/delok.php?id='.$id.'&title='.$title.'"> | 删除</a>';
      if($login)
        $menu=$divStart.$allContent.$editLink.$delLink.$divEnd;
      else
        $menu=$divStart.$allContent.$divEnd;
      echo '<table width="100%" height="50px"><tr><td align="left">'.$timesShow.'</td><td align="right">'.$menu.'</td></tr></table><br>';
    }
    $count_result=$pdo->query("select count(*) from qingblog where ArticleTitle LIKE '".$_SESSION['searchword']."' or content like '".$_SESSION['searchword']."'");    //查询共有多少id
    $count_array=$count_result->fetch();
    $pageNum=ceil($count_array['count(*)']/$PageSize);      //计算页数
    echo ' 共 '.$count_array['count(*)'].' 篇博文  ';
    if($pageNum>1&&$pageNum<10){
      for($i=1;$i<=$pageNum;$i++){
        if($i==$p)
          echo '&nbsp;['.$i.']';
        else
          echo '&nbsp;<a href="'.$Website.'searchresult.php?p='.$i.'">'.$i.'</a>';
      }
    }
  ?>
  <table align="center" width="860" height="50" style="margin-top:40px">
    <tr>
      <?php
      if($p>1)
        echo '<td align="left"><a href="searchresult.php?p='.($p-1).'"><input type="submit" class="button" value="上一页"></a></td>';
      if($p<$pageNum)
        echo '<td align="right"><a href="searchresult.php?p='.($p+1).'"><input type="submit" class="button" value="下一页"></a></td>';
      ?>
    </tr>
  </table>
  <div class="signature"><hr><?php echo $Signature;?></div>
</div>
<div class="bar"><?php require('bar/footer.php');?></div>
</body>
</html>