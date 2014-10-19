<?php
/**
 * Admin分组登录 不要继承CommonAction
 * 为了简单起见，直接模拟用户id为1的用户  真正要使用的话需要访问数据库（think_member 表）验证用户密码
 */
namespace Admin\Controller;
use Think\Controller;
class PublicController extends Controller {
	
	function index(){
		$this->redirect('login');
		}

	function login() {
		$config = M('Config')->getField('name,value');//导入设置
		C($config);
		if (IS_POST){
		$datas = $_POST;
		$M = M("Admin");
		if ($M->where("`nickname`='" . $datas['username'] . "'")->count() >= 1) {
			$info = $M->where("`nickname`='" . $datas["username"] . "'")->find();
			if ($info['status'] == 0) {//是否禁用
				$this->error('账号被禁用！','login');
            }
			if ($info['pwd'] == encrypt(trim($datas['password']))) {
				$uid = $info['aid'];
				if (empty($uid)){
					$this->error ('konguid！','login');
					}
				session('uid',$uid);
				$this->success('登录系统成功！正在跳转后台主页', 'index');
				}else{
				$this->error('密码错误！', 'login');
			}
			}else{
        $this->error('账号不存在！','login');
        }
		}else{
		$this->display('Index/login');}
	}
	
	//执行注销
	function logout() {
		session('uid',null);
		$this->success ('您已经安全退出！','login');
	}
}