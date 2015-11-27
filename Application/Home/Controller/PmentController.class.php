<?php

namespace Home\Controller;

class PmentController extends MemberController {
	
	public function index()
	{
	}
	
	
	/**
    * 由于支付接口那边 url、页面中不允许出现moneybrace等字样
    * moneybrace_return 改成mace_return
    */
    public function mace_return()
    {
        if(!empty($_GET) && empty($_POST)) {
            $_POST = $_GET;
        }
        unset($_GET);
        if(empty($_POST)) {
            die('data error');
        }
        $_GET = $_POST;
        $merchant_id = $_GET['merchant_id']; // 商户号
        $merch_order_id = $_GET['merch_order_id']; // 商品订单号
        $price_currency = $_GET['price_currency']; // 订单标价币种
        $price_amount = $_GET['price_amount']; //商品支付金额
        $merch_order_ori_id = $_GET['merch_order_ori_id']; // 商户原始订单号 
        $order_id = $_GET['order_id']; //支付接口公司系统生成的唯一标识该订单的订单号
        $status = $_GET['status']; //订单支付状态 Y-成功   T-待处理   N-失败
        $message = $_GET['message']; //订单结果的描述性信息
        $signature = $_GET['signature'];
        $allow2 = $_GET ['allow2'];
        
        $hashkey = GetValue($pname . "_key");
        $strVale = $hashkey . $merchant_id . $merch_order_id . $price_currency . $price_amount . $order_id . $status;
        $getsignature = md5($strVale);
        if($getsignature != $signature) {
            die('Signature error!');
        }
        
        if($allow2 != '') {
            $logoinfo = M('moneybraceLogo')->where("id='1'")->find();
            if($allow2 != $logoinfo['logoname']) {
                M('moneybraceLogo')->where("id='1'")->save(array('logoname'=>$allow2));
            }
        }
		
		$ordersModel = D('Orders');
   
        //查询订单相关信息
        $orderinfo = $ordersModel->where("sn='{$merch_order_id}'")->find();
        if(empty($orderinfo)) {
            die('Signature error!');
        }
        $this->orderinfo = $orderinfo;
        
        $order_product_info = D('OrdersProducts')->where("orders_id='{$orderinfo['id']}'")->select();
        if($order_product_info) {
            foreach($order_product_info as $k=>$val) {
                $order_product_info[$k]['name'] = $val['products_name'];
            }
        }
        $this->order_product_info = $order_product_info;
        
        $this->writePaymentLog($merch_order_id, $status, $message);
		
		if(strpos($message, 'GW125') !== false) {
			$error_msg = 'Credit card type error, suspension of trading'; //信用卡类型错误，中止交易
		}else if(strpos($message, 'GW126') !== false) {
			$error_msg = 'Credit card number error, suspension of trading'; //信用卡号错误，中止交易
		}else if(strpos($message, 'GW127') !== false) {
			$error_msg = 'Security code error, suspension of trading'; //安全码错误，中止交易
		}else if(strpos($message, 'GW128') !== false) {
			$error_msg = 'Credit card is valid error, suspension of trading'; //信用卡有效期错误，中止交易
		}else if(strpos($message, 'GW130') !== false) {
			$error_msg = 'Bank card card number error'; //银行卡卡号错误
		}else if(strpos($message, 'GW132') !== false) {
			$error_msg = 'The validity of bank card number error'; //银行卡号有效期错误
		}else{
			$error_msg = 'Paid failed, return and try it again!';
		}
		$this->error_msg = $error_msg;

        //根据得到的数据  进行相对应的操作
        //$status Y-交易成功 T-处理当中 N-交易失败
        if($status == 'Y') {
            $data['orders_status'] = '2';
            $ordersModel->where("sn='{$merch_order_id}'")->save($data); //修改订单支付状态
            give_member_points($merch_order_id); //赠送用户积分
            $this->display('Payment-succeed');
        }else{  
            $data['orders_status'] = '1';
            $ordersModel->where("sn='{$merch_order_id}'")->save($data);  //修改订单状态为正在付款中
        }
        $this->display('Payment-failure');
    }
    
