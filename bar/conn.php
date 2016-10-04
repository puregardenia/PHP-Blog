<?php
  try{
    $pdo=new PDO("mysql:host=localhost;dbname=qingblog","root","admin");   //连接数据库

    /*$stmt=$pdo->prepare("insert into shops(name, price, num, desn) values(?, ?, ?, ?)"); //所有SQL都可执行
    //绑定索引数组参数
    $stmt->bindParam(1, $name, PDO::PARAM_STR);
    $stmt->bindParam(3, $num, PDO::PARAM_INT);
    */

    //$pdo->query("set character set 'utf8'");

    //字符转换(按utf8格式从数据库中读取字符)
    $pdo->query("set names 'utf8'");
  }catch(PDOException $e){
    echo "数据库连接失败".$e->getMessage();
    exit;
  }
?>