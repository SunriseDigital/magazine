{extends file='./base.tpl'}

{block name='pagetitle'}{foreach $group_list as $group}{if $params.group_id == $group.id}{$group.name}記事一覧{/if}{/foreach}{/block}
{block name='description'}{foreach $group_list as $group}{if $params.group_id == $group.id}{$group.name}の記事一覧ページです{/if}{/foreach}{/block}
{block name='canonical' prepend}<link rel="canonical" href="//{$smarty.server.SERVER_NAME}/magazine/{$params.group_id}/">{/block}{* URL正規化 *}
{block name='alternate' append}<link rel="alternate" media="only screen and (max-width: 640px)" href="//{$smarty.server.SERVER_NAME}/magazine/{$params.group_id}/">{/block}

{block name='bread_crumb'}
<div>
  <a href="/">トップ</a>&nbsp;&gt;
  <a href="../">マガジン</a>&nbsp;&gt;
  {foreach $group_list as $group}
  {if $params.group_id == $group.id}
  <a href="{$smarty.server.REQUEST_URI}">{$group.name}記事一覧</a>
  {/if}
  {/foreach}
</div>
{/block}

{block name='main-column-primary'}
<div>

  <div>
    {foreach $group_list as $group}
    {if $params.group_id == $group.id}
    {$group.name}
    {/if}
    {/foreach}
  </div>

  <div>
    {foreach $article_list as $value}
    <a href="./{$value.category_id}/{$value.article_id}/">
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
