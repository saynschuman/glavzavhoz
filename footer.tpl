{if !isset($content_only) || !$content_only}
  			{if Configuration::get('PTS_CP_ENABLE_PBUILDER')&&isset($PTS_PAGEBUILDER_ACTIVED)&&$PTS_PAGEBUILDER_ACTIVED&&$PTS_PAGEBUILDER_FULL}

  				</div ><!-- .columns-container -->
			{else}


							</div>
                            </div><!--  /.theiaStickySidebar -->
						</div><!-- #center_column -->

								{if isset($left_column_size) && !empty($left_column_size)}
									<div id="left_column" class="sidebar column col-xs-12 col-sm-12 col-md-{$left_column_size|intval} col-lg-{$left_column_size|intval} offcanvas-sidebar js-slide-trg">
                                        <div class="theiaStickySidebar">
                                            {$HOOK_LEFT_COLUMN}
                                        </div><!--  /.theiaStickySidebar -->
									</div>
								{/if}

								{if isset($right_column_size) && !empty($right_column_size)}
									<div id="right_column" class="col-xs-12 col-sm-12 col-md-{$right_column_size|intval} column sidebar">{$HOOK_RIGHT_COLUMN}</div>
								{/if}
</div><!-- /#slidercont  -->
							</div><!-- #columns -->
						</div>
					</div>
				</div>
					{if $page_name =='index'}
					<div id="content-bottom">
						<div class="container">
							<div class="row">
								{hook h='displayContentBottom'}
							</div>
						</div>
					</div>
					{/if}
				</div ><!-- .columns-container -->
				<!-- Bottom-->
				{if $page_name =='index'}
					<div id="bottom">
						<div class="container">
							{hook h='displayBottom'}
						</div>
					</div>
				{/if}
			{/if}

			{if isset($PTS_FOOTERBUILDER_CONTENT)&&!empty($PTS_FOOTERBUILDER_CONTENT)}
				<footer id="footer">
					{$PTS_FOOTERBUILDER_CONTENT}
						<div id="pts-footercenter">
							<div class="container">
								<div class="inner">
									<div class="row">
										{$HOOK_FOOTER}
									</div>
								</div>
							</div>
						</div>
				</footer>
			{elseif isset($HOOK_FOOTER)}
			<!-- Footer -->
				<footer id="footer">
					<div id="pts-footer-top" class="footer-top">
						<div class="container">
							<div class="inner">
								{hook h='displayFootertop'}
							</div>
						</div>
					</div>

					<div id="pts-footercenter" class="footer-center">
						<div class="container">
							<div class="inner">
								<div class="row">
									{$HOOK_FOOTER}
								</div>
							</div>
						</div>
					</div>
					<div id="pts-footer-bottom" class="footer-bottom">
						<div class="container">
							<div class="inner">
									{hook h='displayFooterbottom'}
							</div>
						</div>
					</div>
				</footer>
				<div id="powered">
					<div class="container">
						<div class="inner">
							<div class="clearfix">
								<div id="pts-copyright" class="pts-copyright pull-left">
									{if isset($COPYRIGHT)&&$COPYRIGHT}
									<div class="copyright">{$COPYRIGHT}</div>
									{else}
									<span>Copyright By Your Store © {date('Y')}.</span>
									{/if}

								</div>
							</div>
						</div>
					</div>
				</div>
			{/if}

		</div>
		<!-- gototop -->
		<a id="to_top" href="javascript:;" style="display: inline;"><span>&nbsp;</span></a>
		<!-- #page -->
{/if}

{include file="$tpl_dir./global.tpl"}
	<div id="fancybox-compare-add" style="display:none;">
	   <div id="fancybox-html">
	    <div class="msg">{l s='Add product to compare successful'}</div>
	    <a href="{$link->getPageLink('products-comparison')|escape:'html':'UTF-8'}" title="{l s='compare product'}">
	      <strong>{l s='Compare'} </strong>
	    </a>
	   </div>
	  </div>

	  <div id="fancybox-compare-remove" style="display:none;">
	   <div id="fancybox-html1">
	    <div class="msg">{l s='Remove product successful'}</div>
	    <a href="{$link->getPageLink('products-comparison')|escape:'html':'UTF-8'}" title="{l s='compare product'}">
	     <strong>{l s='Click here to compare'}</strong>
	    </a>
	   </div>
	  </div>

<!-- Yandex.Metrika counter --> <script type="text/javascript"> (function (d, w, c) { (w[c] = w[c] || []).push(function() { try { w.yaCounter41152874 = new Ya.Metrika({ id:41152874, clickmap:true, trackLinks:true, accurateTrackBounce:true, webvisor:true, ut:"noindex" }); } catch(e) { } }); var n = d.getElementsByTagName("script")[0], s = d.createElement("script"), f = function () { n.parentNode.insertBefore(s, n); }; s.type = "text/javascript"; s.async = true; s.src = "https://mc.yandex.ru/metrika/watch.js"; if (w.opera == "[object Opera]") { d.addEventListener("DOMContentLoaded", f, false); } else { f(); } })(document, window, "yandex_metrika_callbacks"); </script> <noscript><div><img src="https://mc.yandex.ru/watch/41152874?ut=noindex" style="position:absolute; left:-9999px;" alt="" /></div></noscript> <!-- /Yandex.Metrika counter -->
<!-- BEGIN JIVOSITE CODE {literal} -->
<script type='text/javascript'>
(function(){ var widget_id = 'mBWobSZAl3';var d=document;var w=window;function l(){
var s = document.createElement('script'); s.type = 'text/javascript'; s.async = true; s.src = '//code.jivosite.com/script/widget/'+widget_id; var ss = document.getElementsByTagName('script')[0]; ss.parentNode.insertBefore(s, ss);}if(d.readyState=='complete'){l();}else{if(w.attachEvent){w.attachEvent('onload',l);}else{w.addEventListener('load',l,false);}}})();</script>
<!-- {/literal} END JIVOSITE CODE -->
	</body>
</html>
