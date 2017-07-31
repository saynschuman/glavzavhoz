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
{if isset($images)}
<div class="widget-images block {$addition_cls} {if isset($stylecls)&&$stylecls}block-{$stylecls}{/if}">
	{if isset($widget_heading)&&!empty($widget_heading)}
	<h4 class="title_block">
		{$widget_heading}
	</h4>
	{/if}
	<div class="widget-inner gallery-{$type} block_content clearfix">
			{if $type=='slider-bt'}
			<div class="carousel slide pts-carousel" id="carousel-{$id}" data-ride="carousel">
				<ol class="carousel-indicators">
				    <li data-target="#carousel-{$id}" data-slide-to="0" class="active"></li>
				    <li data-target="#carousel-{$id}" data-slide-to="1"></li>
				    <li data-target="#carousel-{$id}" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner">
					{foreach from=$images item=image name=image}				
		 				<div class="item">
			 				<div>
			 					{if $image.link}
			 						<a href="{$image.link}" title="{l s='Image Gallery' mod='ptspagebuilder'}"><img alt="" src="{$image.thumbnailurl}"/></a>
			 					{else}
			 						<img alt="" src="{$image.thumbnailurl}"/>
			 					{/if}
			 				</div>
		 				</div>	 	
					 {/foreach}
				 </div>	
			      <a class="left carousel-control" href="#carousel-{$id}" data-slide="prev">
				    <span class="glyphicon glyphicon-chevron-left"></span>
				  </a>
				  <a class="right carousel-control" href="#carousel-{$id}" data-slide="next">
				    <span class="glyphicon glyphicon-chevron-right"></span>
				  </a>

			</div>
			{else}
			<div class="images-list clearfix">	
		 		<div class="row">
			 		{foreach from=$images item=image name=image}
					 		<div class="image-item col-xm-12 col-sm-12 {if $columns==5}col-cus-md-5{else}col-md-{12/$columns}{/if}">
					 			<span class="img-animation">
					 				<img alt="" class="replace-2x img-responsive" src="{$image.thumbnailurl}"/>
					 			</span>				 			
					 			{if $ispopup}
							 		<a href="{$image.imageurl|escape:'htmlall':'UTF-8'}" class="pts-popup fancybox" title="{l s='Large Image' mod='ptspagebuilder'}"><span class="icon icon-search-plus"></span></a>
							 	{/if}
					 		</div>
					{/foreach}
				</div>
			</div>	
		 {/if}	
	</div>
</div>
{/if} 