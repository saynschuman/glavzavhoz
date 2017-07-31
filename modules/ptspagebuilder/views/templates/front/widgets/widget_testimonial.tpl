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


{if $testimonials}

<!-- Block categories module -->
<div class="block {$addition_cls} {if isset($stylecls)&&$stylecls}block-{$stylecls}{else}block-borderbox{/if}">
	{if isset($widget_heading)&&!empty($widget_heading)}
	<div class="widget-heading title_block">
		{$widget_heading}
	</div>
	{/if}
	<div class="block_content {$testimonial_style}">
		{$mtestimonials = array_chunk($testimonials,$itemsperpage)}
		{$scolumn=floor(12/$column)}
		<div class="boxcarousel slide bs-docs-carousel-example testimonials-carousel" id="carousel-{$testimonial_key}">
			{if count($products)>$itemsperpage}
				<div class="carousel-controls">
					<a class="carousel-control carousel-sm radius-x left" href="#carousel-{$testimonial_key}" data-slide="prev"><span class="icon-prev"></span></a>
					<a class="carousel-control carousel-sm radius-x right" href="#carousel-{$testimonial_key}" data-slide="next"><span class="icon-next"></span></a>
		        </div>
			{/if}
			<div class="carousel-inner">
				{foreach from=$mtestimonials item=testimonial name=name_testimonial}
				<div class="item {if $smarty.foreach.name_testimonial.first}active{/if}">
					<div class="row">
			            <div class="col-xs-12 col-sm-12 col-md-{$scolumn} col-lg-{$scolumn}">
							{foreach $testimonial as $test}
								{if $testimonial_style == 'testimonials-v1' || $testimonial_style == 'testimonials-v3'}
									<div class="testimonials-{$testimonial_position}">
					                    <div class="testimonials-body">
					                        <div class="testimonials-quote">{$test.content|truncate:90:'...'|escape:'html':'UTF-8'}</div>
					                        <div class="testimonials-profile">
					                            <div class="testimonials-avatar">
					                                {if isset($test.avatar) && $test.avatar neq "" }
														<img class="radius-x img-responsive" src="{$testimonial_img_link}{$test.avatar}" alt="{$test.note}" />
													{/if}
					                            </div> 
					                            <h4 class="name">{$test.name}</h4>
					                            <div class="job">{$test.note}</div>
					                        </div>                    
					                    </div>
					                </div>
				                {elseif $testimonial_style == 'testimonials-v2'}
				                	<div class="testimonials-wrap">
				                        <div class="testimonials-avatar">
				                            {if isset($test.avatar) && $test.avatar neq "" }
												<img class="img-responsive" src="{$testimonial_img_link}{$test.avatar}" alt="{$test.note}" />
											{/if}
				                        </div>
				                        <div class="testimonials-body">
				                            <div class="testimonials-quote">{$test.content}</div>
				                            <div class="testimonials-profile"> 
				                                <h4 class="name">{$test.name}</h4>
				                                <div class="job">{$test.note}</div>
				                            </div>
				                        </div>
				                    </div> 
			                    {elseif $testimonial_style == 'testimonials-v6'}
				                	<div class="testimonials-body">
				                        <p class="testimonials-description">{$test.content}</p>                            
				                        <ul class="testimonials-avatar list-unstyled">
				                            <li class="active">
				                                <a href="#" class="radius-x">
				                                	{if isset($test.avatar) && $test.avatar neq "" }
														<img class="img-responsive radius-x" src="{$testimonial_img_link}{$test.avatar}" alt="{$test.note}" />
													{/if}
												</a>
				                            </li>                       
				                        </ul>                        
				                        <h5 class="testimonials-name">{$test.name}</h5>  
				                        <p class="text-muted testimonials-position">{$test.note}</p>  
				                    </div> 
			                    {elseif $testimonial_style == 'testimonials-v5'}
				                    <div class="testimonials-body">
						                <p class="testimonials-description">{$test.content}</p>                            
						                <h5 class="testimonials-name">{$test.name}</h5>  
						                <p class="text-muted testimonials-position">{$test.note}</p>  
						            </div>
					            {elseif $testimonial_style == 'testimonials-v4'}
				                    <p class="testimonials-description">{$test.content}</p>                
					                <div class="testimonials-avatar radius-x">
					                    {if isset($test.avatar) && $test.avatar neq "" }
											<img class="img-responsive radius-x" src="{$testimonial_img_link}{$test.avatar}" alt="{$test.note}" />
										{/if}
					                </div>
					                <h5 class="testimonials-name">{$test.name}</h5>  
					                <p class="text-muted testimonials-position">{$test.note}</p>   
								{/if}	
							{/foreach}
						</div>
					</div>
				</div>
				{/foreach}
			</div>
		</div>
	</div>
</div>
<!-- /Block categories module -->
{/if}

