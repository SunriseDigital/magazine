<?php

require_once '/home/sites/sdx/models/Sdx/Context.php';

$base = '%CONTEXT_DIR%';

$context = Sdx_Context::create('/home/sites/magazine/common', 'Site_Environment_Http_Pc', array(
  'base'   => $base,
  'config' => $base.'/config',
  'cache'  => $base.'/cache'
));

$context->dispatch();