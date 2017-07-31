<!-- Block links module -->
<div id="links_block_left" class="block">
	<p class="title_block"><span>
	{if $url}
		<a href="{$url|escape}">{$title|escape}</a>
	{else}
		{$title|escape}
	{/if}</span>
	</p>
    <div class="block_content">
        <ul class="list-unstyled list-block">
            {foreach from=$blocklink_links item=blocklink_link}
                {if isset($blocklink_link.$lang)} 
                    <li><a href="{$blocklink_link.url|escape}"{if $blocklink_link.newWindow} onclick="window.open(this.href);return false;"{/if}>{$blocklink_link.$lang|escape}</a></li>
                {/if}
            {/foreach}
        </ul>
    </div>
</div>
<!-- /Block links module -->
