{strip}
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <title>{block name='pagetitle'}{/block}</title>
  {block name='meta'}
  <meta name="description" content="{block name='description'}{/block}" />
  <meta name="keywords" content="{block name='keywords'}{/block}" />
  {/block}
  {block name='robots'}
  {if strpos(getenv('SERVER_NAME'), 'test') !== false}
  <meta name="robots" content="noindex,nofollow">
  {else}
  <meta name="robots" content="index,follow">
  {/if}
  {/block}
  {block name='canonical'}{/block}
  {block name='alternate'}{/block}
  {block name='css'}{/block}
  {block name='js_head'}{/block}
</head>
<body>
  {block name='bread_crumb'}{/block}
  {block name='main-column-primary'}{/block}
  {block name='js_body'}{/block}
</body>
</html>
{/strip}