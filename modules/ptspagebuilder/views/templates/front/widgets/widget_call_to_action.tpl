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
<div class="call-to-action {$call_to_action_style} {$addition_cls} {if isset($stylecls)&&$stylecls}block-{$stylecls}{else}block-borderbox{/if}">
    {if $call_to_action_style == 'call-to-action-v1'}
            <div class="call-to-action-inner">
                <div class="heading heading-v9">
                    <h3>{if isset($widget_heading)}{$widget_heading}{/if}</h3>
                </div>
                <p>{$htmlcontent}</p>
            </div>
            <div class="call-to-action-inner action-button">    
                <a class="btn btn-lg btn-outline btn-default radius-3x" href="{$call_to_action_link_1}">{$call_to_action_text_link_1}</a>
            </div>
    {elseif $call_to_action_style == 'call-to-action-v2'}
        <div class="call-to-action-inner">
            <div class="heading">
                <h3 class="text-right">{if isset($widget_heading)}{$widget_heading}{/if}</h3>
            </div>
        </div>
        <div class="call-to-action-inner action-button">    
            <a class="btn btn-lg btn-success radius-3x" href="{$call_to_action_link_1}">{$call_to_action_text_link_1}</a>
        </div>
    {elseif $call_to_action_style == 'call-to-action-v3'}
        <div class="call-to-action-inner">
            <div class="heading">
                <h3>{if isset($widget_heading)}{$widget_heading}{/if}</h3>
            </div>
        </div>
    {elseif $call_to_action_style == 'call-to-action-v4'}
        <div class="call-to-action-inner">
            <div class="heading heading-v3 heading-light">
                {if isset($call_to_action_iconurl) && $iconfile}
                    <img class="fa" src="{$call_to_action_iconurl}" alt="{l s='icon' mod='ptspagebuilder'}">
                {elseif $iconclass}
                    <i class="fa {$iconclass}"></i>
                {/if}
                <h3>{if isset($widget_heading)}{$widget_heading}{/if}</h3>
            </div>
            <p>{$htmlcontent}</p>
        </div>
        <div class="call-to-action-inner action-button">
            {if $call_to_action_text_link_1}  
            <a class="btn btn-lg btn-outline btn-success radius-3x" href="{$call_to_action_link_1}">{$call_to_action_text_link_1}</a>
            {/if}
            {if $call_to_action_text_link_2}  
            <a class="btn btn-lg btn-outline btn-default radius-5x" href="{$call_to_action_link_2}">{$call_to_action_text_link_2}</a>
            {/if}
        </div>
    {/if}
    
</div>