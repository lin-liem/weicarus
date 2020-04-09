<#import "./slider_list.ftl" as slider_list>
<#import "./slider_tag.ftl" as slider_tag>

<div class="card " style="transition: opacity 0.3s ease-out 0s, transform 0.3s ease-out 0s; opacity: 1; transform-origin: center top;">
	<div class="article">
		<div class="columns is-marginless is-paddingless ">
			<div class="column is-9 is-clipped ">
				<div id="hwslider" class="hwslider">
					<ul>
                       <@slider_list.sliderListMacro/>
					</ul>
				</div>
			</div>
          	<@slider_tag.sliderTagMacro/>
		</div>
	</div>
</div>
