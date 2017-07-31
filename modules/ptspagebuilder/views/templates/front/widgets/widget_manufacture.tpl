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
<div class="widget-manufacture block {$addition_cls} {if isset($stylecls)&&$stylecls}block-{$stylecls}{/if}">
	{if isset($widget_heading)&&!empty($widget_heading)}
	<h4 class="title_block">
		{$widget_heading}
	</h4>
	{/if}
	<div class="widget-inner block_content">
		{if isset($manufacturers) AND $manufacturers}
			{$tabname=rand()+count($manufacturers)}
			{$scolumn=floor(12/$column)}
		<div id="{$tabname}" class="carousel slide row">
			{if count($manufacturers)>$itemsperpage}
				<div class="carousel-controls">
					<a class="carousel-control carousel-sm radius-x left" href="#{$tabname}" data-slide="prev"><span class="icon-prev"></span></a>
					<a class="carousel-control carousel-sm radius-x right" href="#{$tabname}" data-slide="next"><span class="icon-next"></span></a>
		        </div>
			{/if}
			<div class="carousel-inner">			
				{$logomanufacturer=array_chunk($manufacturers,$itemsperpage)}
				{foreach from=$logomanufacturer item=manufacturers name=mypLoop}
					<div class="item {if isset($active) && $active == 1} active{/if} item {if $smarty.foreach.mypLoop.first}active{/if}">
						{foreach from=$manufacturers item=manufacturer name=manufacturers}
						<div class="col-xs-6 col-sm-4 col-md-{$scolumn} col-lg-{$scolumn}">
							<div class="manu-logo block_manuf clearfix">
								<a  href="{$link->getmanufacturerLink($manufacturer.id_manufacturer, $manufacturer.link_rewrite)|escape:'htmlall':'UTF-8'}" title="{l s='view products' mod='ptspagebuilder'}">
								<img src="{$img_manu_dir}{$manufacturer.image|escape:'htmlall':'UTF-8'}-logo_brand.jpg" alt=""> </a>
							</div>
						</div>
						{/foreach}
					</div>
				{/foreach}
			</div>
		</div>  
		{/if}

	</div>
</div>
	 		
