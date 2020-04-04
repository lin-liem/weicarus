<#include "layout/layout.ftl">
<#include "layout/wiki.ftl">
<@layout type="no" title="${post.title!} - ${options.blog_title!}" keywords="${options.seo_keywords!},${tagWords!}" description="${post.summary!}" canonical="${context!}/wiki/${post.url!}">
	<@wiki post,'page',"post",false />
</@layout>
 