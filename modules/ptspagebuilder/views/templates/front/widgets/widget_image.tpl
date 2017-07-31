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
{if isset($thumbnailurl)}
<div class="widget-images block {$addition_cls} {if isset($stylecls)&&$stylecls}block-{$stylecls}{/if}">
	{if isset($widget_heading)&&!empty($widget_heading)}
	<h4 class="title_block">
		{$widget_heading}
	</h4>
	{/if}
	<div class="widget-inner block_content clearfix">
		 <div class="image-item">
		 	{if $ispopup}
		 		<a href="{$imageurl}" class="pts-popup fancybox" title="{l s='Large Image' mod='ptspagebuilder'}"><span class="icon icon-search-plus"></span></a>
		 	{/if}
		 	
		 	{if $link_url}
		 		<a class="pts-btnlink img-animation" href="{$link_url|escape:'htmlall':'UTF-8'}" title="{l s='Large Image' mod='ptspagebuilder'}">
		 		<img class="img-responsive" alt="" src="{$thumbnailurl}"/></a>
		 	{else}

		 		<span class="img-animation"><img alt="" src="{$thumbnailurl}"/></span>
			{/if}
		 </div>
	</div>
</div>
{/if} 