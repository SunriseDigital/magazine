<?php

class Site_Environment_Http_Pc extends Site_Environment_Http
{
  public function getPlugins()
  {
    return array(new Site_Controller_Plugin_Http_Pc());
  }
}