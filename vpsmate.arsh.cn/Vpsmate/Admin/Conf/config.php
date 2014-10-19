<?php
return array(
	'URL_MAP_RULES'=>array(
	'login' => 'Public/login',
	'index' => 'Index/index',
	'upload' => 'Index/upload',
	'config' => 'Index/config',
	'logout' => 'Public/logout'
	),
	//Auth权限设置
    'AUTH_CONFIG' => array(
        'AUTH_ON' => true,  // 认证开关
        'AUTH_TYPE' => 1, // 认证方式，1为实时认证；2为登录认证。
        'AUTH_GROUP' => 'ar_auth_group', // 用户组数据表名
        'AUTH_GROUP_ACCESS' => 'ar_auth_group_access', // 用户-用户组关系表
        'AUTH_RULE' => 'ar_auth_rule', // 权限规则表
        'AUTH_USER' => 'ar_admin', // 用户信息表
    ), 
	'AUTH_CODE' => 'RntmPl', //加密密码
);