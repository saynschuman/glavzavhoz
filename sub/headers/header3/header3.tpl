{**************************************
	     HEADER 2
***************************************}

	<header id="header" class="header3">
		<div id="topbar" class="topbar">
			<div class="container">
				{hook h="displayNav"}
			</div>
		</div>	
		<div  id="header-main" class="header">
			<div class="container">
				<div class="row">
					<div id="header_logo" class="col-xs-12 col-sm-8 col-md-3 col-lg-3 inner">
						<div id="logo-theme" class="{if Configuration::get('PTS_CP_LOGOTYPE') == 'logo-theme'}logo-theme{else}logo-store{/if}">
							<a href="{$base_dir}" title="{$shop_name|escape:'html':'UTF-8'}">
								<img class="logo img-responsive {if Configuration::get('PTS_CP_LOGOTYPE') == 'logo-theme'}hidden{/if}" src="{$logo_url}" alt="{$shop_name|escape:'html':'UTF-8'}"/>
							</a>
						</div>
					</div>
					{if class_exists('PtsthemePanel')}
						<div class=" hidden-xs hidden-sm col-xs-12 col-sm-12 col-md-6 col-lg-6">						
							{plugin module='blockcontact' hook='displayNav'}
						</div>						   
					{/if}
					{if isset($HOOK_TOP)}
						<div class="header-right col-xs-12 col-sm-4 col-md-3 col-lg-3">
							{$HOOK_TOP}
						</div>
					{/if}							
				</div>
			</div>	
		</div>
	    <div  id="pts-mainnav">
	        <div class="container">
	        	<div class="wrap">
		        	<div class="inner">
			        	<div class="row">
			        		<div class="main-menu col-xs-12 col-sm-12 col-md-9 col-lg-9">
						        {hook h="displayMainmenu"}
						    </div>
						    {if class_exists('PtsthemePanel')}
						    	<div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
									{plugin module='blocksearch' hook='displayTop'}
						    	</div>		
							{/if}
						</div>
					</div>
				</div>
	        </div>
	    </div>
	</header>