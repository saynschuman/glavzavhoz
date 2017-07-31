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
{if isset($links)}
<div class="widget-links block {$addition_cls} {if isset($stylecls)&&$stylecls}block-{$stylecls}{/if}">
	{if isset($widget_heading)&&!empty($widget_heading)}
	<h4 class="title_block">
		{$widget_heading}
	</h4>
	{/if}
	<div class="widget-inner block_content">	
		<div id="tabs{$id}" class="panel-group">		
			<ul class="nav-links lists">
			  {foreach $links as $key => $ac}  
			  <li ><a href="{$ac.link|escape:'htmlall':'UTF-8'}" >{$ac.text}</a></li>
			  {/foreach}
			</ul>


	</div></div>
</div>
{/if}


