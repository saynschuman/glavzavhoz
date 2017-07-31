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
{if $content}
	<div class="widget-module {$addition_cls} {if isset($stylecls)&&$stylecls}block-{$stylecls}{else} block-highlighted block-borderbox{/if}">
	{if isset($widget_heading)&&!empty($widget_heading)}
		<div class="widget-heading title_block">
			{$widget_heading}
		</div>
	{/if}
		<div class="widget-inner">
			 {$content}
		</div>
	</div>
{/if}