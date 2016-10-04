<?php
  $password=md5($_POST['PassWord']);      //密码加密
  $website='$Website="'.$_POST['Website'].'";'."\r\n";  // \r\n转义必须加双引号
  $username='$UserName="'.$_POST['UserName'].'";'."\r\n";
  $password='$PassWord="'.$password.'";'."\r\n";
  $blogname='$BlogName="'.$_POST['BlogName'].'";'."\r\n";
  $authorname='$AuthorName="'.$_POST['AuthorName'].'";'."\r\n";
  $email='$Email="'.$_POST['Email'].'";'."\r\n";
  $signature='$Signature="'.$_POST['Signature'].'";'."\r\n";
  $about='$About="'.$_POST['About'].'";'."\r\n";
  $blogcreatetime='$BlogCreateTime="'.date('Y-m-d H:i:s').'";'."\r\n";
  $pagesize='$PageSize="'.$_POST['PageSize'].'";'."\r\n";

  $file_path="../common/config.php";
  $fp=fopen($file_path,'w');
  if ($fp) {
    touch($file_path);
    $fp=fopen($file_path,'w');
  }
  fwrite($fp,"<?php\r\n");
  fwrite($fp, $website);
  fwrite($fp, $username);
  fwrite($fp, $password);
  fwrite($fp, $blogname);
  fwrite($fp, $authorname);
  fwrite($fp, $email);
  fwrite($fp, $signature);
  fwrite($fp, $about);
  fwrite($fp, $blogcreatetime);
  fwrite($fp, $pagesize);
  fclose($fp);
  Header("Location:../index.php");
?>