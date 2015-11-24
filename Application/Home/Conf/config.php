<?php

/**
 * 系统配文件
 * 所有系统级别的配置
 */
return array(
    //模块相关配置
	
	'MODULE_ALLOW_LIST' => array('Home', 'Common'),
	
	//设置默认加载模块
    'DEFAULT_MODULE' => 'Home', 
	'DEFAULT_CONTROLLER' => 'Index', // 默认控制器名称
    'DEFAULT_ACTION' => 'index', // 默认操作名称
	
	// 默认模板文件后缀
	'TMPL_TEMPLATE_SUFFIX' => '.tpl',
		
	//设置模板文件命名  原来的./Themes/default/Index/index.tpl 变成了./Themes/default/Index-index.tpl
	'TMPL_FILE_DEPR' => '-',
	
	//解析标签
    'TMPL_L_DELIM' => '{',
    'TMPL_R_DELIM' => '}',
	
	//数据缓存设置
    'DATA_CACHE_PREFIX' => 'shopping_', // 缓存前缀
    'DATA_CACHE_TYPE' => 'File', // 数据缓存类型
	
	'URL_CASE_INSENSITIVE' => true,
	'URL_HTML_SUFFIX' => 'html', //URL伪静态后缀设置
	
	//URL配置
	'URL_MODEL' =>3, //URL访问模式 默认为PATHINFO 模式 0 (普通模式); 1 (PATHINFO 模式); 2 (REWRITE  模式); 3 (兼容模式)  
	//'URL_ROUTER_ON' => false, //开启路由
	//路由规则
	'URL_ROUTE_RULES' => array(),	
	
	//设置模板目录
	'VIEW_PATH' => THEMES_PATH,  
	
	//模板相关配置, 在模板中直接使用 如: __IMG__ 
    'TMPL_PARSE_STRING' => array(
        '__SKIN__' => __ROOT__ . '/Public/'. SKIN_NAME,
        '__IMG__' => __ROOT__ . '/Public/'. SKIN_NAME .'/images',
        '__CSS__' => __ROOT__ . '/Public/'. SKIN_NAME .'/css',
        '__JS__'  => __ROOT__ . '/Public/'. SKIN_NAME .'/js',
    ),

    //全局过滤配置
    'DEFAULT_FILTER' => '', //全局过滤函数
	'SHOW_PAGE_TRACE' => false, 
	
	//开启html静态页面缓存
	'HTML_CACHE_ON' => true, //是否开启缓存 true-开启 false-不开启
	'HTML_CACHE_TIME' => 3600, //全局缓存时间
	'HTML_FILE_SUFFIX' => '.html', //缓存文件后缀
	'HTML_CACHE_RULES' => array(
		'Index:index' => array('front/index', 3600), //缓存首页
		
		//规则 '控制器:方法' => array('参数', 单独设置缓存时间, '自定义函数'),
		//'Article:view' => array('{id}-{p}-{part}', 86400, 'hash_view_cache'), //缓存资讯内容页
	),
	
	//默认错误跳转对应的模板文件
	'TMPL_ACTION_ERROR' => THEMES_PATH . 'Public/dispatch_jump.tpl',
	
	//默认成功跳转对应的模板文件
	'TMPL_ACTION_ERROR' => THEMES_PATH . 'Public/dispatch_jump.tpl',
);
