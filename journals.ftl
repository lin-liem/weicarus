<!-- 日志界面 -->
<#include "layout/layout.ftl">
<@layout type="journals" title="日志 - ${options.blog_title!}" keywords="${options.seo_keywords!}" description="${options.seo_description!}" canonical="${context!}/links">
    <#include "layout/widget/journals.ftl">
</@layout>
