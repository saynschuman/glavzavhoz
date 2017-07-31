{*
* Pts Prestashop Theme Framework for Prestashop 1.6.x
*
* @package   ptsblockproducttabs
* @version   1.0
* @author    http://www.prestabrain.com
* @copyright Copyright (C) October 2013 prestabrain.com <@emai:prestabrain@gmail.com>
*               <info@prestabrain.com>.All rights reserved.
* @license   GNU General Public License version 2
*}
<div id="ptsproducttabs" class="block block-header-success products_block exclusive ptsblockproducttabs pts-tab">		            
	<ul id="productTabs" class="nav nav-theme clearfix">
        {if $allproducts}	
          	<li><a href="#taballproductsproducts" data-toggle="tab"><span></span>{l s='All' mod='ptsblockproducttabs'}</a></li>
		{/if}
		{if $special}	
          	<li><a href="#tabspecial" data-toggle="tab">{l s='Special' mod='ptsblockproducttabs'}</a></li>
		{/if}
        {if $newproducts}	
          	<li><a href="#tabnewproducts" data-toggle="tab"><span></span>{l s='New Arrivals' mod='ptsblockproducttabs'}</a></li>
		{/if}
		{if $bestseller}	
          <li><a href="#tabbestseller" data-toggle="tab"><span></span>{l s='Best Seller' mod='ptsblockproducttabs'}</a></li>
		{/if}
		{if $featured}	
          <li><a href="#tabfeaturedproducts" data-toggle="tab"><span></span>{l s='Featured Products' mod='ptsblockproducttabs'}</a></li>
		{/if}
		{if $toprating}	
          <li><a href="#tabtopratingproducts" data-toggle="tab"><span></span>{l s='Top Rating' mod='ptsblockproducttabs'}</a></li>
		{/if}			  
    </ul>
			
	<div class="product_tab_content tab-content">
		{if $allproducts}		  
				<div class="tab-pane" id="taballproductsproducts">
				{$products=$allproducts} {$tabname='taballproductsproducts-carousel'}
				{include file="$tpl_dir./sub/products_module.tpl" modulename='ptsblockproducttabs'}
			</div>   
		{/if}	
		{if $special}	
			<div class="tab-pane" id="tabspecial">
				{$products=$special}{$tabname='tabspecialcarousel'}
				{include file="$tpl_dir./sub/products_module.tpl" modulename='ptsblockproducttabs'}
			</div>
		{/if}
		{if $newproducts}		  
			<div class="tab-pane" id="tabnewproducts">
				{$products=$newproducts} {$tabname='tabnewproducts-carousel'}
				{include file="$tpl_dir./sub/products_module.tpl" modulename='ptsblockproducttabs'}
			</div>   
		{/if}	
		{if $bestseller}		  
			<div class="tab-pane" id="tabbestseller">
				{$products=$bestseller} {$tabname='tabbestseller-carousel'}
				{include file="$tpl_dir./sub/products_module.tpl" modulename='ptsblockproducttabs'}
			</div>   
		{/if}	
		{if $featured}		  
			<div class="tab-pane" id="tabfeaturedproducts">
				{$products=$featured} {$tabname='tabfeaturedproducts-carousel'}
				{include file="$tpl_dir./sub/products_module.tpl" modulename='ptsblockproducttabs'}
			</div>   
		{/if}	
		{if $toprating}		  
			<div class="tab-pane" id="tabtopratingproducts">
				{$products=$toprating} {$tabname='tabtopratingproducts-carousel'}
				{include file="$tpl_dir./sub/products_module.tpl" modulename='ptsblockproducttabs'}
			</div>   
		{/if}	
	</div>
</div>
<!-- /MODULE Block specials -->
<script>
$(document).ready(function() {
 
	$("#ptsproducttabs .nav-theme li", this).first().addClass("active");
	$("#ptsproducttabs .tab-content .tab-pane", this).first().addClass("active");
 
});
</script>
 