<?php
namespace Admin\Controller;
use Think\Controller;
class CommonController extends Controller{

	protected function _initialize(){
		if (session('?uid') == false) {
			$this->error('您尚未登录！正在跳转登录页面','login');
		}else{
		$this->_check_priv();
		$config = M('Config')->getField('name,value');//导入设置
		C($config);}
    }
	
	//验证用户是否有操作权限
	private function _check_priv() {  
        $auth = new \Think\Auth();//类库位置位于ThinkPHP\Library\Think\
		$_tmpinfo = $auth->getGroups(session('uid'));
		//系统设置组别为1的是超管 取消验权
		$_tmpinfo[0]['group_id'] = isset($_tmpinfo[0]['group_id']) ? $_tmpinfo[0]['group_id'] : '';//去除notice提示
		if ($_tmpinfo[0]['group_id']!= 1) {
			if (!$auth->check(MODULE_NAME.'/'.CONTROLLER_NAME.'/'.ACTION_NAME,session('uid'))) {
				$this->error('你没有权限','login');
			}
		}
	}
	
}