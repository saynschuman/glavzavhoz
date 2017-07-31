{*
* Pts Prestashop Theme Framework for Prestashop 1.6.x
*
* @package   ptspagebuilder
* @version   5.0
* @author    http://www.prestabrain.com
* @copyright Copyright (C) October 2013 prestabrain.com <@emai:prestabrain@gmail.com>
*               <info@prestabrain.com>.All rights reserved.
* @license   GNU General Public License version 2
*}

 {if isset($products) && !empty($products)}
    <div class="widget widget-products {$addition_cls} {if isset($stylecls)&&$stylecls}block-{$stylecls}{/if} block">

    {if isset($widget_heading)&&!empty($widget_heading)}
    <h4 class="title_block">
        {$widget_heading}
    </h4>
    {/if}
    
    <div class="widget-inner block_content">
        {$tabname = "utilproduct_list"}

        {if !empty($products)}
            <div class="util-carousel top-nav-box" id="{$tabname}">
                {foreach from=$products item=product name=products}
                    <div class="pts-product_list">
                        <div class="item">
                            <div class="product-container" itemscope itemtype="http://schema.org/Product">
                                <div class="left-block">
                                    <div class="product-image-container">
                                        {if (!$PS_CATALOG_MODE AND ((isset($product.show_price) && $product.show_price) || (isset($product.available_for_order) && $product.available_for_order)))}
                                            <div class="content_price" itemprop="offers" itemscope itemtype="http://schema.org/Offer">
                                                {if isset($product.show_price) && $product.show_price && !isset($restricted_country_mode)}
                                                    <span itemprop="price" class="price product-price {if isset($product.specific_prices) && $product.specific_prices}new_price{/if}">
                                                            {if !$priceDisplay}{convertPrice price=$product.price}{else}{convertPrice price=$product.price_tax_exc}{/if}
                                                        </span>
                                                    <meta itemprop="priceCurrency" itemscope content="{$priceDisplay}" />
                                                    {if isset($product.specific_prices) && $product.specific_prices && isset($product.specific_prices.reduction) && $product.specific_prices.reduction > 0}
                                                        <span class="old-price product-price">
                                                                {displayWtPrice p=$product.price_without_reduction}
                                                            </span>
                                                        {if $product.specific_prices.reduction_type == 'percentage'}
                                                            <span class="price-percent-reduction">-{$product.specific_prices.reduction * 100}%</span>
                                                        {/if}
                                                    {/if}
                                                {/if}
                                            </div>
                                        {/if}
                                        <a class="product_img_link" href="{$product.link|escape:'html':'UTF-8'}" title="{$product.name|escape:'html':'UTF-8'}" itemprop="url">
                                            <img class="replace-2x img-responsive" src="{$link->getImageLink($product.link_rewrite, $product.id_image, 'home_default')|escape:'html':'UTF-8'}" alt="{if !empty($product.legend)}{$product.legend|escape:'html':'UTF-8'}{else}{$product.name|escape:'html':'UTF-8'}{/if}" title="{if !empty($product.legend)}{$product.legend|escape:'html':'UTF-8'}{else}{$product.name|escape:'html':'UTF-8'}{/if}"  itemprop="image" />
                                        </a>
                                        {if ($product.id_product_attribute == 0 || (isset($add_prod_display) && ($add_prod_display == 1))) && $product.available_for_order && !isset($restricted_country_mode) && $product.minimal_quantity <= 1 && $product.customizable != 2 && !$PS_CATALOG_MODE}
                                            {if ($product.allow_oosp || $product.quantity > 0)}
                                                {if isset($static_token)}
                                                    <a class="btn-tooltip button ajax_add_to_cart_button btn btn-default" href="{$link->getPageLink('cart',false, NULL, "add=1&amp;id_product={$product.id_product|intval}&amp;token={$static_token}", false)|escape:'html':'UTF-8'}" rel="nofollow" title="{l s='Add to cart' mod='ptspagebuilder'}" data-id-product="{$product.id_product|intval}">
                                                        <span>{l s='Add to cart' mod='ptspagebuilder'}</span>
                                                    </a>
                                                {else}
                                                    <a class="btn-tooltip button ajax_add_to_cart_button btn btn-default" href="{$link->getPageLink('cart',false, NULL, 'add=1&amp;id_product={$product.id_product|intval}', false)|escape:'html':'UTF-8'}" rel="nofollow" title="{l s='Add to cart' mod='ptspagebuilder'}" data-id-product="{$product.id_product|intval}">
                                                        <span>{l s='Add to cart' mod='ptspagebuilder'}</span>
                                                    </a>
                                                {/if}
                                            {else}
                                                <span class="btn-tooltip button ajax_add_to_cart_button btn btn-default disabled">
                                                        <span>{l s='Add to cart' mod='ptspagebuilder'}</span>
                                                    </span>
                                            {/if}
                                        {/if}
                                        {if isset($quick_view) && $quick_view}
                                            <a class="btn-tooltip quick-view btn btn btn-default" title="{l s='Quick view' mod='ptspagebuilder'}" href="{$product.link|escape:'html':'UTF-8'}" rel="{$product.link|escape:'html':'UTF-8'}">
                                                <span>{l s='Quick view' mod='ptspagebuilder'}</span>
                                            </a>
                                        {/if}
                                        {if isset($product.new) && $product.new == 1}
                                            <span class="new-box">
                                                    <span class="new-label">{l s='New' mod='ptspagebuilder'}</span>
                                                </span>
                                        {/if}
                                        {if isset($product.on_sale) && $product.on_sale && isset($product.show_price) && $product.show_price && !$PS_CATALOG_MODE}
                                            <span class="sale-box">
                                                    <span class="sale-label">{l s='Sale!' mod='ptspagebuilder'}</span>
                                                </span>
                                        {/if}
                                    </div>
                                </div>
                                <div class="right-block">
                                    <h5 itemprop="name">
                                        {if isset($product.pack_quantity) && $product.pack_quantity}{$product.pack_quantity|intval|cat:' x '}{/if}
                                        <a class="product-name" href="{$product.link|escape:'html':'UTF-8'}" title="{$product.name|escape:'html':'UTF-8'}" itemprop="url" >
                                            {$product.name|truncate:45:'...'|escape:'html':'UTF-8'}
                                        </a>
                                    </h5>
                                </div>
                                <div class="functional-buttons clearfix">
                                    {hook h='displayProductListFunctionalButtons' product=$product}
                                    {if isset($comparator_max_item) && $comparator_max_item}
                                        <div class="compare">
                                            <a class="add_to_compare" href="{$product.link|escape:'html':'UTF-8'}" data-id-product="{$product.id_product}">{l s='Add to Compare' mod='ptspagebuilder'}</a>
                                        </div>
                                    {/if}
                                </div>
                            </div><!-- .product-container> -->
                        </div>
                    </div>
                {/foreach}
            </div>
        {/if}


    </div>
</div>
{/if}

<!-- /MODULE Block ptsutilfeaturedproduct -->
{literal}
<script type="text/javascript">
    $(document).ready(function() {
        $('#{/literal}{$tabname}'{literal}).utilCarousel({
            pagination : false,
            pause: 'hover',
            interval: {/literal}{$utilinterval}{literal},
            autoPlay : {/literal}{if $utilinterval==0}false{else}true{/if}{literal},
            responsiveMode : 'itemWidthRange',
            itemWidthRange : [{/literal}{$utilmin_width}{literal}, {/literal}{$utilmax_width}{literal}],
            navigation : true,
            navigationText : ['<i class="icon-large icon-chevron-left"></i>', '<i class="icon-large icon-chevron-right"></i>']
        });
    });
</script>
{/literal}
