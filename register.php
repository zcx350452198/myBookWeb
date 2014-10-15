<?php
	header("Content-Type;text/html;charset=UTF-8");

	//连接数据库
	$con=mysql_connect("localhost","root","root");
	//判断是否连接数据库成功
	if(!$con){
		die('could not connect:'.mysql_error());
	}
	//选择数据库
	$db_select=mysql_select_db("shop",$con);

	//选择编码集
	mysql_query("set names utf8");

	//接收用户信息

	//获取注册用户用户名
	$username=$_POST['username'];
	//获取注册用户第一遍密码
	$password1=$_POST['password1'];
	//获取注册用户第二遍密码
	$password2=$_POST['password2'];
	//获取注册用户性别
	$sex=$_POST['sex'];
	//获取注册用户电子邮箱
	$email=$_POST['email'];
	
	$password=' ';//最终密码
	if($password1==$password2 && $password1!='' && $password2!=''){
		$password=$password1;
	}else{
		echo "两次密码不一样或没有输入密码";
	}
	//如果性别为男，则设置为1，如果性别为女，设置为0
	if($sex=='男'){
		$sex=1;
	}else{
		$sex=0;
	}

	//将注册名与数据库中用户名进行比较，看数据库中是否已存在，若存在则提示该用户名已被注册，否则正常注册
	
	$checkusername="select * from shop_user where user_name='$username';";	
	$checkresult=mysql_query($checkusername,$con);
	//用户名已存在，自动返回注册页面
	if(is_array(mysql_fetch_row($checkresult))){
		?>
		<script language="javascript">location.href="register.html"</script>
		<?php
	}
	
	
	//将注册用户信息导入到MySQL数据库中
	$query="insert into shop_user values ('$username','$password','$sex','$email')";
	$result=mysql_query($query);
	if($result){
		?>

		<script language="javascript">location.href="registersuccess.php"</script>
	
			<?php
	}
?>