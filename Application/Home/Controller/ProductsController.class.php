<?php

namespace Home\Controller;

class ProductsController extends CommonController {
	
	public function detail()
	{
		$pid = I('get.pid', 0, 'intval');
		
		$productsModel = D('Products');
		
		$info = $productsModel->where("id='{$pid}'")->find();
		if($info) {
			//获取产品相册
			$gallerys = D('ProductsGallery')->where("pid='{$pid}'")->order('sort desc')->select();
			$this->assign('gallerys', $gallerys);
		}
		
		$attrs = $productsModel->get_attrs($info['cateid'], $info['id']);
		
		$related_products_id = D('Products_related')->where("products_id={$pid}")->select();
		
		$product_ids = array($pid);
		if($related_products_id) {
			foreach($related_products_id as $val) {
				array_push($product_ids, (int)$val['related_products_id']);
			}
		}
		sort($product_ids);
		
		$related_attrs = D('ProductsAttr')->get_attrs($product_ids);
		
		$randlist = $this->_rand_product($pid, 9);
		
		$commnet_count = D('ProductsAsk')->where("products_id='{$pid}' AND status=1 AND type='Review'")->count();
		$this->assign('randlist', $randlist);
		$this->assign('commnet_count', $commnet_count);
		$this->assign('attrs', $attrs);
		$this->assign('related_attrs', $related_attrs);
		$this->assign('info', $info);
		$this->assign('pid', $info['id']);
		$this->display();
	}
	
	public function desc()
	{
		$pid = I('get.pid', 0, 'intval');
		
		$productsModel = D('Products');
		$info = $productsModel->where("id='{$pid}'")->find();
		
		$this->assign('info', $info);
		$this->assign('pid', $info['id']);
		$this->display();
	}
	
	public function comment()
	{
		$pid = I('get.pid', 0, 'intval');
		
		$productsModel = D('Products');
		$info = $productsModel->where("id='{$pid}'")->find();
				
		$comment = D('ProductsAsk')->getComment($pid, "type='Review'");
		
		$this->assign('comment', $comment);		
		$this->assign('info', $info);
		$this->assign('pid', $info['id']);
		$this->display();
	}
	
	public function add_comment()
	{
		$products_id = I('post.products_id', 0, 'intval');
		$type = I('post.type', 'Review');
		$name = I('post.name', '');
		$content = I('post.content', '');
		$star = I('post.star', 0, 'intval');
		$email = I('post.email', '');
		$email_reg = '/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/i'; 
		
		if(empty($products_id)) {
			$this->error('Sorry, to comment on the product does not exist.');
		}
		if(empty($name)) {
			$this->error('Please enter your name');
		}
		if(empty($email) || !preg_match($email_reg, $email)) {
			$this->error('Please fill in the email correctly.'); 
		}
		if(empty($content)) {
			$this->error('Please enter content');
		}
		if(strlen($content)<10) {
			$this->error('Please enter content may not be less than 10 characters.');
		}
	
		//检查当前评论产品是否存在
		$pro = D('Products')->find($products_id);
		if(empty($pro)) {
			$this->error('Sorry, to comment on the product does not exist.');
		}
		
		$data['status'] = 0;
		$data['ip'] = get_client_ip();
		$data['dateline'] = time();
		$data['content'] = $content;
		$data['email'] = $email;
		$data['products_id'] = $products_id;
		$data['type'] = $type;
		$data['name'] = $name;
		$data['star'] = $star;
		
		if(M('ProductsAsk')->add($data)) {
			$this->success('Your message has been submitted!');
		}
		$this->error('Failure to submit your message!');
		
	}
	
	protected function _rand_product($products_id, $limit = 9)
	{
		$cachekey = "products_rand_{$products_id}_{$limit}";
		$cachedata = S($cachekey);
		if(!$cachedata) {
			$cachedata = D('Products')->rand('id,cateid,name,price,pricespe,bigimage,smallimage', $limit);
			S($cachedata, $cachekey);
		}
		return $cachedata;
	}
	
}
	