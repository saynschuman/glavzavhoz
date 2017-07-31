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
{foreach from=$rows item=row name=row}

    {if $row->level==1}
        <div class="pts-container {$row->cls} {if isset($row->parallax)&&$row->parallax} pts-parallax{/if}" {$row->attrs}>
            <div class="pts-inner container{if $row->fullwidth==1}-fluid{/if}">
    {/if}
    <div class="row-inner row-level-{$row->level}">
        <div class="row {if isset($row->sfxcls)&&$row->sfxcls}row-{$row->sfxcls} {/if} {if $row->level>=2}{$row->cls}{/if} clearfix" >
            {foreach $row->cols as $col}
                <div class="col-lg-{$col->lgcol} col-md-{$col->mdcol} col-sm-{$col->smcol} col-xs-{$col->xscol}">
                    {if $row->level==2}
                   {if isset($row->parallax)&&$row->parallax}

                    <div class="{if isset($row->parallax)&&$row->parallax} pts-parallax{/if}" {$row->attrs}>
                    {/if}
                    {/if}
                        <div class="col-inner {if isset($col->sfxcls)&&$col->sfxcls}col-{$col->sfxcls}{/if} {$col->cls}" {$col->attrs}>
                        {foreach $col->widgets as $widget}
                            {if isset($widget->content)}
                            <div class="widget-{$widget->wtype}">
                                {$widget->content}
                            </div>
                            {/if}
                        {/foreach}
                        {if isset($col->rows)&&$col->rows}
                            {include file="$layout_tpl" rows=$col->rows}
                        {/if}
                        </div>

                      {if $row->level==2}
                   {if isset($row->parallax)&&$row->parallax}

                     </div>
                    {/if}
                    {/if}
            </div>
            {/foreach}
        </div>
    </div>
    {if $row->level==1}
            </div>
        </div>
    {/if}
{/foreach}
