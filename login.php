<?php

	header("Content-Type;text/html;charset=UTF-8");
	
	
	//�������ݿ�
	$con=mysql_connect("localhost","root","root");
	if(!$con){
		die('could noy connect: '.mysql_error());
	}

	$db_select=mysql_select_db("shop",$con);
	mysql_query("set names utf8");

	//���ļ��������ǽ����û��������Ϣ�����в�ѯ��Ŷ�����Ƿ����
	//������ڣ�����ת���ɹ�ҳ�棬������󣬷��ص�½����
	//�����û���������

	//��ȡ�û���
	$username=$_POST['username'];
	//��ȡ����
	$pwd=$_POST['pwd'];
	
	//�����û�����������в�ѯ��
	$sql="select * from shop_user where user_name='$username' AND user_password='$pwd';";

	//ִ�в�ѯ���
	$result=mysql_query($sql,$con);

	$test=mysql_fetch_array($result);
	if($test==0){
		header('location: http://localhost/wangshangshudian/2.html');
	}else{
	?>	<script language="javascript">location.href="loginsuccess.php"</script>
	<?php	
	}
	
?>