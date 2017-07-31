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
{if $counting_number}
<div class="widget-accordion block {$addition_cls} {if isset($stylecls)&&$stylecls}block-{$stylecls}{else}block-borderbox{/if}">
	<div class="counters">
	   	<div class="counter-wrap {$text_color}">
	   		{if isset($iconurl) && $iconfile}
				<img class="fa" src="{$iconurl}" alt="{l s='icon' mod='ptspagebuilder'}">
			{elseif $iconclass}
				<i class="fa {$iconclass}"></i>
			{/if}
	   		<br><span class="counter">{$counting_number}</span>
		</div> 
	    {if isset($widget_heading)&&!empty($widget_heading)}
			<h5>{$widget_heading}</h5>
		{/if}
	</div> 
</div>
{/if}



