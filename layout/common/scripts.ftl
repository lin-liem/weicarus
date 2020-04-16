<script src="//cdn.jsdelivr.net/npm/jquery@3.3.1/dist/jquery.min.js"></script>

<#include "../plugin/gallery.ftl">
<#include "../plugin/outdated-browser.ftl">
<#include "../plugin/mathjax.ftl">
<#include "../plugin/back-to-top.ftl">


<script src="${theme_base!}/source/js/bundle.js"></script>
<script src="${theme_base!}/source/js/common.js"></script>
<script src="${theme_base!}/source/lib/hwslider/js/jquery.hwSlider.min.js"></script>
<script>
    var url = location.href;
    var urlstatus = false;
    $(".navbar-start a").each(function () {
        if ((url + '/').indexOf($(this).attr('href')) > -1 && $(this).attr('href') != '/') {
            $(this).addClass('is-active');
            urlstatus = true;
        } else {
            $(this).removeClass('is-active');
        }
    });
    if (!urlstatus) {
        $(".navbar-start a").eq(0).addClass('is-active');
    }
</script>
  
<#if is_journals?? >
  <script src="//cdn.jsdelivr.net/npm/vue@2.6.10/dist/vue.min.js"></script>
  <script src="//cdn.jsdelivr.net/gh/halo-dev/halo-comment@latest/dist/halo-comment.min.js"></script>
  <script>
       var configs = {
         autoLoad: true,
         showUserAgent: true
       }
  </script>
</#if>

<#if is_archives?? || is_category?? || is_index??>
<script>
    // 判断为手机则不要目录
    if(/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)) {
      console.log('info','完善中...');
    } else{
      // 固定分类 
      $(function() {
        var offSetTop = $("#cate-fixed").offset().top;
        $(window).scroll(function() {
          //获取垂直滚动的距离
          var scrollTop = $(document).scrollTop();
          if (scrollTop >= offSetTop) {
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
</#if>