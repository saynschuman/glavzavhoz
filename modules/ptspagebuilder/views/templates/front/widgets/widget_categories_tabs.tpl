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
{if $categories_tabs}
<!-- Block categories module -->
<div id="categories_block_left" class="block {$addition_cls} {if isset($stylecls)&&$stylecls}block-{$stylecls}{else}block-borderbox{/if}">
	{if isset($widget_heading)&&!empty($widget_heading)}
	<div class="widget-heading title_block">
		{$widget_heading}
	</div>
	{/if}

	<div class="block_content">
		{if !empty($categories_tabs )}
			<ul id="catProductsTabs" class="nav nav-tabs">
			  {foreach $categories_tabs as $key=>$category}
				<li{if $key == 0} class="active"{/if}>
					<a href="#cattab{$category.category_obj->id}" data-toggle="tab">
						{if $category.category_info && $category.category_info.icon_class}	
							<i class="{$category.category_info.icon_class}"></i>
						{elseif $category.category_info && $category.category_info.icon}
							<img src="{$category.category_info.icon|escape:'htmlall':'UTF-8'}" alt="{$category.category_obj->name|escape:'html':'UTF-8'}">
						{/if}
						{$category.category_obj->name|escape:'html':'UTF-8'}
					</a>
				</li>
			  {/foreach}
			</ul>
		 
			<div id="catProductsTabsContent" class="tab-content">
			 {foreach $categories_tabs as $key=>$category}
				<div class="tab-pane{if $key == 0} active{/if}" id="cattab{$category.category_obj->id}">
					{$products=$category.products}
					{$scolumn=floor(12/$column)}
					{assign var="tabname" value="categoriestabs_{$category.category_obj->id}"} 

					{include file="{$product_tpl}"}
				</div>
			{/foreach}
			</div>
 
		{/if}
	</div>
</div>
<!-- /Block categories module -->
{/if}
