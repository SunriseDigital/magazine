{strip}
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <title>{block name='pagetitle'}{/block}</title>
  <meta name="description" content="{block name='description'}{/block}" />
  <meta name="keywords" content="{block name='keywords'}{/block}" />
  <meta name="author" content="{block name='author'}Media Craft{/block}" />
  <meta name="copyright" content="Copyright &copy; {block name='copyright'}{/block}" />
  <meta name="reply-to" content="{block name='reply-to'}{/block}" />
  {block name='meta_includes'}{/block}
  {block name='robots'}
  {if strpos(getenv('SERVER_NAME'), 'test') !== false}
  <meta name="robots" content="noindex,nofollow">
  {else}
  <meta name="robots" content="index,follow">
  {/if}
  {/block}
  {block name='canonical'}{/block}
  {block name='favicon'}{/block}
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
