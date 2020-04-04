<#macro widget position,isShowMenu>
<div class="column is-4-tablet is-4-desktop <#if position=='right'>is-3-widescreen <#else> is-2-widescreen </#if>   <#if position=='right'>is-hidden-touch is-hidden-desktop-only</#if> <#if position == 'left'>has-order-1<#else>has-order-3</#if> column-${position} <%= sticky_class(position) %>">
    <#if position == 'left'> 
        <#if isShowMenu == 'urlNavMenuShow'>
			<#include "../widget/url_menu_tag.ftl">
            <#include "../plugin/show-mobile-menu.ftl">
            <div id="catalog-over-box" ></div>
        <#else>
          	<#if settings.sidebar_categories!true>
                <#include "../widget/category.ftl">
            </#if>
            <#if settings.sidebar_tagcloud!true>
                <#include "../widget/tagcloud.ftl">
            </#if>
            <#if settings.sidebar_links!true>
                <#include "../widget/links.ftl">
            </#if>
            <#if isShowMenu == 'menuShow'>
                <#include "../widget/menu_tag.ftl">
                <#include "../plugin/show-mobile-menu.ftl">
                <div id="catalog-over-box" ></div>
            </#if>
		</#if>
    </#if>
    <#if position == 'right'>
      	<#-- if settings.sidebar_profile!true>
            <#include "../widget/profile.ftl">
        </#if>
          -->
        <#if settings.sidebar_recentpost!true>
            <#include "../widget/recent_posts.ftl">
        </#if>
        <#if settings.sidebar_recentcomment!true>
            <#include "../widget/recent_comments.ftl">
        </#if>
		<#--<#include "../widget/archive.ftl">-->
        <#if settings.sidebar_tags!true>
            <#include "../widget/tag.ftl">
        </#if>
    </#if>
    <#if position == 'left' && isShowMenu != 'urlNavMenuShow'>
        <div class="column-right-shadow is-hidden-widescreen">
            <#if settings.sidebar_recentpost!true>
                <#include "../widget/recent_posts.ftl">
            </#if>
            <#if settings.sidebar_recentcomment!true>
                <#include "../widget/recent_comments.ftl">
            </#if>
			<#--<#include "../widget/archive.ftl">-->
            <#if settings.sidebar_tags!true>
                <#include "../widget/tag.ftl">
            </#if>
        </div>
    </#if>

</div>

</#macro>