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
{if isset($producttabs)}
<div class="widget-producttabs block tab-v4 {$addition_cls} {if isset($stylecls)&&$stylecls}block-{$stylecls}{else}block-borderbox{/if} {Configuration::get('PTS_CP_THEME')}">
 	{if $DEFAULT_THEMESKIN == default}
		{assign var=columntabs value=12/count($producttabs)}
 	{/if}
	<div class="widget-inner  pts-tab clearfix">
		<div class="tabs-heading">
			<ul  class="nav nav-tabs clearfix">		
			{foreach from=$producttabs item=ptab name=myproducttabs}
				{if !empty($ptab.products)}
				<li class="{if $smarty.foreach.myproducttabs.index == 0} active{/if}{if $DEFAULT_THEMESKIN == default} col-xs-12 col-sm-{$columntabs} col-md-12/{$columntabs}{/if}"><a data-toggle="tab" href="#tab-{$ptab.key}">{$ptab.title}</a></li>
				{/if}
			{/foreach}
			</ul>
		</div>
		<div class="tab-content">
		{foreach from=$producttabs item=ptab name=myproducttabs}
			{if !empty($ptab.products)}
			<div id="tab-{$ptab.key}" class="producttab-content tab-pane {if $smarty.foreach.myproducttabs.index == 0}active{/if}">
				{$tabname=$ptab.key}
		 		{$scolumn=floor(12/$column)}
				{include file="{$product_tpl}" products=$ptab.products scolumn=$scolumn column=$column} 
			</div>
			{/if}
		{/foreach}
		</div>
	</div>
</div>
{/if} 