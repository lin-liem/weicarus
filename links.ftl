<#include "layout/layout.ftl">
<#include "layout/common/article.ftl">
<@layout type="urlNav" title="网址收藏 - ${options.blog_title!}" keywords="${options.seo_keywords!}" description="${options.seo_description!}" canonical="${context!}/links">
    <#include "layout/widget/links.ftl">
</@layout>