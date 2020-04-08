<@linkTag method="listTeams">
	<#if teams?? && teams?size gt 0>
			<div class="card" id="url-show-list">
              <#list teams as item>
				<div class="card-content">
					<h2 class="title is-4" id="${item.team}">${item.team}</h2>
					<div class="columns is-multiline  is-paddingless">
						<#list item.links as link>
							<div class="column is-3">
								<a href="${link.url!}" target="_bank">
                                    <div class="media" title="${link.description!}">
                                        <div class="media-left block-img-vh">
                                            <figure class="image is-24x24">
                                                <img src="${link.logo!}" alt="Placeholder image">
                                            </figure>
                                        </div>
                                        <div class="media-content block-overflow-hide">
                                            <p class="title is-6 has-text-weight-semibold has-text-dark">${link.name!}</p>
                                            <p class="subtitle is-6 has-text-grey one-more-memo">${link.description!}</p>
                                        </div>
                                    </div>
                              	</a>
							</div>
						</#list>
					</div>
				</div>
                </#list>
			</div>
	</#if>
</@linkTag>