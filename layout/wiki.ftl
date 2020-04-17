<#macro wiki post,layout,commentType,index>
	<#include "./comment/comment.ftl">
	<div class="card article-list">
		<div class="card-content article">
			<h1 class="title is-size-3 is-size-4-mobile has-text-weight-normal border-bottom">
				${post.title!}
			</h1>
			<#-- 12布局文章内容 -->
			<div class="content">${post.formatContent!}</div>
			<#-- 文章的详情页面信息 -->
			<div class="article-meta is-size-7 is-uppercase is-overflow-x-auto">
				<p><span class="has-text-grey">编辑小子&nbsp;&nbsp;|&nbsp;&nbsp;${user.nickname!"博主"}</span></p>
				<p><span class="has-text-grey">留言数量&nbsp;&nbsp;|&nbsp;&nbsp;${post.commentCount}次</span></p>	
              	<p><span class="has-text-grey">浏览数量&nbsp;&nbsp;|&nbsp;&nbsp;${post.visits!}次</span></p>
              	<p><time class="has-text-grey" datetime="${post.createTime!}">编辑时间&nbsp;&nbsp;|&nbsp;&nbsp;${post.createTime?string('yyyy-MM-dd
				HH:mm:ss')}</time></p>
			</div>
		</div>
	</div>
	<#if !index>
		<div class="card" id="comment-wrapper">
			<div class="card-content">
				<h3 class="title is-5 has-text-weight-normal">评论</h3>
				<@comment post,"sheet" />
			</div>
		</div>
	</#if>
</#macro>
