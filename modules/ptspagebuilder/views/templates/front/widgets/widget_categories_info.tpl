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
{if $categories_info}
<!-- Block categories module -->
<div id="categories_block_left" class="block block-highlighted nopadding">
	{if isset($widget_heading)&&!empty($widget_heading)}
	<div class="widget-heading title_block">
		{$widget_heading}
	</div>
	{/if}
	{$itemsperpage=3}
	{$tabname="idcategory_info"}
	{$scolumn=4}
	<div class="block_content">
		{if count($categories_info)>$itemsperpage}	 
			<div class="carousel-controls">
			 	<a class="carousel-control left" href="#{$tabname}"   data-slide="prev">&lsaquo;</a>
				<a class="carousel-control right" href="#{$tabname}"  data-slide="next">&rsaquo;</a>
			</div>
		{/if}
		{$mcategories=array_chunk($categories_info, $itemsperpage)}
		{foreach from=$mcategories item=category name=mcategory_name}
			<ul class="category_list row item {if $smarty.foreach.mcategory_name.first}active{/if}">
				{foreach from=$category item=cat name=category_name}
					<li class="ajax_block_product col-xs-12 col-sm-4 col-md-{$scolumn} col-lg-{$scolumn}">
						{if $show_image && $cat.id_image}
		                    <img src="{$link->getCatImageLink($cat.link_rewrite, $cat.id_image, 'medium_default')|escape:'html':'UTF-8'}" alt="{$cat.name|escape:html:'UTF-8'}" /> 
		                {/if}
		                {if $show_title}
		                	<h3>{$cat.name|escape:html:'UTF-8'}</h3>
		                {/if}

		                {if $show_nb_product}
		                	<span>{l s='Products: ' mod='ptspagebuilder'}{$cat.nb_products}</span>
		                {/if}

		                {if $show_description}
		                    <span>{$cat.description|strip_tags:'UTF-8'|truncate:{$limit_description}}</span>
		                {/if}
		                {if $show_sub_category && $cat.subcategories}
		                    <ul>
		                    {foreach from=$cat.subcategories item=subcategory name=subcategory_name}
		                        <li><a href="{$link->getCategoryLink({$subcategory.id_category})|escape:'htmlall':'UTF-8'}" title="{$subcategory.name|escape:'htmlall':'UTF-8'}">{$subcategory.name|escape:'htmlall':'UTF-8'}</a></li>
		                    {/foreach}
		                    </ul>
		                {/if}
		                {if $show_products && $cat.products}
		                    <div class="widget-inner block_content">
						 		{$tabname=rand()+count($cat.products)}
								{$scolumn=floor(12/$column)}
								{include file="{$product_tpl}" products=$cat.products scolumn=$scolumn}
							</div>
		                {/if}
					</li>
				{/foreach}
			</ul>
		{/foreach}
	</div>
</div>
<!-- /Block categories module -->
{/if}
