<ul class="list-unstyled products-block list">
    {foreach from=$products item=product name=myLoop}
        <li class="clearfix">
            <div class="product-block clearfix">
                <div class="product-container media" itemscope itemtype="http://schema.org/Product">
                     <a class="products-block-image pull-left img" href="{$product.link|escape:'html'}" title="{$product.legend|escape:html:'UTF-8'}">
                        <img class="replace-2x img-responsive" src="{$link->getImageLink($product.link_rewrite, $product.id_image, 'small_default')|escape:'html'}" alt="{$product.name|escape:html:'UTF-8'}" />
                     </a>
                    <div class="media-body">
                        <div class="product-content">
                            <h4 class="name media-heading">
                                <a class="product-name" href="{$product.link|escape:'html'}" title="{$product.name|escape:html:'UTF-8'}">
                                     {$product.name|strip_tags|escape:html:'UTF-8'|truncate:40:'...'}</a>
                            </h4>
                            {hook h='displayProductListReviews' product=$product}
                            {if (!$PS_CATALOG_MODE AND ((isset($product.show_price) && $product.show_price) || (isset($product.available_for_order) && $product.available_for_order)))}
                                <div class="content_price price" itemprop="offers" itemscope itemtype="http://schema.org/Offer">
                                    {if isset($product.show_price) && $product.show_price && !isset($restricted_country_mode)}
                                        {hook h="displayProductPriceBlock" product=$product type="price"}
                                        <span itemprop="price" class="product-price {if isset($product.specific_prices) && $product.specific_prices} new-price{/if}">
                                            {if !$priceDisplay}{convertPrice price=$product.price}{else}{convertPrice price=$product.price_tax_exc}{/if}
                                        </span>
                                        {if isset($product.specific_prices) && $product.specific_prices && isset($product.specific_prices.reduction) && $product.specific_prices.reduction > 0}
                                            <span class="old-price product-price">
                                                {displayWtPrice p=$product.price_without_reduction}
                                            </span>
                                        {/if}
                                        <meta itemprop="priceCurrency" content="{$priceDisplay}" />
                                    {/if}
                                </div>
                            {/if}
                            {*<p class="product-description description">{$product.description_short|strip_tags:'UTF-8'|truncate:75:'...'}</p>*}
                        </div>
                    </div>
                </div>
            </div>
        </li>
    {/foreach}
</ul>