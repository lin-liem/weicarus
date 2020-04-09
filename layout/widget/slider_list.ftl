<#macro sliderListMacro>
<@tagTag method="list">
  <#list tags as tag>
    <#if (settings.slider_main_tag!'lunbobiaoqian') == tag.slug >
      <@postTag method="listByTagId" tagId="${tag.id}">
        <#list posts as post>
          <li>
            <a href="${post.fullPath!}" target="_blank">
              <img src="${post.thumbnail!}" alt="${post.title!}">
              <div class="intro">${post.title!}</div>
            </a>
          </li>
          </#list>
        </@postTag>
      </#if>
    </#list>
</@tagTag>
</#macro> 