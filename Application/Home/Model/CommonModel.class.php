<?php

namespace Home\Model;
use Think\Model;

class CommonModel extends Model {
	public $memberID;
	
	public function _initialize()
	{
		//会员帐号
		$this->memberID = session('memberID')? session('memberID'): 0;
	}
	
}