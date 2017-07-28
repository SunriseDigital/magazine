<?php
require_once 'Sdx/Configuration.php';

abstract class Site_Configuration extends Sdx_Configuration
{
  protected function _init(Sdx_Context $context)
  {
    parent::_init($context);

    $context->addIncludePath('/home/sites/sdx/models/3rd');

    Sdx_Context::registerAutoloadNamespace(array('Site_'));
  }
  
  protected function _initCli(Sdx_Context $context)
  {
  }
  
  protected function _initHttp(Sdx_Context $context)
  {
  }
}