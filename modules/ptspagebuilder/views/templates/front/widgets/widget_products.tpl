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
<div class="widget widget-products {$addition_cls} {if isset($stylecls)&&$stylecls}block-{$stylecls}{else}block-borderbox{/if} block {if $banner_imagefile && $bannerurl || $description}nopadding-left{/if}">
	{if isset($widget_heading)&&!empty($widget_heading)}
		<h4 class="title_block">
			{$widget_heading}
		</h4>
	{/if}
	<div class="widget-inner block_content">	
		<div class="row">
			{if $banner_imagefile && $bannerurl || $description}
			 	<div class="banner-product hidden-xs hidden-sm col-xs-12 col-sm-12 col-md-3">
			 		{if $banner_imagefile && $bannerurl || $description}
						<img src="{$bannerurl}" alt="">
					{/if}
					{if $description}
						<span class="sub_title">
							{$description}
						</span>
					{/if}
				</div>
			{/if}
			<div class="col-xs-12 col-sm-12 col-md-{if $banner_imagefile && $bannerurl || $description}9{else}12{/if}">
				{if isset($products) AND $products}
			 		{$tabname=rand()+count($products)}
					{$scolumn=floor(12/$column)}			
					{include file="{$product_tpl}" products=$products scolumn=$scolumn}
				{/if}
			</div>
		</div>
	</div>
</div>
{/if}