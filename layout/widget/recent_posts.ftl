<div class="card widget">
    <div class="card-content">
        <h3 class="menu-label">
            最新资源
        </h3>
        <@postTag method="latest" top="5">
            <#list posts as post>
                <article class="media">
                    <#if post.thumbnail?? && post.thumbnail!=''>
                        <a href="${post.fullPath!}" class="media-left">
                            <p class="image is-55x55">
                                <img class="thumbnail" src="${post.thumbnail!}" alt="${post.title!}">
                            </p>
                        </a>
                    </#if>
                    <div class="media-content">
                        <div class="content is-clipped">
                            <div><time class="has-text-grey is-size-7 is-uppercase" datetime="${post.createTime!}">${post.createTime?string('yyyy-MM-dd')}</time></div>
                            <a href="${post.fullPath!}" class="title has-link-black-ter is-size-6 has-text-weight-normal overflow-2-hide">${post.title!}</a>
                        </div>
                    </div>
                </article>
            </#list>
        </@postTag>
    </div>
</div>