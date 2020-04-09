<#include "layout/layout.ftl">
<#include "layout/common/article.ftl">
<@layout type="index" title="${options.blog_title!}" keywords="${options.seo_keywords!}" description="${options.seo_description!}" canonical="${context!}">
  	<#-- 0表示第一页才会显示-->  
  	<#if posts.number == 0>
      <#include "layout/widget/slider.ftl">
    </#if>
  	<#list posts.content as post>
		<@article post,'index','null',true />
    </#list>
    <#if posts.getTotalPages() gt 0>
        <div class="card card-transparent">
            <nav class="pagination is-centered" role="navigation" aria-label="pagination">
                <@paginationTag method="index" page="${posts.number}" total="${posts.totalPages}" display="3">
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
    
</@layout>
<script>
  // 判断为手机则不要目录
if(/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)) {
  console.log('info','完善中...');
} else{
// 固定分类
	$(function() {
      	$(window).scroll(function() {
            //获取垂直滚动的距离
            var scrollTop = $(document).scrollTop();
            if (scrollTop >= 87) {
              var wdh = $("#cate-fixed").width();
              $("#cate-fixed").css("width", wdh);
              $("#cate-fixed").addClass("menu-fixed");
              $("#cate-fixed").css("margin-top", "1.5rem");
            } else {
              $("#cate-fixed").removeClass("menu-fixed");
              $("#cate-fixed").css("margin-top", "0rem");
            }
        });
    });
}  
</script>