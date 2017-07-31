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
<div class="pricing-table  {$class} text-center">
	<div class="pricing-heading">
		<h4 class="no-margin">{$widget_heading}</h4>
		<div class="plan-price" ><sup class="plan-currency"></sup> <span><?php echo $price; ?></span> / <sup class="plan-period">{$period}</sup> </div>
	</div>
	<div class="pricing-body">
		 <div class="plain-info">
			 {$content}
		</div>
	</div>
	<div class="pricing-footer"><a class="btn btn-lg btn-block btn-outline plan-link" href="<?php echo $link; ?>">{$linktitle}</a></div>
</div>


