{extends file="parent:_partials/head.tpl" }

{block name='head_seo'}
  <title>{block name='head_seo_title'}{$page.meta.title}{/block}</title>
  <meta name="description" content="{block name='head_seo_description'}{$page.meta.description}{/block}">
  <meta name="keywords" content="{block name='head_seo_keywords'}{$page.meta.keywords}{/block}">
  {if $page.meta.robots !== 'index'}
    <meta name="robots" content="{$page.meta.robots}">
  {/if}
  <meta name="robots" content="noindex, nofollow">
  {if ($page.meta.robots === 'index' && isset($smarty.get.order)) || ($page.meta.robots === 'index' && isset($smarty.get.q))}
    <meta name="robots" content="none">
  {/if}

  {if $page.canonical}
    <link rel="canonical" href="{$page.canonical}">
  {/if}
  {block name='head_hreflang'}
      {if isset($urls.alternative_langs) && $urls.alternative_langs|count > 1}
      {foreach from=$urls.alternative_langs item=pageUrl key=code}
        <link rel="alternate" href="{$pageUrl}" hreflang="{$code}">
      {/foreach}
      {/if}
  {/block}
  {include file="_partials/microdata-jsonld.tpl"}

  {include file="_partials/pagination-seo.tpl"}

{/block}
