<!-- Block payment logo module -->
<div id="paiement_logo_block_left" class="block paiement_logo_block col-xs-12 col-sm-6 col-md-3">
	<p class="title_block"><span>{l s='We accept' mod='blockpaymentlogo'}</span></p>
	<div class="toggle-footer">
		<a href="{$link->getCMSLink($cms_payement_logo)|escape:'html'}">
			<img src="{$img_dir}logo_paiement_visa.jpg" alt="visa" width="33" height="21" />
			<img src="{$img_dir}logo_paiement_mastercard.jpg" alt="mastercard" width="32" height="21" />
			<img src="{$img_dir}logo_paiement_paypal.jpg" alt="paypal" width="61" height="21" />
		</a>
	</div>
</div>
<!-- /Block payment logo module -->