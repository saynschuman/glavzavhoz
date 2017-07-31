
<option value="{$node.id}" {if $current_category == $node.id}selected="selected"{/if}>
    {$node.prefix} {$node.name|escape:'html':'UTF-8'}
</option>
{if $node.children|@count > 0}
    {foreach from=$node.children item=child name=ptsblocksearchTreeBranch}
        {if $smarty.foreach.ptsblocksearchTreeBranch.last}
            {include file="$ptsbranche_tpl_path" node=$child last='true'}
        {else}
            {include file="$ptsbranche_tpl_path" node=$child last='false'}
        {/if}
    {/foreach}
{/if}
