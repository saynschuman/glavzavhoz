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
{if isset($promotions) && $promotions}
<div class="widget-promotion block  {$addition_cls} {if isset($stylecls)&&$stylecls}block-{$stylecls}{else}block-boxborder{/if}">
	{if isset($widget_heading)&&!empty($widget_heading)}
	<h4 class="title_block">
		{$widget_heading}
	</h4>
	{/if}

	<div class="widget-inner block_content clearfix">
		{if $type_display == 'tab'}
			<ul  class="nav nav-theme clearfix">
			{foreach from=$promotions item=promotion name=name_promotion}
				<li{if $smarty.foreach.name_promotion.index == 0} class="active"{/if}>
					<a data-toggle="tab" href="#tab-{$randId}-{$smarty.foreach.name_promotion.index}">{if isset($promotion.title) && $promotion.title}{$promotion.title}{else}{l s='promotions' mod='ptspagebuilder'}{/if}</a>
				</li>
			{/foreach}
			</ul>
			<div class="tab-content">
				{foreach from=$promotions item=promotion name=name_promotion}
					<div id="tab-{$randId}-{$smarty.foreach.name_promotion.index}" class="promotion-content tab-pane {if $smarty.foreach.name_promotion.index == 0}active{/if}">
						{if isset($promotion.title) && $promotion.title}
			        		<h3>{$promotion.title}</h3>
			        	{/if}
			        	{if isset($promotion.imageurl) && $promotion.imageurl}
							<a href="{$promotion.url|escape:'htmlall':'UTF-8'}" class="pts-btnlink img-animation" title="{l s='Large Image' mod='ptspagebuilder'}">
								<img src="{$promotion.imageurl|escape:'htmlall':'UTF-8'}" alt="{$promotion.title}"/>
							</a>
						{/if}
						{if isset($promotion.description) && $promotion.description}
							<div class="promotion-description">{$promotion.description}</div>
						{/if}
					</div>
				{/foreach}
			</div>
		{else}
			<div id="promotion-carousel-{$randId}" class="carousel slide" data-ride="carousel">
				{if count($promotions)>$itemsperpage}
					<div class="carousel-controls">
					 	<a class="carousel-control left" href="#promotion-carousel-{$randId}"   data-slide="prev">&lsaquo;</a>
						<a class="carousel-control right" href="#promotion-carousel-{$randId}"  data-slide="next">&rsaquo;</a>
					</div>
				{/if}
			    <div class="carousel-inner">
			    {$mpromotions=array_chunk($promotions,$itemsperpage)}
					{foreach from=$mpromotions item=promotions name=name_promotion}
				        <div class="item{if $smarty.foreach.name_promotion.index == 0} active{/if}">
					        <ul class="row promotion-list">
					        	{foreach from=$promotions item=promotion name=promotions}
						        	<li class="col-xs-12 col-sm-3 col-md-{if $column == 5}cus-5{else}{12/$column}{/if} col-lg-{if $column == 5}cus-5{else}{12/$column}{/if}">
							        	{if isset($promotion.title) && $promotion.title}
							        		<h3 class="promotion-title">{$promotion.title}</h3>
							        	{/if}
							        	{if isset($promotion.imageurl) && $promotion.imageurl}
											<a href="{$promotion.url|escape:'htmlall':'UTF-8'}" class="pts-btnlink img-animation" title="{l s='Large Image' mod='ptspagebuilder'}">
												<img src="{$promotion.imageurl|escape:'htmlall':'UTF-8'}" alt="{$promotion.title}"/>
											</a>
										{/if}
										{if isset($promotion.description) && $promotion.description}
											<div class="promotion-description">{$promotion.description}</div>
										{/if}
									</li>
								{/foreach}
							</ul>
				        </div>
			        {/foreach}
			    </div>
			</div>
		{/if}

	</div>

</div>
{/if} 