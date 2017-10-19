<?php

require_once Sdx_Context::getInstance()->getConfig()->get('sys.context_dir').'/models/Site/Configuration.php';

class Configuration extends Site_Configuration
{	
	protected function _initHttp(Sdx_Context $context)
	{
		parent::_initHttp($context);
		
		//If you want to register other auto load namespase, Remove this comment out.
		//$context->registerAutoloadNamespace('Other');
		
		//If you want to enable access control, Remove this comment out.
		//$context->registerControllerPlugin(new Sdx_Controller_Plugin_AccessControl());
	}
}