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
<div class="feature-box {$icon_box_style} {$text_align} {$background}">
    <div class="fbox-icon">
    	{if isset($linkurl) && $linkurl}
        <a href="{$linkurl}" title="{if isset($widget_heading)&&!empty($widget_heading)}{$widget_heading}{/if}">
        {/if}
        	{if isset($iconurl) && $iconfile}
				<img class="fa" src="{$iconurl}" alt="{l s='icon' mod='ptspagebuilder'}">
			{elseif $iconclass}
				<i class="fa {$iconclass}"></i>
			{/if}
        {if isset($linkurl) && $linkurl}
        </a>
        {/if}
    </div>
    <div class="fbox-body clearfix">                          
        {if isset($widget_heading)&&!empty($widget_heading)}
    		<p class="fbox-title">
                {if isset($linkurl) && $linkurl}
                    <a href="{$linkurl}" title="{if isset($widget_heading)&&!empty($widget_heading)}{$widget_heading}{/if}">
                {/if}
    			{$widget_heading}
                {if isset($linkurl) && $linkurl}
                </a>
                {/if}
    		</p>
    	{/if}
        {if isset($htmlcontent) && $htmlcontent}
        <p class="fbox-content">{$htmlcontent}</p>
        {/if}
    </div>
</div>