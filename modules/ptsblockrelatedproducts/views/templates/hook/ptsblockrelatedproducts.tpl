
<!-- MODULE Block ptsblockrelatedproducts -->
{$column=$columnspage}
{if $products|@count gt 0 }
<div id="relatedproducts" class="block block-borderbox products_block ptsblockrelatedproducts">
		<p class="title_block">{l s='related products' mod='ptsblockrelatedproducts'}</p>
		<div class="block_content">	
			{if !empty($products )}
				{$tabname="ptsblockrelatedproducts"}
				{include file="$tpl_dir./sub/products_module.tpl" modulename='ptsblockrelatedproducts'}
			{/if}
		</div>
</div>
{/if}
 