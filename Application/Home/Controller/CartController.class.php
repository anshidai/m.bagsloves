<?php

namespace Home\Controller;

class CartController extends CommonController {
	
	
	public function add()
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
			if(IS_AJAX) {
				$data = array(
					'status' => 0,
					'info' => 'Please Log on!',
					'url' => U('MemberPublic/Login'),
				);
				$this->ajaxReturn($data);
			}else {
				echo "<script>alert('Please Log on!');location.href='".U('MemberPublic/Login')."';</script>";
				exit;
			}
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
	
	
	
	
}