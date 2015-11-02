<?php

namespace Home\Controller;

class ProductsController extends CommonController {
	
	public function detail()
	{
		$pid = I('get.pid', 0, 'intval');
		
		$model = D('Products');
		
		$info = $model->where("id='{$pid}'")->find();
		if($info) {
			//获取产品相册
			$gallerys = D('ProductsGallery')->where("pid='{$pid}'")->order('sort desc')->select();
			$this->assign('gallerys', $gallerys);
		}
		
		$attrs = $model->get_attrs($info['cateid'], $info['id']);
		//dump($attrs);
		
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
		
		$this->assign('randlist', $randlist);
		$this->assign('attrs', $attrs);
		$this->assign('related_attrs', $related_attrs);
		$this->assign('info', $info);
		$this->assign('pid', $info['id']);
		$this->display();
	}
	
	public function _rand_product($products_id, $limit = 9)
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
	