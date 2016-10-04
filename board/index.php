<?php
  session_start();
  require('../common/config.php');
  require('config.php');
?>
<html>
<head>
  <meta http-equiv="content-type" content="text/html;charset=utf8">
  <link rel="stylesheet" href="../css/style.css">
  <link rel="stylesheet" href="../css/toolbar.css">
  <title>Note-小纸条</title>
  <script>
    function InputCheck(obj){
      if(obj.name.value==''){
        obj.name.focus();
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
  <div class="bar">
    <a href="<?php echo $Website; ?>board/" style="line-height:100px">
      <p class="shadow" style="margin-left:20px;">Paper</p>
    </a>
  </div>
  <?php
    require('../common/conn.php');
    @$p=$_GET['p']?$_GET['p']:1;
    $offset=($p-1)*$PageSize;
    $sql="select * from board order by id desc Limit ?,?";
    $stmt=$pdo->prepare($sql);
    $stmt->bindParam(1,$offset,PDO::PARAM_INT);
    $stmt->bindParam(2,intval($PageSize),PDO::PARAM_INT);
    $stmt->setFetchMode(PDO::FETCH_ASSOC);
    if(!$stmt->execute()){exit('数据库查询失败');}
    while($data=$stmt->fetch()){
      $id=$data['id'];
      $content=nl2br($data['content']);
      $nickName=$data['nickname'];
      $createTime=date("Y-m-d H:i",$data['createtime']);
      echo '<div id="mainbox">';
      echo '<div class="nickname"><h2>'.$nickName.'</h2></div>';
      echo '<div class="note">'.$content.'</div><br>';
      echo '<div class="line"></div>';
      echo '<div class="createtime" style="text-align:right;">'.$createTime.'</div>';
      if($login)
        echo '<div><a class="tag" href="delete.php?id='.$id.'">丢掉这个小纸条</a></div>';
      echo '</div>';
    }
    echo '<div class="bar"><hr></div>';
    echo '<div class="bar">';
    $count_result=$pdo->query("select count(*) from board");    //查询共有多少id
    $count_array=$count_result->fetch();
    $pageNum=ceil($count_array['count(*)']/$PageSize);      //计算页数
    echo ' 共 '.$count_array['count(*)'].' 条留言  ';
    if($pageNum>1&&$pageNum<10){
      for($i=1;$i<=$pageNum;$i++){
        if($i==$p)
          echo '&nbsp;['.$i.']';
        else
          echo '&nbsp;<a href="'.$Website.'board/index.php?p='.$i.'">'.$i.'</a>';
      }
    }
    echo '</div>'
  ?>
  <br><br>
  <div class="bar">
    <form method="POST" action="submit.php?id=<?php echo $id;?>" onsubmit="return InputCheck(this)">
      <p>
        <label for="nam">你的大名:<font color="red">(*可填写邮箱地址)</font><br>
          <div class="textarea-wrapper">
            <div class="textarea-minishadow">
              <input type="text" class="textarea-box" name="name" id="nam" style="width:857px;"/>
            </div>
          </div>
        </label>
      </p>
      <p>
        <label for="con">Content:<font color="red">(*请留下你此刻的心情或想说的话,But whatever)</font><br>
          <div class="textarea-wrapper">
            <div class="textarea-minishadow">
              <textarea type="text" class="textarea-box" name="content" id="con" style="width:857px;height:100px;resize:none;"></textarea>
            </div>
          </div>
        </label>
      </p>
      <p align="right">
        <input type="submit" class="button" name="note" value=" 发小纸条 "/>
      </p>
    </form>
  </div>
  <div class="bar"><?php require('../bar/footer.php');?></div>
</body>
</html>