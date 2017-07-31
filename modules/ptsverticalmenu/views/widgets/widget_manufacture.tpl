 <div class="widget-manufacture">
	{if isset($widget_heading)&&!empty($widget_heading)}
	<div class="widget-heading widget-title">
		{$widget_heading}
	</div>
	{/if}
	<div class="widget-inner">
		<div class="row">
			{foreach from=$manufacturers item=manufacturer name=manufacturers}
				<div class="col-xs-12 col-sm-6 col-md-4">
					<div class="manu-logo">
						<a  href="{$link->getmanufacturerLink($manufacturer.id_manufacturer, $manufacturer.link_rewrite)|escape:'html':'UTF-8'}"  title="{l s='view products'}">
							<img src="{$img_manu_dir}{$manufacturer.image|escape:'htmlall':'UTF-8'}-logo_brand.jpg" alt=""/> 
						</a>
					</div>
				</div>
			{/foreach}
		</div>
	</div>
</div>
 