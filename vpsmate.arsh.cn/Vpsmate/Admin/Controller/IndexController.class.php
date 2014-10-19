<?php
namespace Admin\Controller;
use Think\Controller;
class IndexController extends CommonController{
	
    public function index(){
		$Info = M("Download"); 
		$info = $Info->order('id desc')->limit(1)->find();
		$array['soft_version'] = 'v'.$info['version'].'b'.$info['build'];
		$this->assign($array);
		$list = $Info->order('id desc')->select();
		$this->assign('list',$list); 
		$this->display();
    }
	
	public function upload(){
		if (IS_POST){
			$M = M('Download');
			$data['name'] = $_POST['name'];
			$data['uid'] = '1';//管理员编号
			$data['version'] = $_POST['version'];
			$data['build'] = $_POST['build'];
			$data['releasetime'] = NOW_TIME;
			$data['content'] = $_POST['content'];
			//上传开始
			$upload = new \Think\Upload();// 实例化上传类    
			$upload->maxSize   =     1500000 ;// 设置附件上传大小 1.5mb   
			$upload->exts      =     array('gz');// 设置附件上传类型
			$upload->savePath  =     '/releases/'; // 设置附件上传目录
			$upload->autoSub  =      false; // 自动使用子目录保存上传文件
			$upload->saveName = strtolower($_POST['name']).'-'.$_POST['version'].'b'.$_POST['build'].'.tar';//文件名   
			$info = $upload->uploadOne($_FILES['soft_upload']);    
			if(!$info) {// 上传错误提示错误信息     
			   $this->error($upload->getError());    
			   }else{// 上传成功 获取上传文件信息
			$data['download_url'] = '/Uploads'.$info['savepath'].$info['savename'];	 	  
			}//上传结束
			$result = $M->add($data);
			if($result){
			$this->success('上传成功', 'index');
			}else{
			$this->error('上传失败');
			}
		}else{
		$this->display();
		}
    }
	
	public function config(){
		if (IS_POST){
			$M = M('Config');
			$data = $_POST;
			foreach($data as $k => $v)
			{
				$datas['name']=$k;
				$datas['value']=$v;
				$M->save($datas);
			}
			$this->success('保存成功');
		}else{
		$this->display();
		}
    }

}