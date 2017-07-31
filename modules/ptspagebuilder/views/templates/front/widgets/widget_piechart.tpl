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
<div class="widget-accordion block {$addition_cls} {if isset($stylecls)&&$stylecls}block-{$stylecls}{/if}">
{if $piechart_style == 'bar-chart'}
	<div class="bar-chart">
	    <div class="progress-title">
	    	<span class="text-success">{$number_percentage}%</span>
	    	{if isset($widget_heading)&&!empty($widget_heading)}
			<small>{$widget_heading}</small>
			{/if}
    	</div>
	    <div class="progress progress-7">
	        <div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" data-width="{$number_percentage}"></div>
	    </div>               
	</div>
{elseif $piechart_style == 'bar-chart-icon'}
	<div class="bar-chart">
	    <div class="progress-title">
	    	<span class="text-success">{$number_percentage}%</span>
	    	{if isset($widget_heading)&&!empty($widget_heading)}
			<small>{$widget_heading}</small>
			{/if}
    	</div>
	    <div class="progress progress-7">
	        <div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" data-width="{$number_percentage}"></div>
	    </div>

	    {if isset($iconurl) && $iconfile}
			<div class="bar-icon"><img class="fa" src="{$iconurl}" alt="{l s='icon' mod='ptspagebuilder'}"> </div>
		{elseif $iconclass}
			<div class="bar-icon"><i class="fa {$iconclass}"></i> </div>
		{/if}
	</div>
{elseif $piechart_style == 'circle-icon'}
	<div class="piechart-item text-center">
        <div class="percentage" data-percent="{$number_percentage}">
          <span>{$number_percentage}</span><sup>%</sup>
        </div>
        {if isset($widget_heading)&&!empty($widget_heading)}
			<h4 class="piechart-title">{$widget_heading}</h4>
		{/if}
		{if $htmlcontent}
        	<p>{$htmlcontent}</p>
        {/if}
    </div>
{elseif $piechart_style == 'circle-icon'}
    <div class="piechart-item text-center">
        <div class="percentage" data-percent="{$number_percentage}">
            {if isset($iconurl) && $iconfile}
				<img class="fa" src="{$iconurl}" alt="{l s='icon' mod='ptspagebuilder'}">
			{elseif $iconclass}
				<i class="fa {$iconclass}"></i>
			{/if}
        </div>
            {if isset($widget_heading)&&!empty($widget_heading)}
			<h4 class="piechart-title">{$widget_heading}</h4>
		{/if}
        {if $htmlcontent}
        	<p>{$htmlcontent}</p>
        {/if}
    </div>
{/if}
</div>
<script type="text/javascript">
    jQuery(document).ready(function() {
        ProgressBar.initProgressBarHor();

        $('.percentage').easyPieChart({
          animate: 1000,
          lineWidth: 3,
          onStep: function(value) {
            this.$el.find('span').text(Math.round(value));
          },
          onStop: function(value, to) {
            this.$el.find('span').text(Math.round(to));
          }
        });

    });
</script>
