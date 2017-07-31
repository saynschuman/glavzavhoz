{*
* 2007-2015 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2015 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

<ul id="contact_block" class="hidden-xs hidden-sm list-inline">
	{if $telnumber}
		<li class="shop-phone {if isset($is_logged) && $is_logged}is_logged{/if}">
			<div class="pull-left contact-icon"><i class="icon icon-phone"></i></div>
			<div class="contact-content">
				<h5 class="contact-title">{l s='Call us' mod='blockcontact'}</h5>
				<div class="contact-detail">
					<span>{$telnumber}</span>
				</div>
			</div>
		</li>
	{/if}
	{if $email != ''}
		<li class="shop-mail {if isset($is_logged) && $is_logged}is_logged{/if}">
			<div class="pull-left contact-icon"><i class="icon icon-envelope-o"></i></div>
			<div class="contact-content">
				<h5 class="contact-title">{l s='Email us' mod='blockcontact'}</h5>
				<div class="contact-detail">
					<a href="mailto:{$email|escape:'html':'UTF-8'}" title="{l s='Contact our expert support team!' mod='blockcontact'}">
						{$email|escape:'html':'UTF-8'}
					</a>
				</div>
			</div>
		</li>
	{/if}
</ul>