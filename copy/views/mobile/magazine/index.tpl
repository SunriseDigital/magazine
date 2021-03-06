{extends file='./base.tpl'}

{block name="pagetitle"}マガジン{/block}
{block name='description'}{/block}
{block name='keywords' prepend}{/block}
{block name='canonical' prepend}<link rel="canonical" href="//{$smarty.server.SERVER_NAME}/magazine/">{/block}

{block name='bread_crumb'}
<div>
  <a href="/">トップ</a>&nbsp;&gt;
  <a href="{$smarty.server.REQUEST_URI}">マガジン</a>
</div>
{/block}

{block name="main-column-primary"}
<div>

  <!-- 最新記事 -->
  <div>
    <a href="./{$latest_article.group_id}/{$latest_article.category_id}/{$latest_article.article_id}/">
      <img src="{$latest_article.image_uri}" alt="記事画像">
      <div>
        <h2>{$latest_article.title}</h2>
        <div>
          <span>{$latest_article.created_at|date_format:"%Y.%m.%d"}</span>
          <div>
            {foreach $group_list as $group}
            {if $latest_article.group_id == $group.id}
            <span>{$group.name}</span>
            {break}
            {/if}
            {/foreach}
            {foreach $category_list as $category}
            {if $latest_article.category_id == $category.id}
            {$category.name}
            {break}
            {/if}
            {/foreach}
          </div>
        </div>
      </div>
  </div>

  <!-- ピックアップ記事 -->
  {foreach $pickup_articles as $pickup}
  <div>
    <a href="./{$pickup.group_id}/{$pickup.category_id}/{$pickup.article_id}/">
      <img src="{$pickup.image_uri}" alt="記事画像">
      <div>
        <h2>{$pickup.title}</h2>
        <div>
          <span>{$pickup.created_at|date_format:"%Y.%m.%d"}</span>
          <div>
            {foreach $group_list as $group}
            {if $pickup.group_id == $group.id}
            <span>{$group.name}</span>
            {break}
            {/if}
            {/foreach}
            {foreach $category_list as $category}
            {if $pickup.category_id == $category.id}
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
{/block}
