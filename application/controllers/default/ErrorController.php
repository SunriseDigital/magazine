<?php

require_once 'Sdx/Controller/Action/Http.php';

class ErrorController extends Sdx_Controller_Action_Http
{
  public function indexAction()
  {
    $helper = new Sdx_Controller_Action_Helper_ErrorRenderer();
    $this->addHelper($helper);

    if ($handler = $this->_getParam('error_handler'))
    {
      $this->_helper->errorRenderer();

      $module = $this->_getParam('module');
      $code = ($handler->exception->getCode() == '500') ? '500' : '404';
      $template = $module.'/error/'.$code.'.tpl';
      $this->setViewRendererPath($template);
    }
    else
    {
      $this->_helper->errorRenderer();
    }
  }
}