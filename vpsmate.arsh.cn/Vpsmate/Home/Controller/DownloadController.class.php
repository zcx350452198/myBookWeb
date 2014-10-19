<?php
namespace Home\Controller;
use Think\Controller\RestController;
class DownloadController extends RestController{
//use Think\Controller;
//class IndexController extends Controller {
	public function _initialize() {
	$config = M('Config')->getField('name,value');//导入设置
	C($config);
	//dump($config);
	}
	
    public function index(){//老版本下载
	$Download = M('Download'); 
	$list = $Download->order('id asc')->select();
	$this->assign('list',$list); 
	$this->display();
    }
	
}