<#include "layout/layout.ftl">
<#include "layout/common/article.ftl">
<@layout  type="no" title="${post.title!} - ${blog_title!}" keywords="${options.seo_keywords!},${tagWords!}" description="${post.summary!}"  canonical="${post.fullPath!}">
    <@article post,'page',"post",false />
</@layout>