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

<li {if isset($last) && $last == 'true'}class="last"{/if}>
	<a 
	href="{$node.link|escape:'html':'UTF-8'}"{if isset($currentCategoryId) && $node.id == $currentCategoryId} class="selected"{/if} title="{$node.desc|strip_tags|trim|escape:'html':'UTF-8'}">
		{$node.name|escape:'html':'UTF-8'} ({$node.total_products})
	</a>
	{if $node.children|@count > 0}
		<ul>
			{foreach from=$node.children item=child name=categoryTreeBranch}
				{if $smarty.foreach.categoryTreeBranch.last}
					{include file="$branche_tpl_path" node=$child last='true'}
				{else}
					{include file="$branche_tpl_path" node=$child last='false'}
				{/if}
			{/foreach}
		</ul>
	{/if}
</li>

