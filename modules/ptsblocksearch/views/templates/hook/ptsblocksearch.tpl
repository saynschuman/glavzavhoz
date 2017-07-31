<!-- Block search module -->
<div id="search_block_left" class="block exclusive">
	<p class="title_block"><span>{l s='Search' mod='ptsblocksearch'}</span></p>
	<form method="get" action="{$link->getPageLink('search')|escape:'html'}" id="searchbox">
            <input type="hidden" name="controller" value="search" />
            <p class="block_content">
                {$category_html}
                    <label for="search_query_block">{l s='Search products:' mod='ptsblocksearch'}</label>
                    <input type="hidden" name="orderby" value="position" />
                    <input type="hidden" name="orderway" value="desc" />
                    <input class="search_query" type="text" id="search_query_block" name="search_query" value="{$search_query|escape:'html':'UTF-8'|stripslashes}" />
                    <input type="submit" id="search_button" class="button_mini" value="{l s='Go' mod='ptsblocksearch'}" />
            </p>
	</form>
</div>
{include file="$self/ptsblocksearch-instantsearch.tpl"}
<!-- /Block search module -->
