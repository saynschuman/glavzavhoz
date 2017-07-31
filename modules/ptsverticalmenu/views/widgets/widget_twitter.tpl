{if isset($username)}
<div class="widget-twitter">
	{if isset($widget_heading)&&!empty($widget_heading)}
	<div class="widget-heading widget-title">
		{$widget_heading}
	</div>
	{/if}
	<div class="widget-inner">
		<a class="twitter-timeline" data-dnt="true" data-theme="{$theme}" data-link-color="#FFFFFF" width="{$width}" height="{$height}" data-chrome="{$chrome}" data-border-color="{$border_color}" lang="EN" data-tweet-limit="{$count}" data-show-replies="{$show_replies}" href="https://twitter.com/{$username}"  data-widget-id="{$twidget_id}">Tweets by @{$username}</a>
		{$js}
	</div>
</div>
{/if} 