<?php
	header("Content-Type;text/html;charset=UTF-8");

	//�������ݿ�
	$con=mysql_connect("localhost","root","root");
	//�ж��Ƿ����ӳɹ�
	if(!$con){
		die('could not connect:'.mysql_error());
	}
	
	//ѡ�����ݿ�
	$db_select=mysql_select_db("shop",$con);
	//���ñ���
	mysql_query("set names utf8");


	//	��ȡ����Ĺ���Ա�˺ź�����
	$adminname=$_POST['adminname'];
	$adminpwd=$_POST['adminpwd'];

	//�����û���������������ݿ��ѯ
	$sql="select * from shop_admin where admin_name='$adminname' AND admin_password='$adminpwd';";

	//ִ�в�ѯ���
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