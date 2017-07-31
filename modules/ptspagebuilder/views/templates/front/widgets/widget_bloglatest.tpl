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

<!-- MODULE Block ptsblockblogstabs --> 

{if !empty($blogs )}
<div id="ptsblockblogstabs{$tabname}" class="widget-latestblog block {$addition_cls} {if isset($stylecls)&&$stylecls}block-{$stylecls}{/if}">
	{if isset($widget_heading)&&!empty($widget_heading)}
		<h4 class="title_block">
			{$widget_heading}
		</h4>
	{/if}
	<div class="block_content">	
		<div class="slide carousel" id="{$tabname}">
			{if count($blogs)>$itemsperpage}
				<div class="carousel-controls">
					<a class="carousel-control left" href="#{$tabname}" data-slide="prev"><i class="icon icon-prev"></i></a>
					<a class="carousel-control right" href="#{$tabname}" data-slide="next"><i class="icon icon-next"></i></a>
		        </div>
			{/if}
			<div class="carousel-inner">
			{$mblogs=array_chunk($blogs,$itemsperpage)}
			{foreach from=$mblogs item=blogs name=mypLoop}
				<div class="item {if $smarty.foreach.mypLoop.first}active{/if}">
						{foreach from=$blogs item=blog name=blogs}
						{if $blog@iteration%$columnspage==1&&$columnspage>1 || $columnspage== 1}
						  <div class="row">
						{/if}
						<div class="col-xs-12 col-sm-{if $list_mode == 'grid'}6{else}12{/if} col-md-{$scolumn} col-lg-{$scolumn} blog_block ajax_block_blog {if $smarty.foreach.blogs.first}first_item{elseif $smarty.foreach.blogs.last}last_item{/if}">
							{if $list_mode == 'grid'}
								<div class="blog_container grid clearfix">	
									{if $blog.image && $show_image}
									<div class="blog-image">
										<a href="{$blog.link|escape:'html':'UTF-8'}" title="{$blog.title|escape:'html':'UTF-8'}" class="link">
											<img src="{$blog.preview_url}" title="{$blog.title}" class="img-responsive"/>
										</a>
									</div>
									{/if}
									<div class="blog_inner">
										{if $show_title_blog}
											<h5 class="clearfix blog-title">
												<a href="{$blog.link|escape:'html':'UTF-8'}" title="{$blog.title}">{$blog.title}</a>
											</h5>
										{/if}
										{if $show_dateadd || $show_comment}
											<div class="blog-meta">
												{if $show_category}
													<span class="blog-cat"> <span class="icon-list">{l s='In' mod='ptspagebuilder'}</span> 
														<a href="{$blog.category_link|escape:'html':'UTF-8'}" title="{$blog.category_title|escape:'html':'UTF-8'}">{$blog.category_title}</a>
													</span>
												{/if}
												{if $show_dateadd}
													<span class="blog-created"><span class=""></span>
														{strtotime($blog.date_add)|date_format:"%A, %B %e, %Y"}
													</span>
												{/if}
												{if $show_comment}<span class="blog-ctncomment">
													<span class="icon-comment"> {l s='Comment' mod='ptspagebuilder'}:</span> {$blog.comment_count}</span>
												{/if}
											</div>
										{/if}

										{if $show_description}
											<div class="blog-shortinfo">
												{$blog.description|strip_tags|truncate:170}
											</div>
										{/if}
										{if $show_readmore}
											<div class="readmore">
												<p>
													<a href="{$blog.link|escape:'html':'UTF-8'}" title="{$blog.title|escape:'html':'UTF-8'}" class="btn-link">{l s='Read more' mod='ptspagebuilder'}</a>
												</p>
											</div>
										{/if}
									</div>
								</div>
							{else}
								<div class="blog_container clearfix media list">	
									<div class="blog-image pull-left">
										<a href="{$blog.link|escape:'html':'UTF-8'}" title="{$blog.title|escape:'html':'UTF-8'}" class="link">
											{if $blog.image && $show_image}
												<img src="{$blog.preview_url}" title="{$blog.title}" class="img-responsive"/>
											{else}
												<i class="icon icon-pencil"></i>
											{/if}
										</a>
									</div>

									<div class="media-body">

										{if $show_title_blog}
											<h5 class="clearfix blog-title">
												<a href="{$blog.link|escape:'html':'UTF-8'}" title="{$blog.title}">{$blog.title}</a>
											</h5>
										{/if}
										<div class="blog-meta">
											{if $show_category}
												<span class="blog-cat"> <span class="icon-list">{l s='In' mod='ptspagebuilder'}</span> 
													<a href="{$blog.category_link}" title="{$blog.category_title|escape:'html':'UTF-8'}">{$blog.category_title}</a>
												</span>
											{/if}
											{if $show_dateadd}
												<span class="blog-created">
													{strtotime($blog.date_add)|date_format:" %e %b, %Y"}
												</span>
											{/if}
											{if $show_comment}
												<span class="blog-ctncomment">
													{$blog.comment_count}<span class="blog-comment"> {l s='Comment' mod='ptspagebuilder'}:</span> 
												</span>
											{/if}
										</div>
										{if $show_description}
											<div class="blog-shortinfo">
												{$blog.description|strip_tags|truncate:360}
											</div>
										{/if}
										{if $show_readmore}
											<div class="readmore">
												<p>
													<a href="{$blog.link|escape:'html':'UTF-8'}" title="{$blog.title|escape:'html':'UTF-8'}" class="btn-link">{l s='Read more' mod='ptspagebuilder'}</a>
												</p>
											</div>
										{/if}
									</div>
								</div>
							{/if}
						</div>
						
						{if ($blog@iteration%$columnspage==0||$smarty.foreach.blogs.last)&&$columnspage>1 || $columnspage== 1}
							</div>
						{/if}
							
						{/foreach}
				</div>		
			{/foreach}
			</div>
		</div>
		{if $config->get('blockpts_blogs_show',1)}
			<div class="link-view">
				<a class="pull-right btn" href="{$view_all_link|escape:'html':'UTF-8'}" title="{l s='View All' mod='ptspagebuilder'}">
					<span>{l s='View All' mod='ptspagebuilder'}</span>
				</a>
			</div>
		{/if}	
	</div>
</div>

<!-- /MODULE Block ptsblockblogstabs -->
<script type="text/javascript">
$(document).ready(function() {
    $('{$tabname}').each(function(){
        $(this).carousel({
            pause: true,
            interval: {$interval}
        });
    });
});
</script>
{/if}