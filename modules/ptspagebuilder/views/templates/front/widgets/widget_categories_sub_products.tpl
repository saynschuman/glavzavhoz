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
{if isset($objCategory) && $objCategory}
<div class="block {$addition_cls} {if isset($stylecls)&&$stylecls}block-{$stylecls}{else}block-borderbox{/if}">
	
	<div class="widget-heading title_block">
		{if isset($widget_heading)&&!empty($widget_heading)}
			{$widget_heading}
		{else}
			{$objCategory->name}
		{/if}
		{if $subcategories}
			<ul class="subcategories">
			{foreach $subcategories as $subcategory}
				<li>
					<a href="{$link->getCategoryLink($subcategory.id_category, $subcategory.link_rewrite)|escape:'html':'UTF-8'}" title="{$subcategory.name|escape:'html':'UTF-8'}">
					{$subcategory.name}
					</a>
				</li>
			{/foreach}
			</ul>
		{/if}
		<a href="{$link->getCategoryLink($objCategory->id, $objCategory->link_rewrite)|escape:'html':'UTF-8'}" title="{$objCategory->name|escape:'html':'UTF-8'}">
			{l s='view more' mod='ptspagebuilder'}
		</a>
	</div>
	<div class="block_content">
		{if isset($imageurl) && $imageurl && ($alignment == 'left' || $alignment == 'top')}
			<div class="pull-{$alignment}">
				<img src="{$imageurl}" alt="{$objCategory->name|escape:'html':'UTF-8'}">
			</div>
		{/if}
		
		{if $display_mode == 'carousel'}
			<div>
				{if $products_block1.type == 'newest'}
					<h3>{l s='New Arrivals' mod='ptspagebuilder'}</h3>
				{elseif $products_block1.type == 'bestseller'}
					<h3>{l s='Bestseller' mod='ptspagebuilder'}</h3>
				{elseif $products_block1.type == 'special'}
					<h3>{l s='Special' mod='ptspagebuilder'}</h3>
				{elseif $products_block1.type == 'toprating'}
					<h3>{l s='Top Rating' mod='ptspagebuilder'}</h3>
				{elseif $products_block1.type == 'mostview'}
					<h3>{l s='Most View' mod='ptspagebuilder'}</h3>
				{/if}
				{if isset($products_block1.products) AND $products_block1.products}
			 		{$tabname=rand()+count($products_block1.products)}

			 		{$column=3}
					{$itemsperpage=3}
					{$scolumn=floor(12/$column)}
					{include file="{$product_tpl}" products=$products_block1.products scolumn=$scolumn}  
				{/if}
			</div>
			<div>
				{if $products_block2.type == 'newest'}
					<h3>{l s='New Arrivals' mod='ptspagebuilder'}</h3>
				{elseif $products_block2.type == 'bestseller'}
					<h3>{l s='Bestseller' mod='ptspagebuilder'}</h3>
				{elseif $products_block2.type == 'special'}
					<h3>{l s='Special' mod='ptspagebuilder'}</h3>
				{elseif $products_block2.type == 'toprating'}
					<h3>{l s='Top Rating' mod='ptspagebuilder'}</h3>
				{elseif $products_block2.type == 'mostview'}
					<h3>{l s='Most View' mod='ptspagebuilder'}</h3>
				{/if}
				{if isset($products_block2.products) AND $products_block2.products}
			 		{$tabname=rand()+count($products_block2.products)}

					{$column=1}
					{$itemsperpage=3}
					{$scolumn=floor(12/$column)}
					{include file="{$product_tpl}" products=$products_block2.products scolumn=$scolumn}  
				{/if}
			</div>
		{else}
			{$key=rand()}
			<ul  class="nav nav-theme clearfix">
				<li class="active">
					<a data-toggle="tab" href="#tab-products1-{$key}">
						{if $products_block1.type == 'newest'}
							<h3>{l s='New Arrivals' mod='ptspagebuilder'}</h3>
						{elseif $products_block1.type == 'bestseller'}
							<h3>{l s='Bestseller' mod='ptspagebuilder'}</h3>
						{elseif $products_block1.type == 'special'}
							<h3>{l s='Special' mod='ptspagebuilder'}</h3>
						{elseif $products_block1.type == 'toprating'}
							<h3>{l s='Top Rating' mod='ptspagebuilder'}</h3>
						{elseif $products_block1.type == 'mostview'}
							<h3>{l s='Most View' mod='ptspagebuilder'}</h3>
						{/if}
					</a>
				</li>
				<li>
					<a data-toggle="tab" href="#tab-products2-{$key}">
						{if $products_block2.type == 'newest'}
							<h3>{l s='New Arrivals' mod='ptspagebuilder'}</h3>
						{elseif $products_block2.type == 'bestseller'}
							<h3>{l s='Bestseller' mod='ptspagebuilder'}</h3>
						{elseif $products_block2.type == 'special'}
							<h3>{l s='Special' mod='ptspagebuilder'}</h3>
						{elseif $products_block2.type == 'toprating'}
							<h3>{l s='Top Rating' mod='ptspagebuilder'}</h3>
						{elseif $products_block2.type == 'mostview'}
							<h3>{l s='Most View' mod='ptspagebuilder'}</h3>
						{/if}
					</a>
				</li>
			</ul>
			<div class="tab-content">
				<div id="tab-products1-{$key}" class="producttab-content tab-pane active">
				{if !empty($products_block1.products)}
					{$tabname="carousel-products1-{$key}"}
			 		{$scolumn=floor(12/$column)}
					{include file="{$product_tpl}" products=$products_block1.products scolumn=$scolumn} 
				{/if}
				</div>
				<div id="tab-products2-{$key}" class="producttab-content tab-pane">
					{if !empty($products_block2.products)}
						{$tabname="carousel-products1-{$key}"}
				 		{$scolumn=floor(12/$column)}
						{include file="{$product_tpl}" products=$products_block2.products scolumn=$scolumn} 
					{/if}
				</div>
				
			</div>
		{/if}
		{if isset($imageurl) && $imageurl && ($alignment == 'right' || $alignment == 'bottom')}
			<div class="pull-{$alignment}">
				<img src="{$imageurl}" alt="{$objCategory->name|escape:'html':'UTF-8'}">
			</div>
		{/if}
	</div>
</div>
{/if}
