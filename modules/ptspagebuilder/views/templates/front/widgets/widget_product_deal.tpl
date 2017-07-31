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
<div class="widget widget-products widget-productdeal  block {$addition_cls} {if isset($stylecls)&&$stylecls}block-{$stylecls}{else}block-borderbox{/if}">
	{if isset($widget_heading)&&!empty($widget_heading)}
	<h4 class="title_block">
		{$widget_heading}
	</h4>
	{/if}
	<div class="widget-inner block_content ">		
		{if isset($products) AND $products}
	 		{$tabname=rand()+count($products)}
	 		{$scolumn=floor(12/$column)}
			{include file="{$product_tpl}" products=$products scolumn=$scolumn} 
		{/if}
	</div>
</div>
{/if}


<script type="text/javascript">
	$(document).ready(function() {
		$('.widget-productdeal .title_block').each(function(){
			var me = $(this);
			me.html( me.text().replace(/(^\w+|\s+\w+)/,'<span class="subtitle">$1</span>') );
		});
	});
</script>