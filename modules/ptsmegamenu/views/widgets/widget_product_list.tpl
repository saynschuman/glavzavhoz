 {if isset($products) && !empty($products)}
<div class="widget-products">
	{if isset($widget_heading)&&!empty($widget_heading)}
	<div class="widget-heading title_block">
		{$widget_heading}
	</div>
	{/if}
	<div class="widget-inner block_content">
		
		{if isset($products) AND $products}
		<ul class="products-block row">
			{assign var='liHeight' value=140}
			{assign var='nbItemsPerLine' value=1}
			{assign var='nbLi' value=$limit}
			{math equation="nbLi/$nbItemsPerLine" nbLi=12  assign=cols_lg}

			{foreach from=$products item=product name=homeFeaturedProducts}
				{math equation="(total%perLine)" total=$smarty.foreach.homeFeaturedProducts.total perLine=$nbItemsPerLine assign=totModulo}
				{if $totModulo == 0}{assign var='totModulo' value=$nbItemsPerLine}{/if}
				<li class="w-product pull-left col-lg-{$cols_lg} col-md-{$cols_lg} col-sm-{$cols_lg} col-xs-12">
					<div class="product-block clearfix" >
							<div class="product-container media" itemscope="" itemtype="http://schema.org/Product">
								<div class="product-image-container image pull-left">
									<a class="img product_img_link"	href="{$product.link|escape:'html':'UTF-8'}" title="{$product.name|escape:'html':'UTF-8'}" itemprop="url">
										<img class="replace-2x img-responsive" src="{$link->getImageLink($product.link_rewrite, $product.id_image, 'small_default')|escape:'html':'UTF-8'}" alt="{if !empty($product.legend)}{$product.legend|escape:'html':'UTF-8'}{else}{$product.name|escape:'html':'UTF-8'}{/if}" />
									</a>
											
								</div>
								<div class="media-body">
					                <div class="product-content">
					                    <h4 class="name media-heading" itemprop="name">
					                       {if isset($product.pack_quantity) && $product.pack_quantity}{$product.pack_quantity|intval|cat:' x '}{/if}
												<a href="{$product.link|escape:'html':'UTF-8'}" title="{$product.name|escape:'html':'UTF-8'}" itemprop="url" >
													{$product.name|truncate:45:'...'|escape:'html':'UTF-8'}
												</a>
					                    </h4>

					                    {if (!$PS_CATALOG_MODE AND ((isset($product.show_price) && $product.show_price) || (isset($product.available_for_order) && $product.available_for_order)))}
											<div itemprop="offers" itemscope="" itemtype="http://schema.org/Offer" class="content_price price">
												{if isset($product.show_price) && $product.show_price && !isset($restricted_country_mode)}
													<span itemprop="price" class="product-price">
														{if !$priceDisplay}{convertPrice price=$product.price}{else}{convertPrice price=$product.price_tax_exc}{/if}
													</span>
													{if isset($product.specific_prices) && $product.specific_prices && isset($product.specific_prices.reduction) && $product.specific_prices.reduction > 0}
														<span class="old-price">
															{displayWtPrice p=$product.price_without_reduction}
														</span>
														
													{/if}
													<meta itemprop="priceCurrency" content="{$priceDisplay}" />								
												{/if}
											</div>
										{/if}
					                    <!-- {hook h='displayProductListReviews' product=$product} -->
					                    <!-- <p class="product-description description">{$product.description_short|strip_tags:'UTF-8'|truncate:75:'...'}</p> -->
					                </div>
					            </div>
											
							</div><!-- .product-container> -->
						</div>	
				</li>				
			{/foreach}
		</ul>
		{/if}
	</div>
</div>
{/if}