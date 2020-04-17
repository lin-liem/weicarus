<#include "layout/layout-custom.ftl">
<#include "layout/wiki.ftl">
<@layout type="about" title="${post.title!} - ${blog_title!}" keywords="${options.seo_keywords!},${tagWords!}" description="${post.summary!}" canonical="${post.fullPath!}">
	<@wiki post,'page',"post",false />
</@layout>
