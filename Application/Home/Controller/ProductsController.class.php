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
		$cate = D('Cate')->getCate($info['cateid'], 'id,name');
		
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
		$randlist = $this->_rand_product($pid, 6);
		$commnet_count = D('ProductsAsk')->where("products_id='{$pid}' AND status=1 AND type='Review'")->count();
		
		$profav_total = 0;
		if($this->member_Info['profav']) {
			$profav = explode(',',$this->member_Info['profav']);
			$profav_total =  in_array($pid, $profav)? 1: 0;
		}
		
		//记录浏览历史
		save_history($pid);
		
		$this->assign('profav_total', $profav_total);
		$this->assign('randlist', $randlist);
		$this->assign('commnet_count', $commnet_count);
		$this->assign('attrs', $attrs);
		$this->assign('related_attrs', $related_attrs);
		$this->assign('info', $info);
		$this->assign('pid', $info['id']);
		$this->assign('cate', $cate);
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
		$code = I('post.code', '');
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
		if(!check_verify($code)) {
			$this->error('Verification code error');
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
			$this->success('Your message has been submitted.');
		}
		$this->error('Failure to submit your message.');
		
	}
	
	public function add_cart()
	{
		$count = I('post.count', 0, 'intval');
		$pid = I('post.id', 0, 'intval');
		$post = $_POST;
		
		if($count <= 0) {
			$this->error("You did not select any product.");
		}
		if(empty($pid)) {
			$this->error("Please add goods to cart again.");
		}

		//强制登录
		if($this->memberID <= 0 && GetValue('quickbuy')==0) {
			$this->error('Please Log on.', U('MemberPublic/Login'));
		}
		
		$cartModel = D('Cart');
		$productModel = D('Products');
		
		$prolist = $productModel->where("id='{$pid}'")->find();
		$attrlist = $productModel->get_attrs($prolist['cateid'], $pid);
		
		//属性列表
		$i = 0;
		$attributes = array_keys($post['attr']);
		$attr_data = $no_select = array ();
		
		//print_r($attrlist);
		//强制值不为空
		foreach($attrlist as $k=>$v) {
			if(($v['input_type']==0 || $v['input_type']==1) && in_array($v['name'], $attributes) && $post['attr'][$v['name']]) { 
				$attr_data[$i]['name'] = $v['name'];
				$attr_value = explode('__',$post['attr'][$v['name']]);
				$attr_data[$i]['value'] = $attr_value[0];
				$attr_data[$i]['attr_price'] = $attr_value[1];
				$i++;
			}else {
				$no_select[] = $v['name'];
			}
		}
		if(count($no_select)>0) {
			$this->error("Please select ".implode(',',$no_select).'.' );
		}
		
		$cartModel->add_item($this->sessionID, $pid, $count, serialize($attr_data));
		if(IS_AJAX) {
			$item_count = itemCount();
			$total_count = TotalCount();
			$price_total = getprice_str(cart_total());
			$data = array(
				'status' => 1,
				'info' => "Add {$_POST ['count']} items Goods To Cart Successful</span>",
				'item_count' => $item_count,
				'total_count' => $total_count,
				'price_total' => $price_total,
			);
			$this->ajaxReturn($data);
		}else{
			$this->redirect('Cart/index');
		}
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
	