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
{if isset($products) && !empty($products)}
	{if !isset($product_style)}
		{$product_style = Configuration::get('PTS_CP_PRODUCT_STYLE')}
	{/if}
	<div class="widget widget-products pts-flashsale {$addition_cls} {if isset($stylecls)&&$stylecls}block-{$stylecls}{else}block-borderbox{/if} block">
		<h4 class="title_block">
			{$widget_heading}
		</h4>	
		<div class="block_content ">
			{if isset($products) AND $products}
		 		{$tabname=rand()+count($products)}
				{$scolumn=(12/$column)}
				<div class="boxcarousel carousel slide products_block {if isset($class)} {$class} {/if}" id="{$tabname}">
					{if count($products)>$itemsperpage}
						<div class="carousel-controls">
							<a class="carousel-control left" href="#{$tabname}" data-slide="prev"><span class="icon-prev"></span></a>
							<a class="carousel-control right" href="#{$tabname}" data-slide="next"><span class="icon-next"></span></a>
				        </div>
					{/if}
					<div class="carousel-inner">
						{$mproducts=array_chunk($products,$itemsperpage)}
						{foreach from=$mproducts item=products name=mypLoop}
								<!-- Products list -->
								<div class="{if isset($class) && $class} {$class}{/if}{if isset($active) && $active == 1} active{/if} item {if $smarty.foreach.mypLoop.first}active{/if} ">
									<ul{if isset($id) && $id} id="{$id}"{/if} class=" row clearfix grid list-unstyled products-block {if isset($product_style) && !empty($product_style)}{$product_style}{/if}">
									{foreach from=$products item=product name=products}

										<li class="ajax_block_product col-xs-cus-12 col-xs-6 col-sm-4 col-md-{if (12/$scolumn) == 5}cus-5{else}{$scolumn}{/if} col-lg-{if (12/$scolumn) == 5}cus-5{else}{$scolumn}{/if} {if $smarty.foreach.products.iteration%(12/$scolumn)==0}last-in-line{/if}">
											{if isset($product_style) && !empty($product_style)}
												{include file="$tpl_dir./sub/product/{$product_style}.tpl" product=$product class=''}
											{/if}
										</li>
									{/foreach}
									</ul>
								</div>
						{/foreach}
						{$key=rand()}
					</div>
				</div>
			{/if}
			<div class="flashsale-time">
				<label class="hidden-xs hidden-sm">{l s='ends in' mod='ptspagebuilder'}</label>
				<div class="pts-flashsale-time pts-flashsale-{$key}"></div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	    jQuery(document).ready(function($){
	        $(".pts-flashsale-{$key}").lofCountDown({
	            TargetDate:"{$dates.month}/{$dates.day}/{$dates.year} {$dates.hour}:{$dates.minute}:{$dates.seconds}",
	            DisplayFormat:"<ul class=\"list-unstyled\"><li><div class=\"countdown_num\">%%D%% </div><div>{l s='days' mod='ptspagebuilder'}</div></li><li><div class=\"countdown_num\">%%H%% </div><div>{l s='hours' mod='ptspagebuilder'}</div></li><li><div class=\"countdown_num\">%%M%%</div><div>{l s='mins' mod='ptspagebuilder'}</div> </li><li><div class=\"countdown_num\">%%S%%</div><div> {l s='Secs' mod='ptspagebuilder'}</div> </li></ul>",
	            FinishMessage: ""
	        });
	    })
	    //title style
			 $('.widget-flashsale .title_style').each(function(){
				var me = $(this);
				me.html( me.text().replace(/(^\w+|\s+\w+)/,'<span>$1</span>') );
		   });
	</script>
{/if}