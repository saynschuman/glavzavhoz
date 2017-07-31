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
{if !empty($products)}
	{*define numbers of product per line in other page for desktop*}
	{if $page_name !='index' && $page_name !='product'}
		{assign var='nbItemsPerLineTablet' value=2}
		{assign var='nbItemsPerLineMobile' value=3}
	{else}
		{assign var='nbItemsPerLineTablet' value=3}
		{assign var='nbItemsPerLineMobile' value=2}
	{/if}
	{assign var='nbItemsPerLine' value=12/$scolumn}
	{*define numbers of product per line in other page for tablet*}
	{assign var='nbLi' value=$products|@count}
	{math equation="nbLi/nbItemsPerLine" nbLi=$nbLi nbItemsPerLine=$nbItemsPerLine assign=nbLines}
	{math equation="nbLi/nbItemsPerLineTablet" nbLi=$nbLi nbItemsPerLineTablet=$nbItemsPerLineTablet assign=nbLinesTablet}
<div class="boxcarousel slide" id="{$tabname}">
	{if count($products)>$itemsperpage}
		<div class="carousel-controls">
			<a class="carousel-control carousel-sm radius-x left" href="#{$tabname}" data-slide="prev"><span class="icon-prev"></span></a>
			<a class="carousel-control carousel-sm radius-x right" href="#{$tabname}" data-slide="next"><span class="icon-next"></span></a>
        </div>
	{/if}
	<div class="carousel-inner ptsproductcountdown">
	{$mproducts=array_chunk($products,$itemsperpage)}
	{foreach from=$mproducts item=products name=mypLoop}
			<!-- Products list -->
			<ul{if isset($id) && $id} id="{$id}"{/if} class="product_list products-block grid default  row{if isset($class) && $class} {$class}{/if}{if isset($active) && $active == 1} active{/if} item {if $smarty.foreach.mypLoop.first}active{/if}">
			{foreach from=$products item=product name=products}
				{math equation="(total%perLine)" total=$smarty.foreach.products.total perLine=$nbItemsPerLine assign=totModulo}
				{math equation="(total%perLineT)" total=$smarty.foreach.products.total perLineT=$nbItemsPerLineTablet assign=totModuloTablet}
				{math equation="(total%perLineT)" total=$smarty.foreach.products.total perLineT=$nbItemsPerLineMobile assign=totModuloMobile}
				{if $totModulo == 0}{assign var='totModulo' value=$nbItemsPerLine}{/if}
				{if $totModuloTablet == 0}{assign var='totModuloTablet' value=$nbItemsPerLineTablet}{/if}
				{if $totModuloMobile == 0}{assign var='totModuloMobile' value=$nbItemsPerLineMobile}{/if}
				<li class="ajax_block_product col-xs-12 col-sm-12 col-md-{$scolumn} {if $smarty.foreach.products.iteration%$nbItemsPerLine == 0} last-in-line{elseif $smarty.foreach.products.iteration%$nbItemsPerLine == 1} first-in-line{/if}{if $smarty.foreach.products.iteration > ($smarty.foreach.products.total - $totModulo)} last-line{/if}{if $smarty.foreach.products.iteration%$nbItemsPerLineTablet == 0} last-item-of-tablet-line{elseif $smarty.foreach.products.iteration%$nbItemsPerLineTablet == 1} first-item-of-tablet-line{/if}{if $smarty.foreach.products.iteration%$nbItemsPerLineMobile == 0} last-item-of-mobile-line{elseif $smarty.foreach.products.iteration%$nbItemsPerLineMobile == 1} first-item-of-mobile-line{/if}{if $smarty.foreach.products.iteration > ($smarty.foreach.products.total - $totModuloMobile)} last-mobile-line{/if}">
					{if isset($product_style) && !empty($product_style)}
						{include file="$tpl_dir./sub/product/{$product_style}.tpl" product=$product class=''}
					{/if}
					<div class="pts-countdown-{$product.id_product} pts-countdown item-countdown">
                        {if $product.js == 'unlimited'}<div class="lof-labelexpired">{l s='Unlimited' mod='ptspagebuilder'}</div>{/if}
                    </div>
                    {if $product.js != 'unlimited'}	
                        <script type="text/javascript">
                            {literal}
                            jQuery(document).ready(function($){{/literal}
                                $(".pts-countdown-{$product.id_product}").lofCountDown({literal}{{/literal}
                                    TargetDate:"{$product.js.month}/{$product.js.day}/{$product.js.year} {$product.js.hour}:{$product.js.minute}:{$product.js.seconds}",
                                    DisplayFormat:"<ul><li><div class=\"countdown_num\">%%D%% </div><div>{l s='Days' mod='ptspagebuilder'}</div></li><li><div class=\"countdown_num\">%%H%% </div><div>{l s='Hrs' mod='ptspagebuilder'}</div></li><li><div class=\"countdown_num\">%%M%%</div> <div>{l s='Mins' mod='ptspagebuilder'}</div></li><li><div class=\"countdown_num\">%%S%%</div><div> {l s='Secs' mod='ptspagebuilder'}</div></li></ul>",
                                    FinishMessage: "{$product.finish}"
                                {literal}
                                });
                            });
                            {/literal}
                        </script>
                    {/if}				
				</li>
			{/foreach}
			</ul>	
	{/foreach}
	</div>
</div>
{/if}