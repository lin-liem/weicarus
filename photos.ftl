<#-- 相册界面 -->
<#include "layout/layout-navbar.ftl">
<@layout type="photos" title="个人相册 - ${options.blog_title!}" keywords="${options.seo_keywords!}" description="${options.seo_description!}" canonical="${context!}/links">
  <#include "layout/widget/photos.ftl">
</@layout>



