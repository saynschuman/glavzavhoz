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
{if $select_type}
	<div class="widget-priterest {$addition_cls} block {if isset($stylecls)&&$stylecls}block-{$stylecls}{/if}">
		{if isset($widget_heading)&&!empty($widget_heading)}
			<h4 class="title_block">
				{$widget_heading}
			</h4>
		{/if}
		<div class="widget-inner block_content">

			<a href="http://www.pinterest.com/pin/create/button/?url={$url}&media={$media}&description={$description}"
				class="pin-it-button" count-layout="{$select_type}"
			    <img src="//assets.pinterest.com/images/pidgets/pin_it_button.png" title="Pin It" />
			</a>

		</div>
	</div>
{/if}
{literal}
	<script type="text/javascript">
		(function(d){
		    var f = d.getElementsByTagName('SCRIPT')[0], p = d.createElement('SCRIPT');
		    p.type = 'text/javascript';
		    p.async = true;
		    p.src = '//assets.pinterest.com/js/pinit.js';
		    f.parentNode.insertBefore(p, f);
		}(document));
	</script>
{/literal}