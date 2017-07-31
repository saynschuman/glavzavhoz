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
<div id="{$mapid}" style="width:{$width}; height:{$height};"></div>
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js"></script>

<script type="text/javascript">
	function initialize()
	{
	  var mapProp = {
	    center: new google.maps.LatLng({$latitude},{$longitude}),
	    zoom:{$zoom},
	    mapTypeId: google.maps.MapTypeId.{$map_type}
	  };
	  var map = new google.maps.Map(document.getElementById("{$mapid}"),mapProp);
	}

	google.maps.event.addDomListener(window, 'load', initialize);
</script>