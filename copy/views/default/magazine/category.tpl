{extends file='./base.tpl'}

{block name='pagetitle'}{foreach $category_list as $category}{if $params.category_id == $category.id}{$category.name}記事一覧{/if}{/foreach}{/block}
{block name='description'}{foreach $category_list as $category}{if $params.category_id == $category.id}{$category.name}の記事一覧ページです{/if}{/foreach}{/block}
{block name='canonical' prepend}<link rel="canonical" href="//{$smarty.server.SERVER_NAME}/magazine/{$params.group_id}/{$params.category_id}/">{/block}
{block name='alternate' append}<link rel="alternate" media="only screen and (max-width: 640px)" href="//{$smarty.server.SERVER_NAME}/magazine/{$params.group_id}/{$params.category_id}/">{/block}

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

{block name='main-column-primary'}
<div>

  <div>
    {foreach $category_list as $category}
    {if $params.category_id == $category.id}
    {$category.name}
    {/if}
    {/foreach}
  </div>

  <div>
    {foreach $article_list as $value}
    <a href="./{$value.article_id}/">
      <img src="{$value.image_uri}" alt="記事画像">
      <div>
        <h2>{$value.title}</h2>
        <p>
          {include file="default/magazine/article/`$value.article_id`/outline.tpl"}
        </p>
        <div>
          <span>{$value.created_at|date_format:"%Y.%m.%d"}</span>
          <div>
            {foreach $group_list as $group}
            {if $value.group_id == $group.id}
            <span>{$group.name}</span>
            {break}
            {/if}
            {/foreach}
            {foreach $category_list as $category}
            {if $value.category_id == $category.id}
            {$category.name}
            {break}
            {/if}
            {/foreach}
          </div>
        </div>
      </div>
    </a>
    {/foreach}
  </div>
</div>
{/block}
