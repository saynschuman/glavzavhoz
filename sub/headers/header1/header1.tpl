{**************************************
	     HEADER 1
***************************************}

	<header id="header" class="header1">
		<!-- <div id="topbar" class="topbar">
			<div class="container">
			</div>
		</div> -->
		<div  id="header-main" class="header">
			<div class="container">
				<div class="row">
					<div id="header_logo" class="col-xs-12 col-sm-12 col-md-3 col-lg-3 inner">
						<div id="logo-theme" class="{if Configuration::get('PTS_CP_LOGOTYPE') == 'logo-theme'}logo-theme{else}logo-store{/if}">
							<a href="{$base_dir_ssl}" title="{$shop_name|escape:'html':'UTF-8'}">
								<img class="logo img-responsive {if Configuration::get('PTS_CP_LOGOTYPE') == 'logo-theme'}hidden{/if}" src="{$logo_url}" alt="{$shop_name|escape:'html':'UTF-8'}"/>
							</a>
						</div>
					</div>
	        		<div class="main-menu col-xs-12 col-sm-12 col-md-9 col-lg-9">
					<div class="phone">
					    <p class="tel-number">+7&nbsp;(812)&nbsp;<span>320-04-05</span></p>
						<div class="free-number-wrap">
							<p class="left-paragraph">График работы:</p>
							<p class="free-number">Пн-Пт: с 10:00 до 18:00</p>
						</div>
					</div>
				        {hook h="displayMainmenu"}
				    </div>
				</div>
			</div>
		</div>
	    <div  id="pts-mainnav">
	        <div class="container">
	        	<div class="wrap">
		        	<div class="inner">
			        	<div class="row">
						    {if class_exists('PtsthemePanel')}
						       <div class="left verticalmenu col-xs-6 col-sm-4 col-md-3 col-lg-3">
									{plugin module='ptsverticalmenu' hook='displayLeftColumn'}
						    	</div>
							{/if}
							{if class_exists('PtsthemePanel')}
								<div id="search-main" class="search-main col-xs-12 col-sm-12 col-md-5 col-lg-6">
									{plugin module='ptsblocksearch' hook='displayTop'}
								</div>
							{/if}
							<div class="header-right col-xs-6 col-sm-8 col-md-4 col-lg-3">
								<button id="toggle-search" class="header__but header__but_search"></button>
								{hook h="displayNav"}
								{if isset($HOOK_TOP)}
									{$HOOK_TOP}
								{/if}
							</div>
						</div>
					</div>
				</div>
	        </div>
	    </div>


	</header>
