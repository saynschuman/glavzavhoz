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
{$scolumn = $total / $cat_columns}
{if isset($categories_list)}
<div id="ptsblockfrontcategories" class="block productcats_block exclusive ptsblockfrontcategories carousel slide {$addition_cls} {if isset($stylecls)&&$stylecls}block-{$stylecls}{else}block-borderbox{/if}">

	<h4 class="title_block">
		<span>
			<span class="text_color">{l s='Sales' mod='ptspagebuilder'}</span>
			<span>{l s='by product categories' mod='ptspagebuilder'}</span>
		</span>
	</h4>
	<div class="block_content">
		{if !empty($categories_list)}
			{$tabname="pagebuildercategories"}
			<div id="{$tabname}" class="frontcategories clearfix">
				{foreach from=$categories_list item=ptscategory name=ptscategories}	
					{if $ptscategory@iteration%$cat_columns==1&&$cat_columns>1}
						<div class="row">
					{/if}	
						<div class="col-xs-12 col-sm-6 col-md-{$scolumn} col-lg-{$scolumn} category-item" data-id="{$ptscategory.id}"  >
							 <div class="inner">
								<div class="image">
									<a class="link_viewall" href="{$ptscategory.link|escape:'htmlall':'UTF-8'}">{l s='View all' mod='ptspagebuilder'}</i></a>
									<a id="cats-{$ptscategory.id}" href="{$ptscategory.link}">
										<img class="img-responsive" src="{$url_image|escape:'htmlall':'UTF-8'}{$ptscategory.id}.jpg" alt="{$ptscategory.name}" width="{$image_width}" hieght="{$image_height}" />
										<span><span class="categories_title">{$ptscategory.name}</span></span>
									</a>
								</div>
							 </div>
						 
							<!--<div class="category-content" id="{$tabname}content{$ptscategory.id}"></div>-->
						</div>

				{if ($ptscategory@iteration%$cat_columns==0||$smarty.foreach.ptscategories.last)&&$cat_columns>1}
					</div>
				{/if}

				{/foreach}
			</div>
						
		{/if}
	</div>
</div>
{/if}