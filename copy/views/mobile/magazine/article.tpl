{extends file='./base.tpl'}

{block name='pagetitle'}{$article.title}{/block}
{block name='description'}{/block}
{block name='keywords' prepend}{/block}
{block name='canonical' prepend}<link rel="canonical" href="//{$smarty.server.SERVER_NAME}/magazine/{$params.group_id}/{$params.category_id}/{$params.article_id}/">{/block}

{block name='bread_crumb'}
<div>
  <a href="/">トップ</a>&nbsp;&gt;
  <a href="../../../">マガジン</a>&nbsp;&gt;
  {foreach $group_list as $group}
  {if $params.group_id == $group.id}
  <a href="../../">{$group.name}記事一覧</a>&nbsp;&gt;
  {/if}
  {/foreach}
  {foreach $category_list as $category}
  {if $params.category_id == $category.id}
  <a href="../">{$category.name}記事一覧</a>&nbsp;&gt;
  {/if}
  {/foreach}
  <a href="{$smarty.server.REQUEST_URI}">{$article.title}</a>
</div>
{/block}

{block name="main-column-primary"}
<div>
  <div>
    <h1>{$article.title}</h1>
    <div>
      <span>{$article.created_at|date_format:"%Y.%m.%d"}</span>
      <p>
        {foreach $group_list as $group}
        {if $article.group_id == $group.id}
        <span>{$group.name} |</span>
        {break}
        {/if}
        {/foreach}
        {foreach $category_list as $category}
        {if $article.category_id == $category.id}
        {$category.name}
        {break}
        {/if}
        {/foreach}
      </p>
    </div>
  </div>
  <div>
    <img src="{$article.image_uri}" alt="記事画像">
    <div>{include file="default/magazine/article/`$article.article_id`/body.tpl"}</div>
  </div>
</div>
{/block}
