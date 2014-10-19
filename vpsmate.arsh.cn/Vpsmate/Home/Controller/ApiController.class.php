<?php
namespace Home\Controller;
use Think\Controller\RestController;
class ApiController extends RestController{
	public function _initialize() {
		$config = M('Config')->getField('name,value');//导入设置
		C($config);
		//dump($config);
	}
	
	public function index(){
		$array['api'] = 'API接口';
	$this->response($array,'json');
    } 
	
	public function latest(){
		$Download = M("Download"); 
		$list = $Download->order('id desc')->limit(1)->find();
		$array['version'] = $list['version'];
		$array['build'] = $list['build'];
		$array['releasetime'] = date("Y-m-d",$list['releasetime']);
		$array['download'] = C('webroot').$list['download_url'];
		$array['changelog'] = C('webroot').'/changelog';
		$this->response($array,'json');
	}
	
	public function site_packages(){
		$array['name'] = '服务器管理类';
		$array['packages'] = 'API接口';
		$this->response($array,'json');
    }
	
}