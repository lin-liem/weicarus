<@photoTag method="list">
	<#-- 
		<h1>${item.team}</h1>
		<img src="${photo.url}" />
		${photo.id}
		${photo.name} 图片名称
		${photo.description}图片描述信息
		${photo.takeTime}图片上传日期
		${photo.location}图片存储位置
		${photo.thumbnail}图片缩略图地址
		${photo.url}图片链接（访问地址）
		${photo.team} String 图片分组名称
	-->
	<div id="fh5co-main">
		<div id="fh5co-board" data-columns>
			<#list photos as photo>
				<div class="item">
					<div class="animate-box has-text-centered">
						<a href="${photo.url}" class="image-popup fh5co-board-img" title="${photo.name}">
							<img src="${photo.url}" alt="${photo.name}">
						</a>
					</div>
                  	<div class="fh5co-desc">
						<div class="title is-6">${photo.name}</div>	
                      	<div class="subtitle is-6">${photo.description}</div>
                  	</div>
				</div>
			</#list>
		</div>
	</div>
</@photoTag>
