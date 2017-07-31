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
{if isset($flickr_id)}
<div class="widget-flickr block {$addition_cls} {if isset($stylecls)&&$stylecls}block-{$stylecls}{else}block-borderbox{/if}">
	{if isset($widget_heading)&&!empty($widget_heading)}
	<h4 class="title_block">
		{$widget_heading}
	</h4>
	{/if}
	<div class="widget-inner block_content">

		<script type="text/javascript" src="http://www.flickr.com/badge_code_v2.gne?count={$flickr_photos}&amp;display={$flickr_display}&amp;size=s&amp;layout=x&amp;source={$flickr_type}&amp;{$flickr_type}={$flickr_id}"></script>
		</br>

		<p class="flickr_stream_wrap">
			<a class="btn btn-success btn-sm" href="http://www.flickr.com/photos/{$flickr_id}">View details</a>
		</p>

	</div>
</div>
{/if}