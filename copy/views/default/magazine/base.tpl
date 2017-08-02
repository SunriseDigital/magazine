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
  {block name='canonical'}{/block}{* URL正規化 *}
  {block name='alternate'}{/block}
  {block name='css'}{/block}
  {block name='js'}{/block}
</head>
<body>
  {block name='bread_crumb'}{/block}
  {block name='main-column-primary'}{/block}
</body>
</html>
{/strip}