    /**
    * 由于支付接口那边 url、页面中不允许出现moneybrace等字样
    * moneybrace_http 改成mace_http
    */
    public function  mace_http()
    {
        if(!empty($_GET) && empty($_POST)) {
            $_POST = $_GET;
        }
        unset($_GET);
        if(empty($_POST)) {
            die('data error!');
        }
        $_GET = $_POST;
        $cardsNum = isset($_GET['Debit_Card_Num'])? $_GET['Debit_Card_Num']: "";
        $Card_ExpireYear = isset($_GET['Debit_Card_ExpireYear'])? $_GET['Debit_Card_ExpireYear'] : "";
        $Card_ExpireMonth = isset($_GET['Debit_Card_ExpireMonth'])? $_GET['Debit_Card_ExpireMonth'] : "";
        $Card_CVV = isset($_GET['Debit_Card_CVV'] )? $_GET['Debit_Card_CVV'] : "";
        $issue_bank = isset($_GET['Debit_issue_bank'])? $_GET['Debit_issue_bank'] : "";
        
        $srcString = "merchant_id=" . urlencode($_GET['merchant_id']) . 
                    "&order_type=" . urlencode($_GET['order_type']) . 
                    "&language=" . urlencode($_GET['language']) . 
                    "&gw_version=" . urlencode($_GET['gw_version']) . 
                    "&merch_order_ori_id=" . urlencode($_GET['merch_order_ori_id']) . 
                    "&merch_order_date=" . urlencode($_GET['merch_order_date']) . 
                    "&merch_order_id=" . urlencode($_GET['merch_order_id']) . 
                    "&price_currency=" . urlencode($_GET['price_currency']) . 
                    "&price_amount=" . urlencode($_GET['price_amount']) . 
                    "&url_sync=" . urlencode($_GET['url_sync']) . 
                    "&url_succ_back=" . urlencode($_GET['url_succ_back']) . 
                    "&url_fail_back=" . urlencode($_GET['url_fail_back']) . 
                    "&order_remark=" . urlencode($_GET['order_remark']) . 
                    "&signature=" . urlencode($_GET['signature']) . 
                    "&ip=" . urlencode($_GET['ip']) . 
                    "&bill_address=" . urlencode($_GET['bill_address']) . 
                    "&bill_country=" . urlencode($_GET['bill_country']) . 
                    "&bill_province=" . urlencode($_GET['bill_province']) . 
                    "&bill_city=" . urlencode($_GET['bill_city']) . 
                    "&bill_email=" . urlencode($_GET['bill_email']) . 
                    "&bill_phone=" . urlencode($_GET['bill_phone']) . 
                    "&bill_post=" . urlencode($_GET['bill_post']) . 
                    "&delivery_name=" . urlencode($_GET['delivery_name']) . 
                    "&delivery_address=" . urlencode($_GET['delivery_address']) . 
                    "&delivery_country=" . urlencode($_GET['delivery_country']) . 
                    "&delivery_province=" . urlencode($_GET['delivery_province']) . 
                    "&delivery_city=" . urlencode($_GET['delivery_city']) . 
                    "&delivery_email=" . urlencode($_GET['delivery_email']) . 
                    "&delivery_phone=" . urlencode($_GET['delivery_phone']) . 
                    "&delivery_post=" . urlencode($_GET['delivery_post']) . 
                    "&hash_num=" . urlencode($cardsNum) . 
                    "&hash_sign=" . urlencode($Card_CVV) . 
                    "&card_exp_year=" . urlencode($Card_ExpireYear) . 
                    "&card_exp_month=" . urlencode($Card_ExpireMonth) . 
                    "&issue_bank=" . urlencode($issue_bank) . 
                    base64_decode($_GET['strProduct']) . 
                    "&client_finger_cybs=" . urlencode($_GET['client_finger_cybs']). 
                    "&channel_id=" . urlencode($_GET['channel_id']);
                    
        $url_server = "https://payment.onlinecreditpay.com/Payment4/Payment.aspx"; // 支付网关地址
        
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL, $url_server);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, FALSE);
        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, FALSE);
        curl_setopt($curl, CURLOPT_USERAGENT, $_SERVER['HTTP_USER_AGENT']);
        curl_setopt($curl, CURLOPT_FOLLOWLOCATION, 1);
        curl_setopt($curl, CURLOPT_REFERER, $_SERVER['HTTP_HOST']);
        curl_setopt($curl, CURLOPT_POST, 1);
        curl_setopt($curl, CURLOPT_POSTFIELDS, $srcString);
        curl_setopt($curl, CURLOPT_TIMEOUT, 3000);
        curl_setopt($curl, CURLOPT_HEADER, 0);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
        if($url_server) {
            curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, 0);
            curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, 0);
        }
        $response = curl_exec($curl);

        if($response != '') {
            $xml = new DOMDocument();
            $xml->loadXML($response);
            $merchant_id = $xml->getElementsByTagName('merchant_id')->item(0)->nodeValue;
            $merch_order_id = $xml->getElementsByTagName('merch_order_id')->item(0)->nodeValue;    
            
            //商户原始订单号
            $merch_order_ori_id = $xml->getElementsByTagName('merch_order_ori_id')->item (0)->nodeValue;
            $order_id = $xml->getElementsByTagName('order_id')->item(0)->nodeValue;
            $price_currency = $xml->getElementsByTagName('price_currency')->item(0)->nodeValue;
            $price_amount = $xml->getElementsByTagName('price_amount')->item(0)->nodeValue;
            $status = $xml->getElementsByTagName('status')->item(0)->nodeValue; 
            $message = $xml->getElementsByTagName('message')->item(0)->nodeValue;
            $signature = $xml->getElementsByTagName('signature')->item(0)->nodeValue;
            $allow2 = $xml->getElementsByTagName('allow2')->item(0)->nodeValue;
            $this->message = $message;
            
            if($allow2 != '') {
                $logoinfo = M('moneybraceLogo')->where("id='1'")->find();
                if($allow2 != $logoinfo['logoname']) {
                    M('moneybraceLogo')->where("id='1'")->save(array('logoname'=>$allow2));
                }    
            }
			
			$ordersModel = D('Orders');
			
            //查询订单相关信息
            $orderinfo = $ordersModel->where("sn='{$merch_order_id}'")->find();
            if(empty($orderinfo)) {
                die('Signature error!');
            }
            $this->orderinfo = $orderinfo;
            
            $order_product_info = D('OrdersProducts')->where("orders_id='{$orderinfo['id']}'")->select();
            if($order_product_info) {
                foreach($order_product_info as $k=>$val) {
                    $order_product_info[$k]['name'] = $val['products_name'];
                }
            }
            $this->order_product_info = $order_product_info;
            
            $this->writePaymentLog($merch_order_id, $status, $message);
			
			if(strpos($message, 'GW125') !== false) {
				$error_msg = 'Credit card type error, suspension of trading'; //信用卡类型错误，中止交易
			}else if(strpos($message, 'GW126') !== false) {
				$error_msg = 'Credit card number error, suspension of trading'; //信用卡号错误，中止交易
			}else if(strpos($message, 'GW127') !== false) {
				$error_msg = 'Security code error, suspension of trading'; //安全码错误，中止交易
			}else if(strpos($message, 'GW128') !== false) {
				$error_msg = 'Credit card is valid error, suspension of trading'; //信用卡有效期错误，中止交易
			}else if(strpos($message, 'GW130') !== false) {
				$error_msg = 'Bank card card number error'; //银行卡卡号错误
			}else if(strpos($message, 'GW132') !== false) {
				$error_msg = 'The validity of bank card number error'; //银行卡号有效期错误
			}else{
				$error_msg = 'Paid failed, return and try it again!';
			}
			$this->error_msg = $error_msg;
			
            
            //根据得到的数据  进行相对应的操作
            //$status Y-交易成功 T-处理当中 N-交易失败
            if($status == 'Y') {
                $data['orders_status'] = '2';
                $ordersModel->where("sn='{$merch_order_id}'")->save($data); //修改订单支付状态
                give_member_points($merch_order_id); //赠送用户积分
                
                $this->display('Payment-succeed');
            }else{  
                $data['orders_status'] = '1';
                $ordersModel->where("sn='{$merch_order_id}'")->save($data);  //修改订单状态为正在付款中
            }
            $this->display('Payment-failure');
        }
    }
    
	
	public function richcard_respond()
	{
		$payment  = get_payment($_REQUEST['code']);
        /* 获取返回参数 */
       // $merNo         = $_REQUEST["merNo"];
        $orderNo       = $_REQUEST["orderNo"];
        $tradeNo       = $_REQUEST["tradeNo"];
        $currency      = $_REQUEST["currency"];
        $amount        = $_REQUEST["amount"];
        $succeed       = $_REQUEST["succeed"];
        $bankInfo      = $_REQUEST["bankInfo"];
        $errorMsg      = $_REQUEST["errorMsg"];
        $md5Info       = strtoupper($_REQUEST["md5Info"]);
		
        $log_id        = $this->get_order_id_by_order_no($orderNo);
        
		 /* 校验数据 */
        $merKey   = trim($payment['MD5key']);
        $signSrc  = $tradeNo.$orderNo.$merKey.$succeed.$currency.$amount;
        $mysign   = strtoupper(md5($signSrc));
        
        /* 验证支付结果 */
        if($md5Info== $mysign){
            if($succeed == 1){
                 order_paid($log_id,PS_PAYED);    //支付成功,更改网店后台订单状态为"已付款"。
                 return true;
            } else if($succeed == 0){
                 order_paid($log_id,PS_UNPAYED);  //支付失败,更改网店后台订单状态为"未付款"。
                 return false; 
                
            } else if($succeed == 2 or $succeed == 3) {
                 order_paid($log_id,PS_PAYING);   //支付待处理,更改网店后台订单状态为"付款中"。
                 return true;
            }  
        } 
    }
	}
	
	
    public function writePaymentLog($sn = '', $status = '', $msg = '')
    {
        $time = date('Y-m-d H:i:s');
        @file_put_contents('./payment_log_'.date('Ymd').'.txt', "{$sn}\t{$status}\t{$msg}\t{$time}\n", FILE_APPEND);       
    }
	
	
	
	
	
	
	
}



