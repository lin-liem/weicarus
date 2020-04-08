<style> 
    html { 
        -webkit-filter: grayscale(100%); 
        -moz-filter: grayscale(100%); 
        -ms-filter: grayscale(100%); 
        -o-filter: grayscale(100%); 
        filter:progid:DXImageTransform.Microsoft.BasicImage(grayscale=1);  
        _filter:none; 
    } 
</style> 
<script src="//cdn.jsdelivr.net/npm/jquery@3.3.1/dist/jquery.min.js"></script>
  	<script>
      $(function(){ 
        // 根据标签来定义轮播图和轮播附图显示 Ajax加载
        //setBannerShow('tags/lunboliebiao/page/1')
        setBannerShow('tags/lunbofutu/page/1') 
        function setBannerShow(tagValue) {
          	var url = '${canonical!}';
            $.ajax({
                type: "GET",
                url: url.concat(tagValue),
                success: function (datas) {
                    var article = $(datas).find(".column-main").find('.article-list');
                    $.each(article, function(index, data){
                        var title = $(data).find('.article .title .has-link-black-ter').text();
                        var fullPath = $(data).find('.article .title .has-link-black-ter').attr('href');
                        var thumbnail = $(data).find('.article .card-image img').attr('src');
						var html = '<li>';
                        html += '<a href="'+fullPath+'" target="_blank">';
                        html += '<img src="'+thumbnail+'" alt="'+title+'">';
                        html += '<div class="intro">'+title+'</div>';
                        html += '</a>';
                        html += '</li>';
                      	$('#hwslider ul').append(html);
                      
                        <#--
                        var html = `<li>`;
                        html += `<a href="${fullPath}" target="_blank">`;
                        html += `<img src="${thumbnail}" alt="${title}">`;
                        html += `<div class="intro">${title}</div>`;
                        html += `</a>`;
                        html += `</li>`;
                        -->
                    });
                }
            });
        }
        
});
    </script> 