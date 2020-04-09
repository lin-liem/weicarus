<#macro sliderTagMacro>
<@tagTag method="list">
	<#list tags as tag>
      	<#if (settings.slider_right_tag!'lunbofutu') == tag.slug >
       		<@postTag method="listByTagId" tagId="${tag.id}">
              	<div class="column is-3 clean-left-padding is-hidden-touch">
                    <div class="columns is-multiline">
                        <#list posts as post>
                            <div class="banner-height-2 column is-12">
                                <a href="${post.fullPath!}" target="_blank">
                                    <img src="${post.thumbnail!}"  alt="${post.title!}" title="${post.title!}">
                                </a>
                            </div>
                        </#list>
                    </div>
                </div>
                <div class="column is-3 is-hidden-desktop">
                    <div class="columns is-mobile">
                        <#list posts as post>
                          	<#-- 0，取第1条 -->
                            <#if post_index == 0>
                              <div class="banner-height-2 column is-6 clean-right-padding clean-top-padding">
                                  <a href="${post.fullPath!}" target="_blank">
                                    <img src="${post.thumbnail!}"  alt="${post.title!}" title="${post.title!}">
                                  </a>
                              </div>
                            <#-- 1，取第2条 -->
                            <#elseif post_index == 1>
                              <div class="banner-height-2 column is-6 clean-top-padding">
                                  <a href="${post.fullPath!}" target="_blank">
                                    <img src="${post.thumbnail!}"  alt="${post.title!}" title="${post.title!}">
                                  </a>
                              </div>
                            </#if>
                        </#list>
                    </div>
                </div>
        	</@postTag>
        </#if>
  	</#list>
</@tagTag>
</#macro> 
			