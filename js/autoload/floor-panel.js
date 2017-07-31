/*
 Init scroll panel for tabs
*/
(function($) {

var $floorpanel = false; //Floor panel element
var panel_position = "ltr";
var panel_margin_container = 0; //Margin with container 10px
var container_class = ".pts-container > .container > .row-inner";

var $window = $(window);
var $body = $(document.body);

//Function Strip Html Content
function stripHtml(html)
{
  var tmp = document.createElement("DIV");
  tmp.innerHTML = html;
  return tmp.textContent || tmp.innerText || "";
}

//Function Get Container Element Offset Left and Right
function getContainerMarginLeftRight( fixed_panel_width ) {

  var container_margin_left = (( $(window).width() - parseFloat( $(container_class).first().outerWidth(true) )  ) / 2) - parseFloat( panel_margin_container ) - parseFloat(fixed_panel_width) - 15;
  var container_margin_right = (( $(window).width() - parseFloat( $(container_class).first().outerWidth(true))  ) / 2) - parseFloat( panel_margin_container ) - parseFloat(fixed_panel_width) - 15;

  return [container_margin_left, container_margin_right];
}

$(window).ready( function(){
      var panel_position = $('html').attr('class') ? $('html').attr('class') : "ltr";

      if($(".floor-fixed-panel-play").length > 0) {
            $floorpanel = $('<div id="j-floor-fixed-panel" class="floor-fixed-panel hidden-xs hidden-sm"><ul class="nav floor-nav-list"></ul></div>');
            $(".floor-fixed-panel-play").each( function(){
                var tab_id = $(this).data("index");
                var floor_tab_id = $(this).attr("id");
                var tab_title = $(this).data("title");
                var tab_icon = $(this).data("icon");

                if (tab_id !="" && typeof(tab_id) != "undefined") {

                    tab_icon = (typeof(tab_icon) != "undefined")?tab_icon:"";
                    tab_title = (typeof(tab_title) != "undefined")?tab_title:"";
                    tab_title = tab_title;

                    var $panelitem = $('<li class="nav-'+tab_id+'"><a class="floor-skin-'+tab_id+'" href="#'+floor_tab_id+'" title="'+tab_title+'"><img src="'+tab_icon+'" alt="icon"></i><span>'+tab_title+'</span></a></li>');
                    $(".floor-nav-list", $floorpanel ).append( $panelitem );  
                }
            });

            var $floorpanel_wrapper = $('<div id="j-floor-fixed-panel-sidebar"></div>');
            $floorpanel_wrapper.append( $floorpanel );

            $('body').append( $floorpanel_wrapper );

            if( $(window).width() > 780 ){
            var $first_tab_position = $(".floor-fixed-panel-play").first().offset().top;
            var $last_tab_position = $(".floor-fixed-panel-play").last().offset().top;

            var Floor_Fixed = function(){
              if ( $(document).scrollTop() > ($first_tab_position - 300) && $(document).scrollTop() < ($last_tab_position + 250)) {
                $floorpanel.addClass('floor-fixed');
              }else{
                $floorpanel.removeClass('floor-fixed');
              }
            }

            Floor_Fixed();
              $(window).scroll(function(event) {
                Floor_Fixed();
              });
            }

            $floorpanel.css({'position': 'fixed', 'top': $first_tab_position.top});
              //$floorpanel.css({'visibility': 'visible', 'position': 'fixed'});

              var fixed_pane_width = $("#j-floor-fixed-panel").width();
              //Fix position left or right for panel
              panel_margin_sidebar = getContainerMarginLeftRight( fixed_pane_width );

              if(panel_position == "ltr" ) {
                  $floorpanel.css( 'left', parseFloat(panel_margin_sidebar[0]) );
              } else if(panel_position == "rtl" ) {
                  $floorpanel.css( 'right', parseFloat(panel_margin_sidebar[1]) );
              }

              //Reset panel margin when resize window
              $(window).resize(function() {
                  panel_margin_sidebar = getContainerMarginLeftRight( fixed_pane_width );
                  if(panel_position == "ltr" ) {
                      $floorpanel.css( 'left', parseFloat(panel_margin_sidebar[0]) );
                  } else if(panel_position == "rtl" ) {
                      $floorpanel.css( 'right', parseFloat(panel_margin_sidebar[1]) );
                  }
              });
              /*End Init floor panel element*/

            $('#j-floor-fixed-panel-sidebar').ddscrollSpy({ // initialize 2nd demo
                highlightclass: 'active',
                scrolltopoffset: -200,
                scrollduration: 300 // <-- no comma after last option!
            });
      }
  });
})(jQuery);