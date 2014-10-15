<?php

	header("Content-Type;text/html;charset=UTF-8");
	
	
	//连接数据库
	$con=mysql_connect("localhost","root","root");
	if(!$con){
		die('could noy connect: '.mysql_error());
	}

	$db_select=mysql_select_db("shop",$con);
	mysql_query("set names utf8");

	//该文件的作用是接受用户输入的信息，进行查询，哦按段是否存在
	//如果存在，则跳转到成功页面，如果错误，返回登陆界面
	//接受用户名几密码

	//获取用户名
	$username=$_POST['username'];
	//获取密码
	$pwd=$_POST['pwd'];
	
	//根据用户名及密码进行查询，
	$sql="select * from shop_user where user_name='$username' AND user_password='$pwd';";

	//执行查询语句
	$result=mysql_query($sql,$con);

	$test=mysql_fetch_array($result);
	if($test==0){
		header('location: http://localhost/wangshangshudian/2.html');
	}else{
	?>	<script language="javascript">location.href="loginsuccess.php"</script>
	<?php	
	}
	
?>