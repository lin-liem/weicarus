<div class="card " style="transition: opacity 0.3s ease-out 0s, transform 0.3s ease-out 0s; opacity: 1; transform-origin: center top;">
	<div class="article">
		<div class="columns is-marginless is-paddingless ">
			<div class="column is-9 is-clipped ">
				<div id="hwslider" class="hwslider">
					<ul>
                      	<#list posts.content as post>
                          	<#-- 轮播图显示5条，后期改为灵活配置 -->
                            <#if post_index <= 4>
                            	<li>
                                    <a href="${post.fullPath!}" target="_blank">
                                        <img src="${post.thumbnail!}" alt="${post.title!}">
                                        <div class="intro">${post.title!}</div>
                                    </a>
                                </li>
                            </#if>
                        </#list>
					</ul>
				</div>
			</div>
			<div class="column is-3 clean-left-padding is-hidden-touch">
				<div class="columns is-multiline">
                  	<#list posts.content as post>
                      	<#if (post_index >= 5 && post_index <= 6)>
                          <div class="banner-height-2 column is-12">
                            <a href="${post.fullPath!}" target="_blank">
                              <img src="${post.thumbnail!}"  alt="${post.title!}" title="${post.title!}">
                            </a>
                          </div>
                        </#if>
                   	</#list>
				</div>
			</div>
			<div class="column is-3 is-hidden-desktop">
				<div class="columns is-mobile">
                  	<#list posts.content as post>
                      	<#if post_index == 5>
                          <div class="banner-height-2 column is-6 clean-right-padding clean-top-padding">
                              <a href="${post.fullPath!}" target="_blank">
                                <img src="${post.thumbnail!}"  alt="${post.title!}" title="${post.title!}">
                              </a>
                          </div>
                        <#elseif post_index == 6>
                          <div class="banner-height-2 column is-6 clean-top-padding">
                              <a href="${post.fullPath!}" target="_blank">
                                <img src="${post.thumbnail!}"  alt="${post.title!}" title="${post.title!}">
                              </a>
                          </div>
                        </#if>
                    </#list>
				</div>
			</div>
		</div>
	</div>
</div>
