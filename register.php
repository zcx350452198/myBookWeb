<?php
	header("Content-Type;text/html;charset=UTF-8");

	//�������ݿ�
	$con=mysql_connect("localhost","root","root");
	//�ж��Ƿ��������ݿ�ɹ�
	if(!$con){
		die('could not connect:'.mysql_error());
	}
	//ѡ�����ݿ�
	$db_select=mysql_select_db("shop",$con);

	//ѡ����뼯
	mysql_query("set names utf8");

	//�����û���Ϣ

	//��ȡע���û��û���
	$username=$_POST['username'];
	//��ȡע���û���һ������
	$password1=$_POST['password1'];
	//��ȡע���û��ڶ�������
	$password2=$_POST['password2'];
	//��ȡע���û��Ա�
	$sex=$_POST['sex'];
	//��ȡע���û���������
	$email=$_POST['email'];
	
	$password=' ';//��������
	if($password1==$password2 && $password1!='' && $password2!=''){
		$password=$password1;
	}else{
		echo "�������벻һ����û����������";
	}
	//����Ա�Ϊ�У�������Ϊ1������Ա�ΪŮ������Ϊ0
	if($sex=='��'){
		$sex=1;
	}else{
		$sex=0;
	}

	//��ע���������ݿ����û������бȽϣ������ݿ����Ƿ��Ѵ��ڣ�����������ʾ���û����ѱ�ע�ᣬ��������ע��
	
	$checkusername="select * from shop_user where user_name='$username';";	
	$checkresult=mysql_query($checkusername,$con);
	//�û����Ѵ��ڣ��Զ�����ע��ҳ��
	if(is_array(mysql_fetch_row($checkresult))){
		?>
		<script language="javascript">location.href="register.html"</script>
		<?php
	}
	
	
	//��ע���û���Ϣ���뵽MySQL���ݿ���
	$query="insert into shop_user values ('$username','$password','$sex','$email')";
	$result=mysql_query($query);
	if($result){
		?>

		<script language="javascript">location.href="registersuccess.php"</script>
	
			<?php
	}
?>