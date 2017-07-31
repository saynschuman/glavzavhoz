{if !empty($products)}
<div class="boxcarousel slide products_block {if isset($class)} {$class} {/if}" id="{$tabname}">
	{if count($products)>$itemsperpage}
		<div class="carousel-controls">
		 	<a class="carousel-control left" href="#{$tabname}"   data-slide="prev">&lsaquo;</a>
			<a class="carousel-control right" href="#{$tabname}"  data-slide="next">&rsaquo;</a>
		</div>
	{/if}
	<div class="carousel-inner">
	{$mproducts=array_chunk($products,$itemsperpage)}
	{foreach from=$mproducts item=products name=mypLoop}
			<!-- Products list -->
			<div class="{if isset($class) && $class} {$class}{/if}{if isset($active) && $active == 1} active{/if} item {if $smarty.foreach.mypLoop.first}active{/if} ">
				<ul{if isset($id) && $id} id="{$id}"{/if} class=" row clearfix list-unstyled products-block default list2 nopadding">
				{foreach from=$products item=product name=products}
					<li class="ajax_block_product col-xs-12 col-sm-12 col-md-{if (12/$scolumn) == 5}cus-5{else}{$scolumn}{/if} col-lg-{if (12/$scolumn) == 5}cus-5{else}{$scolumn}{/if} {if $smarty.foreach.products.iteration%(12/$scolumn)==0}last-in-line{/if}">
						<div class="product-block clearfix" >
							<div class="product-container media" itemscope="" itemtype="http://schema.org/Product">
								<div class="product-image-container image pull-left">
									<a class="img product_img_link"	href="{$product.link|escape:'html':'UTF-8'}" title="{$product.name|escape:'html':'UTF-8'}" itemprop="url">
										<img class="replace-2x img-responsive" src="{$link->getImageLink($product.link_rewrite, $product.id_image, 'medium_default')|escape:'html':'UTF-8'}" alt="{if !empty($product.legend)}{$product.legend|escape:'html':'UTF-8'}{else}{$product.name|escape:'html':'UTF-8'}{/if}" />
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
					                    {hook h='displayProductListReviews' product=$product}
					                    {if (!$PS_CATALOG_MODE AND ((isset($product.show_price) && $product.show_price) || (isset($product.available_for_order) && $product.available_for_order)))}
											<div itemprop="offers" itemscope="" itemtype="http://schema.org/Offer" class="content_price price">
												{if isset($product.show_price) && $product.show_price && !isset($restricted_country_mode)}
													<span itemprop="price" class="product-price {if isset($product.specific_prices) && $product.specific_prices && isset($product.specific_prices.reduction) && $product.specific_prices.reduction > 0}new-price {/if}">
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
					                </div>
					            </div>
											
							</div><!-- .product-container> -->
						</div>
					</li>
					{if $smarty.foreach.products.iteration%$column==0 && !$smarty.foreach.products.last}
						<li class="clearfix break_line hidden-xs col-xs-12 col-sm-12 col-md-12"><hr /></li>
					{/if}
				{/foreach}
				</ul>
			</div>
	{/foreach}
	</div>
</div>
{addJsDefL name=min_item}{l s='Please select at least one product' js=1}{/addJsDefL}
{addJsDefL name=max_item}{l s='You cannot add more than %d product(s) to the product comparison' sprintf=$comparator_max_item js=1}{/addJsDefL}
{addJsDef comparator_max_item=$comparator_max_item}
{addJsDef comparedProductsIds=$compared_products}
{/if}