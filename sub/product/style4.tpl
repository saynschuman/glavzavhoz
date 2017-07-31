	<div class="product-block {if Configuration::get('PTS_CP_PRODUCT_LAYOUT') == 'gallery'}product-gallery{elseif Configuration::get('PTS_CP_PRODUCT_LAYOUT') == 'swap'}product-swap{/if}" itemscope="" itemtype="http://schema.org/Product"><div class="product-container">
	    {hook h='displayProductListGallery' product=$product}
			<div class="product-image-container image">
				<a class="img product_img_link"	href="{$product.link|escape:'html':'UTF-8'}" title="{$product.name|escape:'html':'UTF-8'}" itemprop="url">
					<img class="replace-2x img-responsive pts-image" src="{$link->getImageLink($product.link_rewrite, $product.id_image, 'home_default')|escape:'html':'UTF-8'}" alt="{if !empty($product.legend)}{$product.legend|escape:'html':'UTF-8'}{else}{$product.name|escape:'html':'UTF-8'}{/if}" title="{if !empty($product.legend)}{$product.legend|escape:'html':'UTF-8'}{else}{$product.name|escape:'html':'UTF-8'}{/if}" {if isset($homeSize)} width="{$homeSize.width}" height="{$homeSize.height}"{/if} itemprop="image" />
				</a>

				{hook h='displayProductListSwap' product=$product}

				{if isset($product.new) && $product.new == 1}
					<a class="product-label new-box" href="{$product.link|escape:'html':'UTF-8'}">
						<span class="new-label">{l s='New'}</span>
					</a>
				{/if}
				{if isset($product.on_sale) && $product.on_sale && isset($product.show_price) && $product.show_price && !$PS_CATALOG_MODE}
					<a class="product-label sale-box" href="{$product.link|escape:'html':'UTF-8'}">
						<span class="sale-label">{l s='Sale!'}</span>
					</a>
				{/if}
				
				{hook h="displayProductDeliveryTime" product=$product}
				{hook h="displayProductPriceBlock" product=$product type="weight"}

				
				<div class="action-btn">
					{if ($product.id_product_attribute == 0 || (isset($add_prod_display) && ($add_prod_display == 1))) && $product.available_for_order && !isset($restricted_country_mode) && $product.minimal_quantity <= 1 && $product.customizable != 2 && !$PS_CATALOG_MODE}
						{if ($product.allow_oosp || $product.quantity > 0)}
							{if isset($static_token)}
								<div class="addtocart cart"><a  class="btn btn-shopping-cart btn-outline ajax_add_to_cart_button" href="{$link->getPageLink('cart',false, NULL, "add=1&amp;id_product={$product.id_product|intval}&amp;token={$static_token}", false)|escape:'html':'UTF-8'}" rel="nofollow" title="{l s='Add to cart'}" data-id-product="{$product.id_product|intval}">
									<i class="icon-shopping-cart"></i>
									<!-- <span>{l s='Add to cart'}</span> -->
								</a></div>
							{else}
								<div class="addtocart cart"><a  class="btn btn-shopping-cart btn-outline ajax_add_to_cart_button" href="{$link->getPageLink('cart',false, NULL, 'add=1&amp;id_product={$product.id_product|intval}', false)|escape:'html':'UTF-8'}" rel="nofollow" title="{l s='Add to cart'}" data-id-product="{$product.id_product|intval}">
									<i class="icon-shopping-cart"></i>
									<!-- <span>{l s='Add to cart'}</span> -->
								</a></div>
							{/if}						
						{else}
							<div class="addtocart cart"><span  class="btn btn-shopping-cart btn-outline ajax_add_to_cart_button disabled">
								<i class="icon-shopping-cart"></i>
								<!-- <span>{l s='Add to cart'}</span> -->
							</span></div>
						{/if}
					{/if}
				</div>

				<div class="right">
					<div class="action">
						{if isset($quick_view) && $quick_view}
							<div class="quickview"><a class="quick-view pts-colorbox btn btn-highlighted cboxElement" href="{$product.link|escape:'html':'UTF-8'}" rel="{$product.link|escape:'html':'UTF-8'}" title="{l s='Quick View'}">
								<i class="icon-eye"></i>
								<span>{l s='Quick view'}</span>
							</a></div>
						{/if}
						{if isset($comparator_max_item) && $comparator_max_item}
							<div class="compare"><a class="btn btn-highlighted add_to_compare" href="{$product.link|escape:'html':'UTF-8'}" data-id-product="{$product.id_product}" title="{l s='Compare'}">
								<i class="icon icon-retweet"></i><span>{l s='Compare'}</span></a>
							</div>
						{/if}	
						{hook h='displayProductListFunctionalButtons' product=$product}
					</div>
				</div>
			</div>
			<div class="product-meta">		
				<div class="left">
					<h3 class="name" itemprop="name">
						{if isset($product.pack_quantity) && $product.pack_quantity}{$product.pack_quantity|intval|cat:' x '}{/if}
						<a href="{$product.link|escape:'html':'UTF-8'}" title="{$product.name|escape:'html':'UTF-8'}" itemprop="url" >
							{$product.name|truncate:30:'...'|escape:'html':'UTF-8'}
						</a>
					</h3>

					{if (!$PS_CATALOG_MODE AND ((isset($product.show_price) && $product.show_price) || (isset($product.available_for_order) && $product.available_for_order)))}
						<div itemprop="offers" itemscope="" itemtype="http://schema.org/Offer" class="content_price price">

							{if isset($product.show_price) && $product.show_price && !isset($restricted_country_mode)}
								<span itemprop="price" class="product-price {if isset($product.specific_prices) && $product.specific_prices && isset($product.specific_prices.reduction) && $product.specific_prices.reduction > 0}new-price{/if}">
									{if !$priceDisplay}{convertPrice price=$product.price}{else}{convertPrice price=$product.price_tax_exc}{/if}
								</span>
								<meta itemprop="priceCurrency" content="{$priceDisplay}" />
								{if isset($product.specific_prices) && $product.specific_prices && isset($product.specific_prices.reduction) && $product.specific_prices.reduction > 0}
								<span class="old-price">
										{displayWtPrice p=$product.price_without_reduction}
									</span>
									{if $product.specific_prices.reduction_type == 'percentage'}
									<span class="content_price_percent sale-percent-box" itemprop="offers" itemscope="" itemtype="http://schema.org/Offer">
										<span class="price-percent-reduction">-{$product.specific_prices.reduction * 100}%</span>
									</span>
									{/if}
								{/if}
							{/if}
						</div>
					{/if}
					<div class="product-desc description" itemprop="description">
						{$product.description_short|strip_tags:'UTF-8'|truncate:200:'...'}
					</div>

					<div class="product-flags">
						{if (!$PS_CATALOG_MODE AND ((isset($product.show_price) && $product.show_price) || (isset($product.available_for_order) && $product.available_for_order)))}
							{if isset($product.online_only) && $product.online_only}
								<span class="online_only">{l s='Online only'}</span>
							{/if}
						{/if}
						{if isset($product.on_sale) && $product.on_sale && isset($product.show_price) && $product.show_price && !$PS_CATALOG_MODE}
							{elseif isset($product.reduction) && $product.reduction && isset($product.show_price) && $product.show_price && !$PS_CATALOG_MODE}
								<span class="discount">{l s='Reduced price!'}</span>
						{/if}
					</div>
					{if (!$PS_CATALOG_MODE && $PS_STOCK_MANAGEMENT && ((isset($product.show_price) && $product.show_price) || (isset($product.available_for_order) && $product.available_for_order)))}
						{if isset($product.available_for_order) && $product.available_for_order && !isset($restricted_country_mode)}
							<span class="availability">
								{if ($product.allow_oosp || $product.quantity > 0)}
									<span class="{if $product.quantity <= 0 && isset($product.allow_oosp) && !$product.allow_oosp} label-danger{elseif $product.quantity <= 0} label-warning{else} label-success{/if}">
										{if $product.quantity <= 0}{if $product.allow_oosp}{if isset($product.available_later) && $product.available_later}{$product.available_later}{else}{l s='In Stock'}{/if}{else}{l s='Out of stock'}{/if}{else}{if isset($product.available_now) && $product.available_now}{$product.available_now}{else}{l s='In Stock'}{/if}{/if}
									</span>
								{elseif (isset($product.quantity_all_versions) && $product.quantity_all_versions > 0)}
									<span class="label-warning">
										{l s='Product available with different options'}
									</span>
								{else}
									<span class="label-danger">
										{l s='Out of stock'}
									</span>
								{/if}
							</span>
						{/if}
					{/if}
					{if isset($tabname) && $tabname != ptsblockrelatedproducts}
						{hook h='displayProductListReviews' product=$product}
					{/if}
					{if isset($product.color_list)}
						<div class="color-list-container product-colors">{$product.color_list} </div>
					{/if}
				</div>
			</div>
		</div><!-- .product-container> -->
	</div>
<script type="text/javascript">
	$("a.pts-fancybox").fancybox();
</script>