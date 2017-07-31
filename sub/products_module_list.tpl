{if !empty($products)}
<div class="boxcarousel slide products_block {if isset($class)} {$class} {/if}" id="{$tabname}">
	{if count($products)>$itemsperpage}
		<div class="carousel-controls">
			<a class="carousel-control carousel-sm radius-x left" href="#{$tabname}" data-slide="prev"><span class="icon-prev"></span></a>
			<a class="carousel-control carousel-sm radius-x right" href="#{$tabname}" data-slide="next"><span class="icon-next"></span></a>
        </div>
	{/if}
	<div class="carousel-inner">
	{$mproducts=array_chunk($products,$itemsperpage)}
	{foreach from=$mproducts item=products name=mypLoop}
			<!-- Products list -->
			<div class="{if isset($class) && $class} {$class}{/if}{if isset($active) && $active == 1} active{/if} item {if $smarty.foreach.mypLoop.first}active{/if} ">
				<ul{if isset($id) && $id} id="{$id}"{/if} class=" row clearfix list-unstyled products-block default list">
				{foreach from=$products item=product name=products}
					<li class="ajax_block_product col-xs-12 col-sm-12 col-md-{if (12/$scolumn) == 5}cus-5{else}{$scolumn}{/if} col-lg-{if (12/$scolumn) == 5}cus-5{else}{$scolumn}{/if} {if $smarty.foreach.products.iteration%(12/$scolumn)==0}last-in-line{/if}">
							{include file="$tpl_dir./sub/product/style-list.tpl" product=$product class=''}
					</li>
				{/foreach}
				</ul>
			</div>
	{/foreach}
	</div>
</div>
{addJsDefL name=min_item}{l s='Please select at least one product' js=1}{/addJsDefL}
{addJsDefL name=max_item}{l s='You cannot add more than %d product(s) to the product comparison' sprintf=$comparator_max_item js=1}{/addJsDefL}
{addJsDef comparator_max_item=$comparator_max_item}
{addJsDef comparedProductsIds=$compared_products}
{/if}