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
{if $href}
	<div class="widget-button block {$addition_cls} {if isset($stylecls)&&$stylecls}block-{$stylecls}{/if}">
		{if isset($widget_heading)&&!empty($widget_heading)}
			<h4 class="title_block">
				{$widget_heading}
			</h4>
		{/if}
		<div class="widget-inner block_content">
			<a href="{$href}" class="btn {$color_button}{$el_class} {$size}" alt="{$button_title}">
				<i class="{$icon}"></i>
				{$button_title}
			</a>
		</div>
	</div>
{/if}