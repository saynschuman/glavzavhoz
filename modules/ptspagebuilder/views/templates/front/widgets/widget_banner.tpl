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
<div class="widget-banner block {$addition_cls} {if isset($stylecls)&&$stylecls}block-{$stylecls}{else}block-borderbox{/if}">
	<div class="widget-inner block_content clearfix">
		{if isset($widget_heading)&&!empty($widget_heading)}
			<h4 class="title_block">
				{$widget_heading}
			</h4>
		{/if}
        <a class="widget-banner-image" href="{$link_url}" title="">
			<img class="img-responsive" src="{$imageurl}" alt="">
		</a>
        <div class="widget-banner-desc">{if $subtitle}<h5 class="sub-title">{$subtitle}</h5>{/if}{if $description}{$description}{/if}</div>
	</div>
</div>
