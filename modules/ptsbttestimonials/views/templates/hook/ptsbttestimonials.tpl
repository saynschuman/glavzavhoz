<div id="ptsbttestimonials{$ptsbttestimonials_modid}" class="carousel slide ptsbttestimonials products-rows">
<!-- 	<div class="title_block">{l s="What clients say"}</div>	 -->
	<div class="block_content">
	{if count($get_testimonials) > 1}
		
		 <div class="carousel-controls">
             <a class="carousel-control left" href="#ptsbttestimonials{$ptsbttestimonials_modid}" data-slide="prev">&lsaquo;</a>
			<a class="carousel-control right" href="#ptsbttestimonials{$ptsbttestimonials_modid}" data-slide="next">&rsaquo;</a>
         </div>
	{/if}
		<div class="carousel-inner">
			{$mproducts=array_chunk($get_testimonials, 2)}
			{foreach from=$mproducts item=testimonials name=testimonial}
				<div class="{if isset($active) && $active == 1} active{/if} item {if $smarty.foreach.testimonial.first}active{/if}">
					<div class="row">
					{foreach from=$testimonials item=test name=test_testimonial}
						<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 fadeInRight wow">
							
							<div class="media-list testimonial-item ">
								<div class="media">
									{if isset($test.avatar) && $test.avatar neq "" }
										<div class="t-avatar pull-left">
											<img  style="width:{$config_testimonials.media_width}px; height:{$config_testimonials.media_height}px;" src="{$config_testimonials.img_link}{$test.avatar}" alt="{$test.note}" />
											{if isset($test.media_code) && $test.media_code neq "" }
												 <a class="fancybox-media" href="{$test.media_code|escape:'html':'UTF-8'}"><span class="icon icon-camera"></span></a>
											{/if}
										</div>
									{/if}
								
									<div class="media-body testimonial-body">	
										<!-- {if $test.name } 
											<div class="t-profile">	
												<h3 class="name">{$test.name} </h3>
												<div class="job">{$test.address}</div>	
											</div>
										{/if} -->
										{if $test.content}
											<div class="test-info">
												{$test.content}
											</div>
										{/if}
									</div>
								
								</div>	
							</div>		

						</div>
					{/foreach}
					</div>
				</div>
			{/foreach}
		</div>
	</div>
{*<ol class="carousel-linked-nav pagination">
	{foreach from=$get_testimonials item=test name=testimonial}
  		<li {if $smarty.foreach.testimonial.index == 0}class="active"{/if}>
  			<a href="#{$smarty.foreach.testimonial.index+1}" title="{$smarty.foreach.testimonial.index+1}"></a>
  		</li>
 	{/foreach}
</ol>*}
	<script type="text/javascript">
	$(document).ready(function() {
		$('.fancybox-media').fancybox({
			openEffect  : 'none',
			closeEffect : 'none',
			helpers : {
				media : {}
			}
		});


		$('.carousel-linked-nav > li > a').click(function() {
		    var item = Number($(this).attr('href').substring(1));
		    $('#ptsbttestimonials{$ptsbttestimonials_modid}').carousel(item - 1);
		    $('.carousel-linked-nav .active').removeClass('active');
		    $(this).parent().addClass('active');
		    return false;
		});

		$('#ptsbttestimonials{$ptsbttestimonials_modid}').bind('slid', function() {
		    $('.carousel-linked-nav .active').removeClass('active');
		    var idx = $('#ptsbttestimonials{$ptsbttestimonials_modid} .item.active').index();
		    $('.carousel-linked-nav li:eq(' + idx + ')').addClass('active');
		});


	});


	</script>

</div>