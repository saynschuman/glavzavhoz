{if isset($html)}
<div class="widget-html">
	{if isset($widget_heading)&&!empty($widget_heading)}
	<div class="widget-heading widget-title">
		{$widget_heading}
	</div>
	{/if}
	<div class="widget-inner">
		{$html}
	</div>
</div>
{/if}