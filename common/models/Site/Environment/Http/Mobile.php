<?php

class Site_Environment_Http_Mobile extends Site_Environment_Http
{
  protected $_route_config_file = 'mobile_route';
  protected $_error_handler_module = 'mobile';

  public function getPlugins()
  {
    return array(new Site_Controller_Plugin_Http_Mobile());
  }

  protected function _initSessionSetting()
  {
    Zend_Session::setOptions(array(
      'name' => 'sdxsid',
      'use_cookies' => '0',
      'use_only_cookies' => '0',
      'use_trans_sid' => '1',
    ));
  }
}