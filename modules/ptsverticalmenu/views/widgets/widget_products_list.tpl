{if isset($products) && !empty($products)}
<div class="widget-products">
	{if isset($widget_heading)&&!empty($widget_heading)}
	<div class="widget-heading widget-title">
		{$widget_heading}
	</div>
	{/if}
	<div class="widget-inner">
		{if isset($products) AND $products}
			{assign var='liHeight' value=140}
			{assign var='nbItemsPerLine' value=3}
			{assign var='nbLi' value=$limit}
			{math equation="nbLi/nbItemsPerLine" nbLi=$nbLi nbItemsPerLine=$nbItemsPerLine assign=nbLines}
			{math equation="nbLines*liHeight" nbLines=$nbLines|ceil liHeight=$liHeight assign=ulHeight}
			{$mproducts=array_chunk($products,$limit)}
			{foreach from=$products item=product name=homeFeaturedProducts}
				{math equation="(total%perLine)" total=$smarty.foreach.homeFeaturedProducts.total perLine=$nbItemsPerLine assign=totModulo}
				{if $totModulo == 0}{assign var='totModulo' value=$nbItemsPerLine}{/if}
					<div class="product-block" itemscope itemtype="http://schema.org/Product">
					 	<div class="product-container clearfix">
							<div class="image ">
								<a href="{$product.link|escape:'html':'UTF-8'}" title="{$product.name|escape:html:'UTF-8'}" class="product_image">
									<img class="img-responsive" src="{$link->getImageLink($product.link_rewrite, $product.id_image, 'home_default')}"  alt="{$product.name|escape:html:'UTF-8'}" />
									{if isset($product.new) && $product.new == 1}<span class="new">{l s='New' mod='homefeatured'}</span>{/if}
								</a>
							</div>
							<div class="product-meta">
								<h4 class="name"><a href="{$product.link|escape:'html':'UTF-8'}" title="{$product.name|truncate:50:'...'|escape:'htmlall':'UTF-8'}">{$product.name|truncate:35:'...'|escape:'htmlall':'UTF-8'}</a></h4>
								{if $product.show_price AND !isset($restricted_country_mode) AND !$PS_CATALOG_MODE}
									<p class="price_container"><span class="price">{if !$priceDisplay}{convertPrice price=$product.price}{else}{convertPrice price=$product.price_tax_exc}{/if}</span></p>
								{else}
									<div style="height:21px;"></div>
								{/if}
							</div>
						</div>
					</div>
			{/foreach}
		{/if}
	</div>
</div>
{/if}