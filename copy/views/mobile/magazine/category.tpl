{extends file='./base.tpl'}

{block name='pagetitle'}{foreach $category_list as $category}{if $params.category_id == $category.id}{$category.name}一覧{/if}{/foreach}{/block}
{block name='description'}{/block}
{block name='keywords' prepend}{/block}
{block name='canonical' prepend}<link rel="canonical" href="//{$smarty.server.SERVER_NAME}/magazine/{$params.group_id}/{$params.category_id}/">{/block}

{block name='bread_crumb'}
<div>
  <a href="/">トップ</a>&nbsp;&gt;
  <a href="../../">マガジン</a>&nbsp;&gt;
  {foreach $group_list as $group}
  {if $params.group_id == $group.id}
  <a href="../">{$group.name}記事一覧</a>&nbsp;&gt;
  {/if}
  {/foreach}
  {foreach $category_list as $category}
  {if $params.category_id == $category.id}
  <a href="{$smarty.server.REQUEST_URI}">{$category.name}記事一覧</a>
  {/if}
  {/foreach}
</div>
{/block}

{block name="main-column-primary"}
<div>

  <div>
    {foreach $category_list as $category}
    {if $params.category_id == $category.id}
    {$category.name}
    {/if}
    {/foreach}
  </div>

  <div>
    {foreach $article_list as $article}
    <div>
    <a href="./{$article.article_id}/">
      <img src="{$article.image_uri}" alt="記事画像">
      <div>
        <h2>{$article.title}</h2>
        <div>
          <span>{$article.created_at|date_format:"%Y.%m.%d"}</span>
          <div>
            {foreach $group_list as $group}
            {if $article.group_id == $group.id}
            <span>{$group.name}</span>
            {break}
            {/if}
            {/foreach}
            {foreach $category_list as $category}
            {if $article.category_id == $category.id}
            {$category.name}
            {break}
            {/if}
            {/foreach}
          </div>
        </div>
      </div>
    </a>
    </div>
    {/foreach}
  </div>

</div>
{/block}
