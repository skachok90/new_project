<?php
$router = new Zend_Controller_Router_Rewrite();
$router->addRoutes(array(
	'index'						=> new Zend_Controller_Router_Route_Regex('', array('module' => 'default', 'controller' => 'index', 'action' => 'index'), array(), ''),
	'default:str'				=> new Zend_Controller_Router_Route_Regex('str(\.html)?', array('module' => 'default', 'controller' => 'index', 'action' => 'str'), array(), 'str.html'),
	'default:serialize'			=> new Zend_Controller_Router_Route_Regex('serialize(\.html)?', array('module' => 'default', 'controller' => 'index', 'action' => 'serialize'), array(), 'serialize.html'),
));
