<?php
	header("Content-Type;text/html;charset=UTF-8");

	//连接数据库
	$con=mysql_connect("localhost","root","root");
	//判断是否连接成功
	if(!$con){
		die('could not connect:'.mysql_error());
	}
	
	//选择数据库
	$db_select=mysql_select_db("shop",$con);
	//设置编码
	mysql_query("set names utf8");


	//	获取输入的管理员账号和密码
	$adminname=$_POST['adminname'];
	$adminpwd=$_POST['adminpwd'];

	//根据用户名和密码进行数据库查询
	$sql="select * from shop_admin where admin_name='$adminname' AND admin_password='$adminpwd';";

	//执行查询语句
	$result=mysql_query($sql,$con);
	$test=mysql_fetch_array($result);

	if($test==0){
		header('location:http://localhost/wangshangshudian/backlogin.html');
	}else{
	?>

		<script language="javascript">location.href="backloginsuccess.php"</script>
	<?php
	}

	
?>