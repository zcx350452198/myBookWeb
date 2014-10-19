<?php
namespace Home\Controller;
use Think\Controller;
class IndexController extends Controller {
	public function _initialize() {
		 $config = M('Config')->getField('name,value');//导入设置
		 C($config);
		 //dump($config);
		 }
	
    public function index(){
		$Download = M("Download"); 
		$list = $Download->order('id desc')->limit(1)->find();
		$array['version'] = $list['version'];
		$array['build'] = $list['build'];
		$array['soft_version'] = 'v'.$list['version'].'b'.$list['build'];
		$this->assign($array);
		$this->display();
    }
	
	public function features(){
	$this->display();
    }
	
	public function install(){
	$this->display();
    }
	
	public function manual(){
	$this->display();
    }
	
	public function changelog(){
		$Download = M("Download"); 
		$list = $Download->order('id desc')->select();
		$this->assign('list',$list); 
		$this->display();
    }
	
	public function demo(){
		$demo = C('demo_url');//获取demo网址
		redirect($demo, 0, '页面跳转中...');//开始跳转
    } 
	
	public function bbs(){
	$this->display();
    } 
	
	public function login(){
		redirect('Admin/login');//开始跳转
    }
	
}