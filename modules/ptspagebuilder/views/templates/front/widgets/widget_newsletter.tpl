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
<!-- Block Newsletter module-->
<div id="newsletter_block_footer" class="block pts-newsletter {$addition_cls} {if isset($stylecls)&&$stylecls}block-{$stylecls}{/if}">
{if $newsletter_style == 'newsletter-v1'}
    <div class="newsletter-v1">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                    <h4 class="newsletter-label">{if isset($widget_heading)&&!empty($widget_heading)}{$widget_heading}{else}{l s='Sign up for newsletter' mod='ptspagebuilder'}{/if}</h4>
                    {if $information}
                        <p>{$information}</p>
                    {/if}
                </div>
                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                    <form action="{$link->getPageLink('index', null, null, null, false, null, true)|escape:'html':'UTF-8'}" method="post">
                        <div class="input-group">
                            <input   class="form-control " id="newsletter-input-footer" type="text" name="email"  placeholder="{if isset($value) && $value}{$value}{else}{l s='your e-mail' mod='ptspagebuilder'}{/if}" />
                            <input type="hidden" name="action" value="0" />
                            <div class="input-group-btn">
                                <button type="submit" class="btn btn-success btn-lg  space-left-10" name="submitNewsletter" >{l s='Subscribe' mod='ptspagebuilder'}</button>       
                            </div>

                        </div>
                    </form>
                </div>
            </div><!--/end row-->
        </div><!--/end container-->
    </div>
{elseif $newsletter_style == 'newsletter-v2'}
    <div class="newsletter-v2 background-img-v3 space-50">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">                
                    <h4 class="newsletter-label">{if isset($widget_heading)&&!empty($widget_heading)}{$widget_heading}{else}{l s='Sign up for newsletter' mod='ptspagebuilder'}{/if}</h4>               
                </div>
                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                    <div class="input-group">
                        <form action="{$link->getPageLink('index', null, null, null, false, null, true)|escape:'html':'UTF-8'}" method="post">
                            <div class="input-group">
                                <input   class="form-control radius-left-5x" id="newsletter-input-footer" type="text" name="email"  placeholder="{if isset($value) && $value}{$value}{else}{l s='your e-mail' mod='ptspagebuilder'}{/if}" />
                                <input type="hidden" name="action" value="0" />
                                <div class="input-group-btn">
                                    <button type="submit" class="btn btn-default btn-lg radius-right-5x" name="submitNewsletter" >{l s='Subscribe' mod='ptspagebuilder'}</button>       
                                </div>

                            </div>
                        </form>
                    </div>
                </div>
            </div><!--/end row-->
        </div><!--/end container-->
    </div>
{elseif $newsletter_style == 'newsletter-v3'}
    <div class="newsletter-v3 block">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                    <h4 class="newsletter-label title_block  pull-right">{if isset($widget_heading)&&!empty($widget_heading)}{$widget_heading}{else}{l s='Newsletter' mod='ptspagebuilder'}{/if}</h4>
                    {if $information}
                        <p class="text-muted">{$information}</p>
                    {/if}
                </div>
                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 block_content">
                    <form action="{$link->getPageLink('index', null, null, null, false, null, true)|escape:'html':'UTF-8'}" method="post">
                        <div class="input-group">
                            <input   class="form-control " id="newsletter-input-footer" type="text" name="email"  placeholder="{if isset($value) && $value}{$value}{else}{l s='your e-mail' mod='ptspagebuilder'}{/if}" />
                            <input type="hidden" name="action" value="0" />
                            <div class="input-group-btn">
                                <button type="submit" class="btn btn-default btn-newsletter space-left-10" name="submitNewsletter" >{l s='Subscribe' mod='ptspagebuilder'}</button>       
                            </div>
                        </div>
                    </form>
                    {if isset($msg) && $msg}
                        <p class="{if $nw_error}warning_inline{else}success_inline{/if}">{$msg}</p>
                    {/if}
                </div>
            </div><!--/end row-->
        </div><!--/end container-->
    </div>
{elseif $newsletter_style == 'newsletter-v4'}
    <div class="newsletter-v4 newsletter-center space-50">
        <div class="container">
            <div class="newsletter-heading">
                <h2>{if isset($widget_heading)&&!empty($widget_heading)}{$widget_heading}{else}{l s='Newsletter' mod='ptspagebuilder'}{/if}</h2>
                {if $information}
                    <p>{$information}</p>
                {/if}
            </div>
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-6 col-md-offset-3 input-group">
                    <form action="{$link->getPageLink('index', null, null, null, false, null, true)|escape:'html':'UTF-8'}" method="post">
                        <input   class="form-control radius-left-5x" id="newsletter-input-footer" type="text" name="email"  placeholder="{if isset($value) && $value}{$value}{else}{l s='your e-mail' mod='ptspagebuilder'}{/if}" />
                        <input type="hidden" name="action" value="0" />
                        <div class="input-group-btn">
                            <button type="submit" class="btn btn-success btn-lg radius-right-5x" name="submitNewsletter" >{l s='Subscribe' mod='ptspagebuilder'}</button>       
                        </div>
                    </form>
                </div>
            </div><!--/end row-->    
        </div><!--/end container-->
    </div>
{elseif $newsletter_style == 'newsletter-v5'}
    <div class="newsletter-v5 newsletter-center space-50">
        <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                    <h4 class="newsletter-label">{l s='Sign up for newsletter' mod='ptspagebuilder'}</h4>
                    {if $information}
                        <p>{$information}</p>
                    {/if}
                </div>
                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                    <form action="{$link->getPageLink('index', null, null, null, false, null, true)|escape:'html':'UTF-8'}" method="post">
                        <div class="input-group">
                            <input   class="form-control " id="newsletter-input-footer" type="text" name="email"  placeholder="{if isset($value) && $value}{$value}{else}{l s='your e-mail' mod='ptspagebuilder'}{/if}" />
                            <input type="hidden" name="action" value="0" />
                            <div class="input-group-btn">
                                <button type="submit" class="btn btn-success btn-lg  space-left-10" name="submitNewsletter" >{l s='Subscribe' mod='ptspagebuilder'}</button>       
                            </div>

                        </div>
                    </form>
                </div>
            </div><!--/end row-->
    </div>
{elseif $newsletter_style == 'newsletter-v6'}
    <div class="newsletter-v6 bg-primary light-style space-50">
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-3 col-md-offset-1 text-right xs-space-20">                
                <h4 class="newsletter-label">{if isset($widget_heading)&&!empty($widget_heading)}{$widget_heading}{else}{l s='Get the Latest News' mod='ptspagebuilder'}{/if}</h4>
                {if $information}
                    <p>{$information}</p>
                {/if}
            </div>
            <div class="col-xs-12 col-sm-12 col-md-6">
                <form action="{$link->getPageLink('index', null, null, null, false, null, true)|escape:'html':'UTF-8'}" method="post">
                    <div class="input-group">
                        <input class="form-control inputNew newsletter-input radius-left-5x" id="newsletter-input-footer" type="text" name="email"  placeholder="{if isset($value) && $value}{$value}{else}{l s='your e-mail' mod='ptspagebuilder'}{/if}" />
                        <input type="hidden" name="action" value="0" />
                        <div class="input-group-btn">
                            <button type="submit" class="btn btn-lg btn-outline-light radius-right-5x" name="submitNewsletter" >{l s='Subscribe' mod='ptspagebuilder'}</button>       
                        </div>
                    </div>
                </form>
            </div>
        </div><!--/end row-->
    </div><!--/end container-->
{elseif $newsletter_style == 'newsletter-v7'}
    <div class="newsletter-v7 newsletter-border background-img-v3 space-50">
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-3 col-md-offset-1 text-right xs-space-20">
                <span class="special-label">{if isset($widget_heading)&&!empty($widget_heading)}{$widget_heading}{else}{l s='Newsletter:' mod='ptspagebuilder'}{/if}</span>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-6">
                <form action="{$link->getPageLink('index', null, null, null, false, null, true)|escape:'html':'UTF-8'}" method="post">
                    <div class="input-group">
                        <input class="form-control inputNew newsletter-input radius-left-5x" id="newsletter-input-footer" type="text" name="email"  placeholder="{if isset($value) && $value}{$value}{else}{l s='your e-mail' mod='ptspagebuilder'}{/if}" />
                        <input type="hidden" name="action" value="0" />
                        <div class="input-group-btn">
                            <button type="submit" class="btn btn-lg btn-default radius-right-5x" name="submitNewsletter" >{l s='Subscribe' mod='ptspagebuilder'}</button>       
                        </div>
                    </div>
                </form>
            </div>
        </div><!--/end row-->
    </div><!--/end container-->
{elseif $newsletter_style == 'newsletter-v8'}
        <div class="newsletter-v8">
            {if isset($widget_heading)&&!empty($widget_heading)}
                <h4 class="title_block">{$widget_heading}</h4>
            {/if}
            {if $information}
                {$information}
            {/if}   
            <form action="{$link->getPageLink('index', null, null, null, false, null, true)|escape:'html':'UTF-8'}" method="post">
                <div class="input-group newsletter-group">
                    <span>{l s='Subscribe' mod='ptspagebuilder'}</span>
                    <input class="newsletter-input form-control" id="newsletter-input-footer" type="text" name="email"  placeholder="{if isset($value) && $value}{$value}{else}{l s='Your email...' mod='ptspagebuilder'}{/if}" />
                    <div class="input-group-btn">
                        <input type="hidden" name="action" value="0" />
                            <button type="submit" class="btn btn-newsletter" name="submitNewsletter" ><i class="icon icon-angle-right"></i></button> 
                    </div>      
                </div>
            </form>
        </div>
{/if}
</div>
<!-- /Block Newsletter module-->
 


<script type="text/javascript">
    var placeholder = "{l s='Your email...' mod='ptspagebuilder' js=1}";
    {literal}
        $(document).ready(function() {
            $('#newsletter-input-footer').on({
                focus: function() {
                    if ($(this).val() == placeholder) {
                        $(this).val('');
                    }
                },
                blur: function() {
                    if ($(this).val() == '') {
                        $(this).val(placeholder);
                    }
                }
            });

            $("#newsletter_block_footer form").submit( function(){  
                if ( $('#newsletter-input-footer').val() == placeholder) {
                    $("#newsletter_block_footer .alert").removeClass("hide");
                    return false;
                }else {
                     $("#newsletter_block_footer .alert").addClass("hide");
                     return true;
                }
            } );
        });

    {/literal}
</script>