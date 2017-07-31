<!DOCTYPE HTML>
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7"{if isset($language_code) && $language_code} lang="{$language_code|escape:'html':'UTF-8'}"{/if}><![endif]-->
<!--[if IE 7]><html class="no-js lt-ie9 lt-ie8 ie7"{if isset($language_code) && $language_code} lang="{$language_code|escape:'html':'UTF-8'}"{/if}><![endif]-->
<!--[if IE 8]><html class="no-js lt-ie9 ie8"{if isset($language_code) && $language_code} lang="{$language_code|escape:'html':'UTF-8'}"{/if}><![endif]-->
<!--[if gt IE 8]> <html class="no-js ie9"{if isset($language_code) && $language_code} lang="{$language_code|escape:'html':'UTF-8'}"{/if}><![endif]-->
<html{if isset($language_code) && $language_code} lang="{$language_code|escape:'html':'UTF-8'}" {/if} dir="{$LANG_DIRECTION}" class="{$LANG_DIRECTION}">
	<head>
		{literal}
		<!-- Google Tag Manager -->
		<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
		new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
		j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
		'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
		})(window,document,'script','dataLayer','GTM-MGXSCSX');</script>
		<!-- End Google Tag Manager -->
		{/literal}

		<meta charset="utf-8" />
		<title>{$meta_title|escape:'html':'UTF-8'}{if isset($product->name)}, купить по низкой цене{/if}</title>

		<meta name="description" content="{if isset($meta_description) AND $meta_description}{$meta_description|escape:'html':'UTF-8'}{elseif isset($product->name)}Покупайте {$product->name|escape:'html':'UTF-8'} по доступной цене в интернет-магазине ГлавЗавХоз, +7(812) 320-04-05{elseif isset($category->name)}{$category->name|escape:'html':'UTF-8'}, купить {$category->name|escape:'html':'UTF-8'} в Санкт-Петербурге, низкие цены в интернет-магазине{else}ГлавЗавХоз - это  низкие цены, доставка заказов по Санкт-Петербургу, все виды оплаты. Выбирайте лучшее!{/if}" />

{if isset($meta_keywords) AND $meta_keywords}
		<meta name="keywords" content="{$meta_keywords|escape:'html':'UTF-8'}" />
{/if}
		<meta name="robots" content="{if isset($nobots)}no{/if}index,{if isset($nofollow) && $nofollow}no{/if}follow" />
		<meta name="viewport" content="width=device-width, minimum-scale=0.25, maximum-scale=1.6, initial-scale=1.0" />
		<meta name="apple-mobile-web-app-capable" content="yes" />
		<link rel="icon" type="image/vnd.microsoft.icon" href="{$favicon_url}?{$img_update_time}"/>
		<link rel="shortcut icon" type="image/x-icon" href="{$favicon_url}?{$img_update_time}" />

        {if isset($link_canonical)}
			<link rel="canonical" href="{$link_canonical}"/>
            {if isset($link_prev)}
			<link rel="prev" href="{$link_prev}" />
            {/if}
            {if isset($link_next)}
			<link rel="next" href="{$link_next}" />
            {/if}
        {/if}

