 {if isset($products) && !empty($products)}
<div class="widget-products">
	{if isset($widget_heading)&&!empty($widget_heading)}
	<div class="widget-heading widget-title">
		{$widget_heading}
	</div>
	{/if}
	<div class="widget-inner clearfix">
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
								</a>
							</div>
							<div class="product-meta">
								<h4 class="name"><a href="{$product.link|escape:'html':'UTF-8'}" title="{$product.name|truncate:50:'...'|escape:'htmlall':'UTF-8'}">{$product.name|truncate:35:'...'|escape:'htmlall':'UTF-8'}</a></h4>
								{if (!$PS_CATALOG_MODE AND ((isset($product.show_price) && $product.show_price) || (isset($product.available_for_order) && $product.available_for_order)))}
									<div itemprop="offers" itemscope itemtype="http://schema.org/Offer" class="content_price price {if isset($product.specific_prices) && $product.specific_prices && isset($product.specific_prices.reduction) && $product.specific_prices.reduction > 0}specific_price{/if}">
										{if isset($product.show_price) && $product.show_price && !isset($restricted_country_mode)}
											<span itemprop="price" class="product-price{if isset($product.specific_prices) && $product.specific_prices} new-price{/if}">
												{if !$priceDisplay}{convertPrice price=$product.price}{else}{convertPrice price=$product.price_tax_exc}{/if}
											</span>
											<meta itemprop="priceCurrency" content="{$currency->iso_code}" />
											{if isset($product.specific_prices) && $product.specific_prices && isset($product.specific_prices.reduction) && $product.specific_prices.reduction > 0}
												{hook h="displayProductPriceBlock" product=$product type="old_price"}
												<span class="old-price product-price">
													{displayWtPrice p=$product.price_without_reduction}
												</span>
											{/if}
											{hook h="displayProductPriceBlock" product=$product type="price"}
											{hook h="displayProductPriceBlock" product=$product type="unit_price"}
										{/if}
									</div>
								{/if}
							</div>
						</div>
					</div>
				{/foreach}
		{/if}
	</div>
</div>
{/if}