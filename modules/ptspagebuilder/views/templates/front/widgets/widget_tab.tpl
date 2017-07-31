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
{if isset($tabs)}
<div class="widget-tab block {$addition_cls} {if isset($stylecls)&&$stylecls}block-{$stylecls}{/if}">
	{if isset($widget_heading)&&!empty($widget_heading)}
	<h4 class="title_block">
		{$widget_heading}
	</h4>
	{/if}
	<div class="widget-inner block_content">	
		<div id="tabs{$id}" class="panel-group">
			

			<ul class="nav nav-tabs" id="myTab">
			  {foreach $tabs as $key => $ac}  
			  <li class="{if $key==0}active{/if}"><a href="#tab{$id}{$key}" >{$ac.header}</a></li>
			  {/foreach}
			</ul>

			<div class="tab-content">
			 	{foreach $tabs as $key => $ac}
				  <div class="tab-pane{if $key==0} active{/if} " id="tab{$id}{$key}">{$ac.content}</div>
			 	{/foreach}
	 		</div>

	</div></div>
</div>
{/if}


