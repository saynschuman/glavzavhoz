<div class="product-block-bg"></div><!--  /.product-block-bg -->

<div class="product-block {if Configuration::get('PTS_CP_PRODUCT_LAYOUT') == 'gallery' }swap-gallery{/if} clearfix" itemscope itemtype="http://schema.org/Product">
	<div class="product-container">
		<div class="left-block">
			{hook h='displayProductListGallery' product=$product}
			<div class="product-image-container image">
				<a class="img product_img_link"	href="{$product.link|escape:'html':'UTF-8'}" itemprop="url">
					<img class="replace-2x img-responsive pts-image" src="{$link->getImageLink($product.link_rewrite, $product.id_image, 'home_default')|escape:'html':'UTF-8'}" itemprop="image" />
				</a>
				{hook h='displayProductListSwap' product=$product}

				{if isset($product.color_list)}
					<div class="color-list-container product-colors">{$product.color_list}</div>
				{/if}
				{if isset($product.new) && $product.new == 1}
					<span class="product-label new-box">
						<span class="new-label">{l s='New'}</span>
					</span>
				{/if}
				{if isset($product.on_sale) && $product.on_sale && isset($product.show_price) && $product.show_price && !$PS_CATALOG_MODE}
					<span class="product-label sale-box">
						<span class="sale-label">{l s='Sale!'}</span>
					</span>
				{/if}
			</div>
			{if isset($product.is_virtual) && !$product.is_virtual}{hook h="displayProductDeliveryTime" product=$product}{/if}
			{hook h="displayProductPriceBlock" product=$product type="weight"}
		</div>
		<div class="right-block right-block_none">
			<div class="product-meta">
				<p class="name" itemprop="name">
					{if isset($product.pack_quantity) && $product.pack_quantity}{$product.pack_quantity|intval|cat:' x '}{/if}
					<a class="product-name" href="{$product.link|escape:'html':'UTF-8'}" itemprop="url">{$product.name|truncate:87:'...'|escape:'html':'UTF-8'}</a>
				</p>

				<div class="product-box product-box_info">
					{if $page_name != product }
						{hook h='displayProductListReviews' product=$product}
					{/if}
					{if (!$PS_CATALOG_MODE && $PS_STOCK_MANAGEMENT && ((isset($product.show_price) && $product.show_price) || (isset($product.available_for_order) && $product.available_for_order)))}
						{if isset($product.available_for_order) && $product.available_for_order && !isset($restricted_country_mode)}
									<ul class="star-raiting">
										<li><a href=""><i class="fa fa-star" aria-hidden="true"></i></a></li>
										<li><a href=""><i class="fa fa-star" aria-hidden="true"></i></a></li>
										<li><a href=""><i class="fa fa-star" aria-hidden="true"></i></a></li>
										<li><a href=""><i class="fa fa-star gray" aria-hidden="true"></i></a></li>
										<li><a href=""><i class="fa fa-star gray" aria-hidden="true"></i></a></li>
									</ul>							
							<span class="availability js-availability">
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
				</div><!--  /.product-box product-box_info -->

				<div class="product-desc description" itemprop="description">
					{$product.description|strip_tags:'UTF-8'|truncate:150:'...'}
				</div>




				<div class="clearfix product-box product-box_buy flex-rl">
					{if (!$PS_CATALOG_MODE AND ((isset($product.show_price) && $product.show_price) || (isset($product.available_for_order) && $product.available_for_order)))}
						<div itemprop="offers" itemscope itemtype="http://schema.org/Offer" class="content_price price {if isset($product.specific_prices) && $product.specific_prices && isset($product.specific_prices.reduction) && $product.specific_prices.reduction > 0}specific_price{/if}">
							{if isset($product.show_price) && $product.show_price && !isset($restricted_country_mode)}
								<span itemprop="price" class="product-price{if isset($product.specific_prices) && $product.specific_prices} new-price{/if}">
									{hook h="displayProductPriceBlock" product=$product type="before_price"}
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
	                            {hook h="displayProductPriceBlock" product=$product type='after_price'}
							{/if}
						</div>
					{/if}

					{if ($product.id_product_attribute == 0 || (isset($add_prod_display) && ($add_prod_display == 1))) && $product.available_for_order && !isset($restricted_country_mode) && $product.customizable != 2 && !$PS_CATALOG_MODE}
						<div class="addtocart">
							{if (!isset($product.customization_required) || !$product.customization_required) && ($product.allow_oosp || $product.quantity > 0)}
								{capture}add=1&amp;id_product={$product.id_product|intval}{if isset($static_token)}&amp;token={$static_token}{/if}{/capture}
								<button type="button" class="button ajax_add_to_cart_button btn" data-id-product="{$product.id_product|intval}" data-minimal_quantity="{if isset($product.product_attribute_minimal_quantity) && $product.product_attribute_minimal_quantity >= 1}{$product.product_attribute_minimal_quantity|intval}{else}{$product.minimal_quantity|intval}{/if}">
									<span>{l s='Add to cart'}</span>
								</button>
							{else}
								<button type="button" class="button ajax_add_to_cart_button btn disabled" title="{l s='Add to cart'}" href="#">
									<i class="icon icon-cart-plus"></i><span>{l s='Купить'}</span>
								</button>
							{/if}
						</div>
					{/if}
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
			</div>
			<div class="button-container action">
				<div>
					<!--noindex-->
					{hook h='displayProductListFunctionalButtons' product=$product}
					{if isset($comparator_max_item) && $comparator_max_item}
						<div class="compare">
							<button type="button" class="btn add_to_compare" data-toggle="tooltip" data-id-product="{$product.id_product}" title="{l s='Add to Compare'}">
								<i class="icon icon-refresh"></i>
								<span>{l s='Add to Compare'}</span>
							</button>
						</div>
					{/if}
					{*<div class="pts-zoomimage">
						<button type="button"  class="btn btn-zoomimage pts-popup fancybox" data-toggle="tooltip"  title="{l s='Large Image'}"><i class="icon icon-search"></i><span>{l s='Large Image'}</span></button>
					</div>*}

					{if isset($quick_view) && $quick_view}
						<div class="pts-zoomimage">
							<button type="button" class="quick-view btn" data-toggle="tooltip" title="{l s='Быстрый просмотр'}" rel="{$product.link|escape:'html':'UTF-8'}">
								<i class="icon icon-search"></i><span>{l s='Быстрый просмотр'}</span>
							</button>
						</div>
					{/if}
					<!--/noindex-->
				</div>
			</div>

		</div>
	</div><!-- .product-container> -->
</div>
