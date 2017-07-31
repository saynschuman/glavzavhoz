<a class="header__but header__but-cabinet" href="{$link->getPageLink('my-account', true)|escape:'html':'UTF-8'}" title="{l s='Login to your customer account' mod='blockuserinfo'}" rel="nofollow">
	<span class="header__but-title">Вход в</span>
	<span>{l s='Login' mod='blockuserinfo'}</span> <!--class="header__but__small-text"-->
</a>

<!-- <div class="btn-group group-userinfo">
	<ul class="list-inline">
		<li id="header_user"> -->
			<!-- Block user information module NAV  -->
			<!-- <ul class="list-style list-inline">
				{if $logged}
					<li>
						<a class="header__but" href="{$link->getPageLink('my-account', true)|escape:'html':'UTF-8'}" title="{l s='View my customer account' mod='blockuserinfo'}" class="account" rel="nofollow"><span class="icon icon-user"></span>&nbsp;&nbsp;<span>{$cookie->customer_firstname} {$cookie->customer_lastname}</span></a>
						<a class="header__but" href="{$link->getPageLink('index', true, NULL, "mylogout")|escape:'html':'UTF-8'}" title="{l s='Log me out' mod='blockuserinfo'}" class="logout" rel="nofollow">({l s='Log out' mod='blockuserinfo'})</a>
					</li>
				{else}
					<li>
						<a class="header__but header__but-cabinet" href="{$link->getPageLink('my-account', true)|escape:'html':'UTF-8'}" title="{l s='Login to your customer account' mod='blockuserinfo'}" rel="nofollow">
							<span class="header__but-title">{l s='Login' mod='blockuserinfo'}</span>
							<span class="header__but__small-text">Вход</span>
						</a>
					</li>
				{/if} -->
				<!-- <li>
					<a class="header__but" href="{$link->getModuleLink('blockwishlist', 'mywishlist', array(), true)|addslashes|escape:'html':'UTF-8'}" title="{l s='My wishlists' mod='blockuserinfo'}"><span class="icon icon-heart"></span>&nbsp;&nbsp;{l s='Wish List' mod='blockuserinfo'}</a>
				</li>
				<li>
					<a class="header__but" href="{$link->getPageLink('products-comparison')|escape:'html':'UTF-8'}" title="{l s='Compare' mod='blockuserinfo'}"><span class="icon icon-refresh"></span>&nbsp;&nbsp;{l s='Compare' mod='blockuserinfo'}</a>
				</li> -->
				<!-- {*<li class="last"><a href="{$link->getPageLink($order_process, true)|escape:'html':'UTF-8'}" title="{l s='Checkout' mod='blockuserinfo'}" class="last"><span class="icon icon-shopping-cart"></span>&nbsp;&nbsp;{l s='Checkout' mod='blockuserinfo'}</a></li>*}
			</ul>
		</li>
	</ul>
</div> -->
