
<div id="pts_search_block_top">
    <a class="search-focus dropdown-toggle links" data-toggle="modal" data-target=".bs-example-modal-lg"> 
        <i class="icon-search"></i>         
    </a>
    <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                  <h4 class="modal-title" id="gridSystemModalLabel">Search Products</h4>
                </div>
                <div class="modal-body">
                	<form method="get" action="{$link->getPageLink('search')|escape:'html'}" id="searchbox">
                        <input type="hidden" name="controller" value="search" />
                        <div class="input-group">
                            <input type="hidden" name="orderby" value="position" />
                            <input type="hidden" name="orderway" value="desc" />
                            <input class="search_query form-control" type="text" placeholder="{l s='What do you need...' mod='ptsblocksearch'}" id="pts_search_query_top" name="search_query" value="{$search_query|escape:'html':'UTF-8'|stripslashes}" />
                            <div class="input-group-btn">
                                {$category_html}
                            </div>
                            <button type="submit" name="submit_search" class="button-search">
                                <span class="icon icon-search"></span>
                            </button>
                        </div>
                	</form>
                </div>
            </div>
        </div>
    </div>
    {include file="$self/views/templates/hook/ptsblocksearch-instantsearch.tpl"}
</div>

