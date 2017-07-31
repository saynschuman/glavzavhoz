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
{if isset($subcategories) && $subcategories}
<div id="subcategories{$wkey}" class="block floor-fixed-panel-play nopadding {$addition_cls} {if isset($stylecls)&&$stylecls}block-{$stylecls}{else}block-borderbox{/if}" {if isset($tab_index) && $tab_index}data-index="{$tab_index}"{/if} data-title="{if isset($widget_heading)}{$widget_heading}{/if}" {if isset($tabicon) && $tabicon}data-icon="{$tabicon}"{/if}>
	<div class="row">
		<div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
			{if isset($widget_heading)&&!empty($widget_heading)}
			<div class="widget-heading title_block">
				<a href="{$link->getCategoryLink($id_parent)|escape:'html':'UTF-8'}" title="{$widget_heading}">
					<span>{$widget_heading}</span>
				</a>
			</div>
			{/if}
			<div class="tab-nav tab-v2 tabs-left">
				<ul class="nav nav-tabs">
					{foreach $subcategories as $key=>$subcategory}
					<li {if $key == 0}class="active"{/if}><a href="#subcategorytab_{$subcategory.id_category}_{$wkey}" title="{$subcategory.name}" data-toggle="tab">{$subcategory.name}</a></li>
					{/foreach}
				</ul>
			</div>
		</div>
		<div class="col-lg-10 col-md-10 col-sm-12 col-xs-12">
			<div class="tab-content">
				{foreach $subcategories as $key=>$sub}
				<div class="tab-pane{if $key == 0} active{/if}" id="subcategorytab_{$sub.id_category}_{$wkey}">
					{$products=$sub.products}
					{$scolumn=floor(12/$column)}
					{assign var="tabname" value="categoriestabs_{$sub.id_category}"}
					{include file="{$product_tpl}"}
				</div>
				{/foreach}
			</div>
			<div class="category-banner">
				<div class="row">
					{if $imageurl1 && $imageurl2}
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
							{if $url1}<a href="{$url1|escape:'html':'UTF-8'}" title="{l s='banner' mod='ptspagebuilder'}">{/if}
							<img src="{$imageurl1}" alt="{l s='banner' mod='ptspagebuilder'}">
							{if $url1}</a>{/if}
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
							{if $url1}<a href="{$url2|escape:'html':'UTF-8'}" title="{l s='banner' mod='ptspagebuilder'}">{/if}
							<img src="{$imageurl2}" alt="{l s='banner' mod='ptspagebuilder'}">
							{if $url1}</a>{/if}
						</div>
					{elseif $imageurl1}
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							{if $url1}<a href="{$url1|escape:'html':'UTF-8'}" title="{l s='banner' mod='ptspagebuilder'}">{/if}
							<img src="{$imageurl1}" alt="{l s='banner' mod='ptspagebuilder'}">
							{if $url1}</a>{/if}
						</div>
					{elseif $imageurl2}
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							{if $url1}<a href="{$url2|escape:'html':'UTF-8'}" title="{l s='banner' mod='ptspagebuilder'}">{/if}
							<img src="{$imageurl2}" alt="{l s='banner' mod='ptspagebuilder'}">
							{if $url1}</a>{/if}
						</div>
					{/if}
				</div>
			</div>
		</div>
	</div>
</div>

{if $event == 'hover'}
    <script type="text/javascript">
        jQuery(document).ready(function($){
            $('#subcategories{$wkey} ul.nav-tabs li').hover(function(){
                var parent = $('#subcategories{$wkey}');
                $('ul.nav-tabs li', parent).removeClass('active');
                $(this).addClass('active');
                var contentId = $(this).find('a').attr('href');
                $('.tab-pane', parent).removeClass('active');
                $(contentId).addClass('active');
            });
        });
    </script>
{/if}

<!-- /Block categories module -->
{/if}
