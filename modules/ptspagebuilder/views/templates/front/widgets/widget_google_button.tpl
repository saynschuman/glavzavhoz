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
{if $width}
	<div class="widget-google-button block {$addition_cls} {if isset($stylecls)&&$stylecls}block-{$stylecls}{else}block-borderbox{/if}">
		{if isset($widget_heading)&&!empty($widget_heading)}
			<h4 class="title_block">
				{$widget_heading}
			</h4>
		{/if}
		<div class="widget-inner block_content">
			<div class="g-plusone" data-size="{$size}" data-annotation="{$annotation}" data-width="{$width}"></div>
		</div>
	</div>
{/if}
{literal}
<script type="text/javascript">
  window.___gcfg = {lang: 'en-US'};

  (function() {
    var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
    po.src = 'https://apis.google.com/js/platform.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
  })();
</script>
{/literal}