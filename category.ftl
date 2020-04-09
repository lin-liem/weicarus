<#include "layout/layout.ftl">
<#include "layout/common/article.ftl">
<@layout type="category" title="分类：${category.name!} - ${options.blog_title!}" keywords="${options.seo_keywords!}" description="${options.seo_description!}" canonical="${context!}/categories/${category.slugName!}">
    <#include "layout/category.ftl">
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