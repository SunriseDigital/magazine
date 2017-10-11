{foreach $latest_articles as $article}
<a href="/magazine/{$article.group_id}/{$article.category_id}/{$article.article_id}">
  <img src="{$article.image_uri}" alt="記事画像">
  <h2>{$article.title|truncate:26:"...":true}</h2>
  <p>{include file="default/magazine/article/`$article.article_id`/outline.tpl"}</p>
  <div>
    <span>{$article.created_at|date_format:"%Y.%m.%d"}</span>
    <div>
    {foreach $magazine_group_list as $group}
      {if $article.group_id == $group.id}
      <span>{$group.name}</span>
      {break}
      {/if}
    {/foreach}
    {foreach $magazine_category_list as $category}
      {if $article.category_id == $category.id}
      {$category.name}
      {break}
      {/if}
    {/foreach}
    </div>
  </div>
</a>
{/foreach}