{if isset($css_files)}
	{foreach from=$css_files key=css_uri item=media}
		{if preg_match("#global#",$css_uri)}
		<link rel="stylesheet" href="{$css_uri|escape:'html':'UTF-8'}"  id="global-style" type="text/css" media="{$media|escape:'html':'UTF-8'}" />

		{else}
		<link rel="stylesheet" href="{$css_uri|escape:'html':'UTF-8'}" type="text/css" media="{$media|escape:'html':'UTF-8'}" />
		{/if}
	{/foreach}
	<link rel="stylesheet" href="/themes/pf_golmart/css/blizzart.css"  id="global-style" type="text/css" />
{/if}
{if isset($js_defer) && !$js_defer && isset($js_files) && isset($js_def)}
	{$js_def}
	{foreach from=$js_files item=js_uri}
	<script type="text/javascript" src="{$js_uri|escape:'html':'UTF-8'}"></script>
	{/foreach}
{/if}
	<script src="http://cdnjs.cloudflare.com/ajax/libs/noUiSlider/6.2.0/jquery.nouislider.min.js"></script>
		{$HOOK_HEADER}
		<link rel="stylesheet" href="http{if Tools::usingSecureMode()}s{/if}://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700&amp;subset=latin,latin-ext" type="text/css" media="all" />
		<link rel="stylesheet" href="http{if Tools::usingSecureMode()}s{/if}://fonts.googleapis.com/css?family=Rhodium+Libre&amp;subset=latin,latin-ext" type="text/css" media="all" />
		<!--[if IE 8]>
		<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
		<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
		<![endif]-->

	</head>
	<body{if isset($page_name)} id="{$page_name|escape:'html':'UTF-8'}"{/if} class="{if isset($page_name)}{$page_name|escape:'html':'UTF-8'}{/if}{if isset($body_classes) && $body_classes|@count} {implode value=$body_classes separator=' '}{/if}{if $hide_left_column} hide-left-column{/if}{if $hide_right_column} hide-right-column{/if}{if isset($content_only) && $content_only} content_only{/if} lang_{$lang_iso} layout-{$DEFAUTL_LAYOUT}" >

	{literal}
	<!-- Google Tag Manager (noscript) -->
	<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-MGXSCSX"
	height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
	<!-- End Google Tag Manager (noscript) -->
	{/literal}

	<div id="lightbox" class="lightboxs"></div><!-- /#lightbox /.lightboxs -->
	{if !isset($content_only) || !$content_only}
		{if isset($restricted_country_mode) && $restricted_country_mode}
			<div id="restricted-country">
				<p>{l s='You cannot place a new order from your country.'} <span class="bold">{$geolocation_country|escape:'html':'UTF-8'}</span></p>
			</div>
		{/if}

		<div id="page">
			{capture name='displayBanner'}{hook h='displayBanner'}{/capture}
			{if $smarty.capture.displayBanner}
				<div  class="banner hidden-xs hidden-sm">
					<div class="container">
						{$smarty.capture.displayBanner}
					</div>
				</div>
			{/if}
			{if !isset($header_cp)}
				{$header_cp = Configuration::get('PTS_CP_HEADER')}
			{/if}
			{if $header_cp && file_exists("$CURRENT_THEMEDIR./sub/headers/{$header_cp}/{$header_cp}.tpl")}
				{include file="$CURRENT_THEMEDIR./sub/headers/{$header_cp}/{$header_cp}.tpl" page_name_skin=$page_name}

			{/if}
			<div class="container">
				<div class="row">
					<ul id="navs_info" class="navs navs_info navs_flex">
							<!-- global.js -->
					</ul><!--  /.navs navs_info navs_flex -->
				</div><!--  /.row -->
			</div><!--  /.container -->
    		{if $page_name !='index' && $page_name !='pagenotfound'}
				<div id="breadcrumb">
					{include file="$tpl_dir./breadcrumb.tpl"}
				</div>
			{/if}

            {if Configuration::get('PTS_CP_ENABLE_PBUILDER')&&isset($PTS_PAGEBUILDER_ACTIVED)&&$PTS_PAGEBUILDER_ACTIVED&&$PTS_PAGEBUILDER_FULL}
            	<div id="columns" class="pagebuilder-content {$header_cp}">
            		<div id="page-fader"></div>

					{$PTS_PAGEBUILDER_CONTENT}
			{else}
			{if $page_name =='index'}
           		<div  id="pts-slideshow" class="slideshow">
		                {hook h="displayslideshow"}
           		</div>
            {/if}
            {if $page_name =='index'}
	          	<div  id="pts-promotion-top" class="promotion-top">
					<div class="container">
			            {hook h="displaypromotetop"}
			        </div>
	            </div>
            {/if}
			<div id="columns" class="offcanvas-siderbars">
				{if $page_name =='index'}
					<div id="top_column" class="top_column ">
						<div class="container">{hook h="displayTopColumn"}</div>
					</div>
				{/if}
				<div class="main-content">
					<div class="main-content-inner">
						<div class="container goods-card">
							<div class="row">

							{if isset($category->name) & !isset($product->name)}<h1 class="page-h1 page-heading">{$category->name|escape:'html':'UTF-8'}{if isset($categoryNameComplement)}{$categoryNameComplement|escape:'html':'UTF-8'}{/if}</h1>{/if}

				{if !isset($product->name) && !empty($category->description) && ((isset($p) && $p <= 1) || !isset($p))}
                   <div class="cat_desc">
                        <div id="category_description_short" class="rte">{$category->description}</div>
                   </div>
               {/if}

			   {if !isset($product->name) && !empty($category->name) && $p <= 1 && empty($category->description) && !isset($subcategories)}
			       <div class="cat_desc">
			           <div id="category_description_short" class="rte">Выбрать и купить {$category->name} по лучшим ценам из широкого ассортимента товаров вы можете в интернет-магазине Glavzavhoz.ru. Доставка по Санкт-Петербургу от 5000 абсолютно бесплатна. 89% заказов мы доставляем в течение 36 часов с момента оформления. Оплатить {$category->name} вы можете любым удобным способом — наличными при получении, банковской картой онлайн или по безналичному расчету.</div>
                   </div>
			   {/if}
							{if isset($left_column_size) && isset($right_column_size)}{assign var='cols' value=(12 - $left_column_size - $right_column_size)}{else}{assign var='cols' value=12}{/if}
							<div id="slidercont">
							<div id="center_column" class="center_column col-xs-12 col-sm-12 col-md-{$cols|intval} col-lg-{$cols|intval}">
			<div class="theiaStickySidebar">
								<div id="content">

				{/if}
			{/if}
