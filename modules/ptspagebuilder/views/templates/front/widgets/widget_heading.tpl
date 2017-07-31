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
{if isset($widget_heading)&&!empty($widget_heading)}
<div class="widget-accordion block {$addition_cls} {if isset($stylecls)&&$stylecls}block-{$stylecls}{else}block-border-box{/if}">
	<div class="space-padding-tb-50">
        <div class="container">
            <div class="heading {if $headingstyle != 'heading-icon' && $headingstyle}{$headingstyle}{/if}">
                {if $headingstyle == 'heading-icon' && isset($iconurl) && $iconfile}
					<img class="fa" src="{$iconurl}" alt="{l s='icon' mod='ptspagebuilder'}">
				{elseif $iconclass}
					<i class="fa {$iconclass}"></i>
				{/if}
                <h2>{$widget_heading}</h2>
                {if $content_html}
                	<small>{$content_html}</small>
                {/if}
            </div>
        </div>
    </div>
</div>
{/if}


