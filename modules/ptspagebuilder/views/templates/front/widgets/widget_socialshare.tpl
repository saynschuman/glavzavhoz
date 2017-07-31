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
<div class="widget-socialsharing block {$addition_cls} {if isset($stylecls)&&$stylecls}block-{$stylecls}{/if}">
	{if isset($widget_heading)&&!empty($widget_heading)}
		<h4 class="title_block">
			{$widget_heading}
		</h4>
	{/if}
	{if $PS_SC_TWITTER || $PS_SC_FACEBOOK || $PS_SC_GOOGLE || $PS_SC_PINTEREST}
		<div class="widget-inner block_content">
			<ul class="ptssocialsharing_product bo-social-icons list-unstyped no-print">
				{if $PS_SC_TWITTER}
				<li>
					<button type="button" class="btn btn-default btn-twitter" onclick="ptssocialsharing_twitter_click('{$pagename|addslashes} {$pagelink|addslashes}');">
						<i class="icon-twitter"></i> <span>Tweet</span>
						<!-- <img src="{$link->getMediaLink("`$module_dir`img/twitter.gif")}" alt="Tweet" /> -->
					</button>
				</li>
				{/if}
				{if $PS_SC_FACEBOOK}
				<li>
					<button type="button" class="btn btn-default btn-facebook" onclick="ptssocialsharing_facebook_click();">
						<i class="icon-facebook"></i><span> facebook</span>
						<!-- <img src="{$link->getMediaLink("`$module_dir`img/facebook.gif")}" alt="Facebook Like" /> -->
					</button>
				</li>
				{/if}
				{if $PS_SC_GOOGLE}
				<li>
					<button type="button" class="btn btn-default btn-google-plus" onclick="ptssocialsharing_google_click();">
						<i class="icon-google-plus"></i> <span>Google+</span>
						<!-- <img src="{$link->getMediaLink("`$module_dir`img/google.gif")}" alt="Google Plus" /> -->
					</button>
				</li>
				{/if}
				{if $PS_SC_PINTEREST}
				<li>
					<button type="button" class="btn btn-default btn-pinterest" onclick="ptssocialsharing_pinterest_click();">
						<i class="icon-pinterest"></i> <span>Pinterest</span>
						<!-- <img src="{$link->getMediaLink("`$module_dir`img/pinterest.gif")}" alt="Pinterest" /> -->
					</button>
				</li>
				{/if}
			</ul>
		</div>
	{/if}
</div>			