{include file="$tpl_dir./errors.tpl"}
{if isset($category)}
    {if $category->id AND $category->active}

    <div class="categories clearfix">
        {if $scenes || $category->description || $category->id_image}
            <div class="content_scene_cat"><!--
                -->{if $scenes}<div class="content_scene">
                        <!-- Scenes -->
                        {include file="$tpl_dir./scenes.tpl" scenes=$scenes}

                    </div>
                {/if}<!----></div>
        {/if}
        {if isset($subcategories)}
            {if (isset($display_subcategories) && $display_subcategories eq 1) || !isset($display_subcategories) }
            <!-- Subcategories -->
                <div class="rightbar">
						<div class="row">
                        {foreach from=$subcategories item=subcategory}
							<div class="col-xms-12 col-xs-6 col-md-4">
								<a href="{$link->getCategoryLink($subcategory.id_category, $subcategory.link_rewrite)|escape:'html':'UTF-8'}" class="category-block-wrap">
									<div class="category-img-wrap">
										<img src="{$link->getCatImageLink($subcategory.link_rewrite, $subcategory.id_image, 'medium_default')|escape:'html':'UTF-8'}" alt="{$subcategory.name|escape:'html':'UTF-8'}" width="{$mediumSize.width}" height="{$mediumSize.height}">
									</div>
									<div class="category-title"><span>{$subcategory.name|truncate:50:'...'|escape:'html':'UTF-8'}</span></div>
								</a>
							</div>
                        {/foreach}

					</div>
                </div>
            {/if}
        {/if}
    </div>
    {if $products}

         <div id="js-slide-main">
             <!-- <div class="theiaStickySidebar"> -->
    	        {hook h="displayBodyFilters"}

               <div class="category_container">
                <div class="content_sortPagiBar product-filter clearfix">
                    <div class="row">
                        <!-- <div class="top-pagination-content col-lg-2 col-md-3 col-sm-3">
                                {include file="./product-compare.tpl"}
                        </div> -->
                        <div class="hidden-xs hidden-sm hidden-md hidden-lg">{include file="./nbr-product-page.tpl"}</div><!-- error pagination -->
                        <div class="sortPagiBar col-lg-12 col-md-12 col-sm-12">
                            {include file="./product-sort.tpl"}
                        </div>
                    </div>
                </div>

                {include file="./product-list.tpl" products=$products}
            </div><!--  /.category_container -->
            <!--</div>--><!--  /.theiaStickySidebar -->
        </div><!-- /#js-slide-main  -->

        <div class="bottom-pagination-content content_sortPagiBar clearfix">
             {include file="./pagination.tpl" paginationId='bottom'}
        </div>
    {/if}
    {elseif $category->id}
        <p class="alert alert-warning">{l s='This category is currently unavailable.'}</p>
    {/if}

{/if}
