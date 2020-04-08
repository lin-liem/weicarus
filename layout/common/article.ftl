<#macro article post,layout,commentType,index>
	<#include "../comment/comment.ftl">
		<div class="card article-list" >
			<div class="card-content article">
				<#if index>
					<h1 class="title is-size-4 is-size-4-mobile has-text-weight-bold is-marginless">
						<a class="has-link-black-ter" href="${post.fullPath!}">${post.title!}</a>
					</h1>
				<#else>
					<h1 class="title is-size-3 is-size-4-mobile has-text-weight-normal">
						${post.title!}
					</h1>
				</#if>
				<#-- 12布局文章内容 -->
				<#if index>
					<div class="columns is-marginless is-paddingless is-mobile">
						<#if post.thumbnail?? && post.thumbnail!=''>
						<div class="column is-9 clean-left-padding">
							<#-- 文章的基本信息 -->
							<div class="level article-meta is-size-7 is-uppercase is-mobile">
								<div class="level-left">
									<#if post.categories?? && post.categories?size gt 0>
									<div class="level-item buttons are-small">
										<#list post.categories as category>
											<a class="button is-primary is-outlined" href="${category.fullPath!}">${category.name!}</a>&nbsp;
										</#list>
									</div>
									</#if>
								</div>
							</div>
							<#-- 文章概要 -->
							<#if post.summary?? && post.summary!=''>
								<div class="content more-content">${post.summary!}</div>
							</#if>
						</div>
						<div class="column is-3 clean-right-padding">
							<div class="card-image">
								<a href="${post.fullPath!}">
									<img class="thumbnail" src="${post.thumbnail!}" alt="${post.title!}">
								</a>
							</div>
						</div>
						<#else>
						<div class="column is-12 clean-left-padding">
							<#-- 文章的基本信息 -->
							<div class="level article-meta is-size-7 is-uppercase is-mobile">
								<div class="level-left">
									<#if post.categories?? && post.categories?size gt 0>
									<div class="level-item buttons are-small">
										<#list post.categories as category>
											<a class="button is-primary is-outlined" href="${category.fullPath!}">${category.name!}</a>&nbsp;
										</#list>
									</div>
									</#if>
								</div>
							</div>
							<#-- 文章概要 -->
							<#if post.summary?? && post.summary!=''>
								<div class="content more-content">${post.summary!}</div>
							</#if>
						</div>
						</#if>
					</div>
				<#else>
					<#-- 文章的详情页面信息 -->
					<div class="level level-left article-meta is-size-7 is-uppercase is-overflow-x-auto">
						<span class="has-text-grey"><i class="fas fa-user mr-2"></i>&nbsp;&nbsp;${user.nickname!"博主"}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						<time class="has-text-grey" datetime="${post.createTime!}"><i class="fas fa-calendar mr-2"></i>&nbsp;&nbsp;${post.createTime?string('yyyy-MM-dd HH:mm:ss')}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</time>
						<span class="has-text-grey"><i class="fas fa-eye mr-2"></i>&nbsp;&nbsp;${post.visits!}次浏览&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						<span class="has-text-grey"><i class="fas fa-comments mr-2"></i>&nbsp;&nbsp;${post.commentCount}次留言</span>
					</div>
					<div class="level article-meta is-size-7 is-uppercase is-mobile">
					    <div class="level-left">
							<#if categories?? && categories?size gt 0>
							<div class="level-item buttons are-small">
								<#list categories as category>
									<a class="button is-primary is-outlined" href="${category.fullPath!}">${category.name!}</a>&nbsp;
								</#list>
							</div>
							</#if>
					    </div>
					</div>
					<div class="content">${post.formatContent!}</div>
					<#if !index && tags?? && (tags?size gt 0)>
					    <div class="level is-size-7 is-uppercase">
					        <div class="level-start">
					            <div class="level-item">
					                <span class="is-size-6 has-text-grey has-mr-7">#</span>
					                <#list tags as tag>
                                      	<a class="has-link-grey -link" href="${tag.fullPath!}">${tag.name!}</a>&nbsp;&nbsp;
					                </#list>
					            </div>
					        </div>
					    </div>
					</#if>
				</#if>
					
				<#if index && post.summary?? && post.summary!=''>
					<div class="level level-left article-meta is-size-7 is-uppercase is-overflow-x-auto">
						<span class="has-text-grey"><i class="fas fa-user mr-2"></i>&nbsp;&nbsp;${user.nickname!"博主"}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						<time class="has-text-grey" datetime="${post.createTime!}"><i class="fas fa-calendar mr-2"></i>&nbsp;&nbsp;${post.createTime?string('yyyy-MM-dd
							HH:mm')}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</time>
						<span class="has-text-grey"><i class="fas fa-eye mr-2"></i>&nbsp;&nbsp;${post.visits!}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						<span class="has-text-grey"><i class="fas fa-comments mr-2"></i>&nbsp;&nbsp;${post.commentCount}</span>
					</div>
				</#if>
				<#if !index && settings.share_type?? && settings.share_type!=''>
					<#include "../share/${settings.share_type}.ftl">
				</#if>
			</div>
		</div>

		<#if !index>
			<#if (settings.donate_alipay?? && settings.donate_alipay!='' ) || (settings.donate_wechat?? &&
			 settings.donate_wechat!='' )>
				<div class="card">
					<div class="card-content">
						<h3 class="menu-label has-text-centered">喜欢这篇文章？打赏一下作者吧</h3>
						<div class="buttons is-centered">
							<#if settings.donate_alipay?? && settings.donate_alipay!=''>
								<#include "../donate/alipay.ftl">
							</#if>
							<#if settings.donate_wechat?? && settings.donate_wechat!=''>
								<#include "../donate/wechat.ftl">
							</#if>
						</div>
					</div>
				</div>
			</#if>
		</#if>

		<#if !index && nextPost?? && prevPost??>
			<div class="card card-transparent">
				<div class="level post-navigation is-flex-wrap is-mobile">
					<#if prevPost??>
						<div class="level-start">
							<a class="level level-item has-link-grey article-nav-prev" href="${prevPost.fullPath!}">
								<i class="level-item fas fa-chevron-left"></i>
								<span class="level-item">${prevPost.title!}</span>
							</a>
						</div>
					</#if>
					<#if nextPost??>
						<div class="level-end">
							<a class="level level-item has-link-grey article-nav-next" href="${nextPost.fullPath!}">
								<span class="level-item">${nextPost.title!}</span>
								<i class="level-item fas fa-chevron-right"></i>
							</a>
						</div>
					</#if>
				</div>
			</div>
		</#if>

		<#if !index>
			<div class="card" id="comment-wrapper">
				<div class="card-content">
					<h3 class="title is-5 has-text-weight-normal">评论</h3>
					<#if commentType=='post'>
						<@comment post,"post" />
						<#else>
						<@comment post,"sheet" />
					</#if>
				</div>
			</div>
		</#if>
</#macro>
