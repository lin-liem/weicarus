<#--日志界面的一项 OK-->
<#if (journals.content)?? && journals.content?size gt 0>
  	<#list journals.content as journal>
        <div class="card">
            <div class="card-content">
                <div class="media">
                    <div class="media-left">
                        <figure class="image is-48x48">
                            <img src="${user.avatar!}" alt="用户头像">
                        </figure>
                    </div>
                    <div class="media-content">
                        <p class="title is-4">${user.nickname!}</p>
                        <p class="subtitle is-6"><@global.timeline datetime=journal.createTime/></p>
                    </div>
                </div>
              <div class="content">${journal.content}</div>
                <nav class="level is-mobile">
                  <!-- Left side -->
                  <div class="level-left">
                    <div class="level-item pointer">
                      <p class="subtitle is-6 has-text-grey">
                        <i class="fas fa-heart"></i>&nbsp;&nbsp;${journal.likes}&nbsp;<span>点赞</span>
                      </p>
                    </div>&nbsp;&nbsp;
                    <div class="level-item comment-btn pointer">
                      <p class="subtitle is-6 has-text-grey">
                        <i class="fas fa-comment"></i>&nbsp;&nbsp;${journal.commentCount}&nbsp;<span>评论</span>
                      </p>
                    </div>&nbsp;&nbsp;
                    <div class="level-item pointer">
                      <p class="subtitle is-6 has-text-grey">
                       <i class="fas fa-share"></i>&nbsp;&nbsp;0&nbsp;<span>转发</span>
                      </p>
                    </div>
                  </div>
           		</nav>
                <div class="journals-comment">
                  <h3 class="title is-5 has-text-weight-normal">评论</h3>
                  <#if !journal.disallowComment!false>
                      <halo-comment id="${journal.id}" type="journal"/>
                  </#if>
                </div>
            </div>
        </div>
	</#list>
	<#if journals.getTotalPages() gt 0>
		<div class="card card-transparent">
			<nav class="pagination is-centered" role="navigation" aria-label="pagination">
				<@paginationTag method="index" page="${journals.number}" total="${journals.totalPages}" display="3">
					<div class="pagination-previous<#if pagination.hasPrev><#else > is-invisible is-hidden-mobile</#if>">
						<a class="is-flex-grow has-text-black-ter" href="${pagination.prevPageFullPath!}">上一页</a>
					</div>
					<div class="pagination-next<#if pagination.hasNext><#else > is-invisible is-hidden-mobile</#if>">
						<a class="is-flex-grow has-text-black-ter" href="${pagination.nextPageFullPath!}">下一页</a>
					</div>
					<ul class="pagination-list is-hidden-mobile">
						<#list pagination.rainbowPages as number>
							<#if number.isCurrent>
								<li><a class="pagination-link is-current" href="${number.fullPath!}">${number.page!}</a></li>
							<#else>
								<li><a class="pagination-link has-text-black-ter" href="${number.fullPath!}">${number.page!}</a></li>
							</#if>
						</#list>
					</ul>
				</@paginationTag>
			</nav>
		</div>
	</#if>
<#else>
     还没有发布过日志，回<a class="font-weight-bold" href="${context!}">主页</a>看看吧
</#if>
 