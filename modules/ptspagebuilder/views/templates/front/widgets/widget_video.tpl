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
{if isset($video_link)}
<div class="widget block widget-video {if isset($stylecls)&&$stylecls}block-{$stylecls}{/if}">
 {if isset($widget_heading)&&!empty($widget_heading)}
 <h4 class="widget-heading title_block">
  {$widget_heading}
 </h4>
 {/if}
 <div class="widget-inner block_content">
  <iframe src="{$video_link}" style="width:{$width};height:{$height};" allowfullscreen="true"></iframe>
  {if $subinfo}
  <div>{$subinfo}</div>
  {/if}
 </div>
</div>
{/if}