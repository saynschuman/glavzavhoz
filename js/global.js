/*
* 2007-2015 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2015 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*/

!function(){var e=function(t,i){function s(){this.q=[],this.add=function(e){this.q.push(e)};var e,t;this.call=function(){for(e=0,t=this.q.length;e<t;e++)this.q[e].call()}}function o(e,t){return e.currentStyle?e.currentStyle[t]:window.getComputedStyle?window.getComputedStyle(e,null).getPropertyValue(t):e.style[t]}function n(e,t){if(e.resizedAttached){if(e.resizedAttached)return void e.resizedAttached.add(t)}else e.resizedAttached=new s,e.resizedAttached.add(t);e.resizeSensor=document.createElement("div"),e.resizeSensor.className="resize-sensor";var i="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; z-index: -1; visibility: hidden;",n="position: absolute; left: 0; top: 0; transition: 0s;";e.resizeSensor.style.cssText=i,e.resizeSensor.innerHTML='<div class="resize-sensor-expand" style="'+i+'"><div style="'+n+'"></div></div><div class="resize-sensor-shrink" style="'+i+'"><div style="'+n+' width: 200%; height: 200%"></div></div>',e.appendChild(e.resizeSensor),{fixed:1,absolute:1}[o(e,"position")]||(e.style.position="relative");var d,r,l=e.resizeSensor.childNodes[0],c=l.childNodes[0],h=e.resizeSensor.childNodes[1],a=(h.childNodes[0],function(){c.style.width=l.offsetWidth+10+"px",c.style.height=l.offsetHeight+10+"px",l.scrollLeft=l.scrollWidth,l.scrollTop=l.scrollHeight,h.scrollLeft=h.scrollWidth,h.scrollTop=h.scrollHeight,d=e.offsetWidth,r=e.offsetHeight});a();var f=function(){e.resizedAttached&&e.resizedAttached.call()},u=function(e,t,i){e.attachEvent?e.attachEvent("on"+t,i):e.addEventListener(t,i)},p=function(){e.offsetWidth==d&&e.offsetHeight==r||f(),a()};u(l,"scroll",p),u(h,"scroll",p)}var d=Object.prototype.toString.call(t),r="[object Array]"===d||"[object NodeList]"===d||"[object HTMLCollection]"===d||"undefined"!=typeof jQuery&&t instanceof jQuery||"undefined"!=typeof Elements&&t instanceof Elements;if(r)for(var l=0,c=t.length;l<c;l++)n(t[l],i);else n(t,i);this.detach=function(){if(r)for(var i=0,s=t.length;i<s;i++)e.detach(t[i]);else e.detach(t)}};e.detach=function(e){e.resizeSensor&&(e.removeChild(e.resizeSensor),delete e.resizeSensor,delete e.resizedAttached)},"undefined"!=typeof module&&"undefined"!=typeof module.exports?module.exports=e:window.ResizeSensor=e}();
//# sourceMappingURL=maps/ResizeSensor.min.js.map

(function ($) {
    $.fn.theiaStickySidebar = function (options) {
        var defaults = {
            'containerSelector': '',
            'additionalMarginTop': 0,
            'additionalMarginBottom': 0,
            'updateSidebarHeight': true,
            'minWidth': 0,
            'disableOnResponsiveLayouts': true,
            'sidebarBehavior': 'modern',
            'defaultPosition': 'relative',
            'namespace': 'TSS'
        };
        options = $.extend(defaults, options);

        // Validate options
        options.additionalMarginTop = parseInt(options.additionalMarginTop) || 0;
        options.additionalMarginBottom = parseInt(options.additionalMarginBottom) || 0;

        tryInitOrHookIntoEvents(options, this);

        // Try doing init, otherwise hook into window.resize and document.scroll and try again then.
        function tryInitOrHookIntoEvents(options, $that) {
            var success = tryInit(options, $that);

            if (!success) {
                console.log('TSS: Body width smaller than options.minWidth. Init is delayed.');

                $(document).on('scroll.' + options.namespace, function (options, $that) {
                    return function (evt) {
                        var success = tryInit(options, $that);

                        if (success) {
                            $(this).unbind(evt);
                        }
                    };
                }(options, $that));
                $(window).on('resize.' + options.namespace, function (options, $that) {
                    return function (evt) {
                        var success = tryInit(options, $that);

                        if (success) {
                            $(this).unbind(evt);
                        }
                    };
                }(options, $that))
            }
        }

        // Try doing init if proper conditions are met.
        function tryInit(options, $that) {
            if (options.initialized === true) {
                return true;
            }

            if ($('body').width() < options.minWidth) {
                return false;
            }

            init(options, $that);

            return true;
        }

        // Init the sticky sidebar(s).
        function init(options, $that) {
            options.initialized = true;

            // Add CSS
            var existingStylesheet = $('#theia-sticky-sidebar-stylesheet-' + options.namespace);
            if (existingStylesheet.length === 0) {
                $('head').append($('<style id="theia-sticky-sidebar-stylesheet-' + options.namespace + '">.theiaStickySidebar:after {content: ""; display: table; clear: both;}</style>'));
            }

            $that.each(function () {
                var o = {};

                o.sidebar = $(this);

                // Save options
                o.options = options || {};

                // Get container
                o.container = $(o.options.containerSelector);
                if (o.container.length == 0) {
                    o.container = o.sidebar.parent();
                }

                // Create sticky sidebar
                o.sidebar.parents().css('-webkit-transform', 'none'); // Fix for WebKit bug - https://code.google.com/p/chromium/issues/detail?id=20574
                o.sidebar.css({
                    'position': o.options.defaultPosition,
                    'overflow': 'visible',
                    // The "box-sizing" must be set to "content-box" because we set a fixed height to this element when the sticky sidebar has a fixed position.
                    '-webkit-box-sizing': 'border-box',
                    '-moz-box-sizing': 'border-box',
                    'box-sizing': 'border-box'
                });

                // Get the sticky sidebar element. If none has been found, then create one.
                o.stickySidebar = o.sidebar.find('.theiaStickySidebar');
                if (o.stickySidebar.length == 0) {
                    // Remove <script> tags, otherwise they will be run again when added to the stickySidebar.
                    var javaScriptMIMETypes = /(?:text|application)\/(?:x-)?(?:javascript|ecmascript)/i;
                    o.sidebar.find('script').filter(function (index, script) {
                        return script.type.length === 0 || script.type.match(javaScriptMIMETypes);
                    }).remove();

                    o.stickySidebar = $('<div>').addClass('theiaStickySidebar').append(o.sidebar.children());
                    o.sidebar.append(o.stickySidebar);
                }

                // Get existing top and bottom margins and paddings
                o.marginBottom = parseInt(o.sidebar.css('margin-bottom'));
                o.paddingTop = parseInt(o.sidebar.css('padding-top'));
                o.paddingBottom = parseInt(o.sidebar.css('padding-bottom'));

                // Add a temporary padding rule to check for collapsable margins.
                var collapsedTopHeight = o.stickySidebar.offset().top;
                var collapsedBottomHeight = o.stickySidebar.outerHeight();
                o.stickySidebar.css('padding-top', 1);
                o.stickySidebar.css('padding-bottom', 1);
                collapsedTopHeight -= o.stickySidebar.offset().top;
                collapsedBottomHeight = o.stickySidebar.outerHeight() - collapsedBottomHeight - collapsedTopHeight;
                if (collapsedTopHeight == 0) {
                    o.stickySidebar.css('padding-top', 0);
                    o.stickySidebarPaddingTop = 0;
                }
                else {
                    o.stickySidebarPaddingTop = 1;
                }

                if (collapsedBottomHeight == 0) {
                    o.stickySidebar.css('padding-bottom', 0);
                    o.stickySidebarPaddingBottom = 0;
                }
                else {
                    o.stickySidebarPaddingBottom = 1;
                }

                // We use this to know whether the user is scrolling up or down.
                o.previousScrollTop = null;

                // Scroll top (value) when the sidebar has fixed position.
                o.fixedScrollTop = 0;

                // Set sidebar to default values.
                resetSidebar();

                o.onScroll = function (o) {
                    // Stop if the sidebar isn't visible.
                    if (!o.stickySidebar.is(":visible")) {
                        return;
                    }

                    // Stop if the window is too small.
                    if ($('body').width() < o.options.minWidth) {
                        resetSidebar();
                        return;
                    }

                    // Stop if the sidebar width is larger than the container width (e.g. the theme is responsive and the sidebar is now below the content)
                    if (o.options.disableOnResponsiveLayouts) {
                        var sidebarWidth = o.sidebar.outerWidth(o.sidebar.css('float') == 'none');

                        if (sidebarWidth + 50 > o.container.width()) {
                            resetSidebar();
                            return;
                        }
                    }

                    var scrollTop = $(document).scrollTop();
                    var position = 'static';

                    // If the user has scrolled down enough for the sidebar to be clipped at the top, then we can consider changing its position.
                    if (scrollTop >= o.sidebar.offset().top + (o.paddingTop - o.options.additionalMarginTop)) {
                        // The top and bottom offsets, used in various calculations.
                        var offsetTop = o.paddingTop + options.additionalMarginTop;
                        var offsetBottom = o.paddingBottom + o.marginBottom + options.additionalMarginBottom;

                        // All top and bottom positions are relative to the window, not to the parent elemnts.
                        var containerTop = o.sidebar.offset().top;
                        var containerBottom = o.sidebar.offset().top + getClearedHeight(o.container);

                        // The top and bottom offsets relative to the window screen top (zero) and bottom (window height).
                        var windowOffsetTop = 0 + options.additionalMarginTop;
                        var windowOffsetBottom;

                        var sidebarSmallerThanWindow = (o.stickySidebar.outerHeight() + offsetTop + offsetBottom) < $(window).height();
                        if (sidebarSmallerThanWindow) {
                            windowOffsetBottom = windowOffsetTop + o.stickySidebar.outerHeight();
                        }
                        else {
                            windowOffsetBottom = $(window).height() - o.marginBottom - o.paddingBottom - options.additionalMarginBottom;
                        }

                        var staticLimitTop = containerTop - scrollTop + o.paddingTop;
                        var staticLimitBottom = containerBottom - scrollTop - o.paddingBottom - o.marginBottom;

                        var top = o.stickySidebar.offset().top - scrollTop;
                        var scrollTopDiff = o.previousScrollTop - scrollTop;

                        // If the sidebar position is fixed, then it won't move up or down by itself. So, we manually adjust the top coordinate.
                        if (o.stickySidebar.css('position') == 'fixed') {
                            if (o.options.sidebarBehavior == 'modern') {
                                top += scrollTopDiff;
                            }
                        }

                        if (o.options.sidebarBehavior == 'stick-to-top') {
                            top = options.additionalMarginTop;
                        }

                        if (o.options.sidebarBehavior == 'stick-to-bottom') {
                            top = windowOffsetBottom - o.stickySidebar.outerHeight();
                        }

                        if (scrollTopDiff > 0) { // If the user is scrolling up.
                            top = Math.min(top, windowOffsetTop);
                        }
                        else { // If the user is scrolling down.
                            top = Math.max(top, windowOffsetBottom - o.stickySidebar.outerHeight());
                        }

                        top = Math.max(top, staticLimitTop);

                        top = Math.min(top, staticLimitBottom - o.stickySidebar.outerHeight());

                        // If the sidebar is the same height as the container, we won't use fixed positioning.
                        var sidebarSameHeightAsContainer = o.container.height() == o.stickySidebar.outerHeight();

                        if (!sidebarSameHeightAsContainer && top == windowOffsetTop) {
                            position = 'fixed';
                        }
                        else if (!sidebarSameHeightAsContainer && top == windowOffsetBottom - o.stickySidebar.outerHeight()) {
                            position = 'fixed';
                        }
                        else if (scrollTop + top - o.sidebar.offset().top - o.paddingTop <= options.additionalMarginTop) {
                            // Stuck to the top of the page. No special behavior.
                            position = 'static';
                        }
                        else {
                            // Stuck to the bottom of the page.
                            position = 'absolute';
                        }
                    }

                    /*
                     * Performance notice: It's OK to set these CSS values at each resize/scroll, even if they don't change.
                     * It's way slower to first check if the values have changed.
                     */
                    if (position == 'fixed') {
                        var scrollLeft = $(document).scrollLeft();

                        o.stickySidebar.css({
                            'position': 'fixed',
                            'width': getWidthForObject(o.stickySidebar) + 'px',
                            'transform': 'translateY(' + top + 'px)',
                            'left': (o.sidebar.offset().left + parseInt(o.sidebar.css('padding-left')) - scrollLeft) + 'px',
                            'top': '0px'
                        });
                    }
                    else if (position == 'absolute') {
                        var css = {};

                        if (o.stickySidebar.css('position') != 'absolute') {
                            css.position = 'absolute';
                            css.transform = 'translateY(' + (scrollTop + top - o.sidebar.offset().top - o.stickySidebarPaddingTop - o.stickySidebarPaddingBottom) + 'px)';
                            css.top = '0px';
                        }

                        css.width = getWidthForObject(o.stickySidebar) + 'px';
                        css.left = '';

                        o.stickySidebar.css(css);
                    }
                    else if (position == 'static') {
                        resetSidebar();
                    }

                    if (position != 'static') {
                        if (o.options.updateSidebarHeight == true) {
                            o.sidebar.css({
                                'min-height': o.stickySidebar.outerHeight() + o.stickySidebar.offset().top - o.sidebar.offset().top + o.paddingBottom
                            });
                        }
                    }

                    o.previousScrollTop = scrollTop;
                };

                // Initialize the sidebar's position.
                o.onScroll(o);

                // Recalculate the sidebar's position on every scroll and resize.
                $(document).on('scroll.' + o.options.namespace, function (o) {
                    return function () {
                        o.onScroll(o);
                    };
                }(o));
                $(window).on('resize.' + o.options.namespace, function (o) {
                    return function () {
                        o.stickySidebar.css({'position': 'static'});
                        o.onScroll(o);
                    };
                }(o));

                // Recalculate the sidebar's position every time the sidebar changes its size.
                if (typeof ResizeSensor !== 'undefined') {
                    new ResizeSensor(o.stickySidebar[0], function (o) {
                        return function () {
                            o.onScroll(o);


                        };
                    }(o));
                }

                // Reset the sidebar to its default state
                function resetSidebar() {
                    o.fixedScrollTop = 0;
                    o.sidebar.css({
                        'min-height': '1px'
                    });
                    o.stickySidebar.css({
                        'position': 'static',
                        'width': '',
                        'transform': 'none'
                    });
                }

                // Get the height of a div as if its floated children were cleared. Note that this function fails if the floats are more than one level deep.
                function getClearedHeight(e) {
                    var height = e.height();

                    e.children().each(function () {
                        height = Math.max(height, $(this).height());
                    });

                    return height;
                }
            });
        }

        function getWidthForObject(object) {
            var width;

            try {
                width = object[0].getBoundingClientRect().width;
            }
            catch (err) {
            }

            if (typeof width === "undefined") {
                width = object.width();
            }

            return width;
        }

        return this;
    }
})(jQuery);

//# sourceMappingURL=maps/theia-sticky-sidebar.js.map



/**
 * menu-aim is a jQuery plugin for dropdown menus that can differentiate
 * between a user trying hover over a dropdown item vs trying to navigate into
 * a submenu's contents.
 *
 * menu-aim assumes that you have are using a menu with submenus that expand
 * to the menu's right. It will fire events when the user's mouse enters a new
 * dropdown item *and* when that item is being intentionally hovered over.
 *
 * __________________________
 * | Monkeys  >|   Gorilla  |
 * | Gorillas >|   Content  |
 * | Chimps   >|   Here     |
 * |___________|____________|
 *
 * In the above example, "Gorillas" is selected and its submenu content is
 * being shown on the right. Imagine that the user's cursor is hovering over
 * "Gorillas." When they move their mouse into the "Gorilla Content" area, they
 * may briefly hover over "Chimps." This shouldn't close the "Gorilla Content"
 * area.
 *
 * This problem is normally solved using timeouts and delays. menu-aim tries to
 * solve this by detecting the direction of the user's mouse movement. This can
 * make for quicker transitions when navigating up and down the menu. The
 * experience is hopefully similar to amazon.com/'s "Shop by Department"
 * dropdown.
 *
 * Use like so:
 *
 *      $("#menu").menuAim({
 *          activate: $.noop,  // fired on row activation
 *          deactivate: $.noop  // fired on row deactivation
 *      });
 *
 *  ...to receive events when a menu's row has been purposefully (de)activated.
 *
 * The following options can be passed to menuAim. All functions execute with
 * the relevant row's HTML element as the execution context ('this'):
 *
 *      .menuAim({
 *          // Function to call when a row is purposefully activated. Use this
 *          // to show a submenu's content for the activated row.
 *          activate: function() {},
 *
 *          // Function to call when a row is deactivated.
 *          deactivate: function() {},
 *
 *          // Function to call when mouse enters a menu row. Entering a row
 *          // does not mean the row has been activated, as the user may be
 *          // mousing over to a submenu.
 *          enter: function() {},
 *
 *          // Function to call when mouse exits a menu row.
 *          exit: function() {},
 *
 *          // Selector for identifying which elements in the menu are rows
 *          // that can trigger the above events. Defaults to "> li".
 *          rowSelector: "> li",
 *
 *          // You may have some menu rows that aren't submenus and therefore
 *          // shouldn't ever need to "activate." If so, filter submenu rows w/
 *          // this selector. Defaults to "*" (all elements).
 *          submenuSelector: "*",
 *
 *          // Direction the submenu opens relative to the main menu. Can be
 *          // left, right, above, or below. Defaults to "right".
 *          submenuDirection: "right"
 *      });
 *
 * https://github.com/kamens/jQuery-menu-aim
*/
(function($) {

    $.fn.menuAim = function(opts) {
        // Initialize menu-aim for all elements in jQuery collection
        this.each(function() {
            init.call(this, opts);
        });

        return this;
    };

    function init(opts) {
        var $menu = $(this),
            activeRow = null,
            mouseLocs = [],
            lastDelayLoc = null,
            timeoutId = null,
            options = $.extend({
                rowSelector: "> li",
                submenuSelector: "*",
                submenuDirection: "right",
                tolerance: 75,  // bigger = more forgivey when entering submenu
                enter: $.noop,
                exit: $.noop,
                activate: $.noop,
                deactivate: $.noop,
                exitMenu: $.noop
            }, opts);

        var MOUSE_LOCS_TRACKED = 3,  // number of past mouse locations to track
            DELAY = 300;  // ms delay when user appears to be entering submenu

        /**
         * Keep track of the last few locations of the mouse.
         */
        var mousemoveDocument = function(e) {
                mouseLocs.push({x: e.pageX, y: e.pageY});

                if (mouseLocs.length > MOUSE_LOCS_TRACKED) {
                    mouseLocs.shift();
                }
            };

        /**
         * Cancel possible row activations when leaving the menu entirely
         */
        var mouseleaveMenu = function() {
                if (timeoutId) {
                    clearTimeout(timeoutId);
                }

                // If exitMenu is supplied and returns true, deactivate the
                // currently active row on menu exit.
                if (options.exitMenu(this)) {
                    if (activeRow) {
                        options.deactivate(activeRow);
                    }

                    activeRow = null;
                }
            };

        /**
         * Trigger a possible row activation whenever entering a new row.
         */
        var mouseenterRow = function() {
                if (timeoutId) {
                    // Cancel any previous activation delays
                    clearTimeout(timeoutId);
                }

                options.enter(this);
                possiblyActivate(this);
            },
            mouseleaveRow = function() {
                options.exit(this);
            };

        /*
         * Immediately activate a row if the user clicks on it.
         */
        var clickRow = function() {
                activate(this);
            };

        /**
         * Activate a menu row.
         */
        var activate = function(row) {
                if (row == activeRow) {
                    return;
                }

                if (activeRow) {
                    options.deactivate(activeRow);
                }

                options.activate(row);
                activeRow = row;
            };

        /**
         * Possibly activate a menu row. If mouse movement indicates that we
         * shouldn't activate yet because user may be trying to enter
         * a submenu's content, then delay and check again later.
         */
        var possiblyActivate = function(row) {
                var delay = activationDelay();

                if (delay) {
                    timeoutId = setTimeout(function() {
                        possiblyActivate(row);
                    }, delay);
                } else {
                    activate(row);
                }
            };

        /**
         * Return the amount of time that should be used as a delay before the
         * currently hovered row is activated.
         *
         * Returns 0 if the activation should happen immediately. Otherwise,
         * returns the number of milliseconds that should be delayed before
         * checking again to see if the row should be activated.
         */
        var activationDelay = function() {
                if (!activeRow || !$(activeRow).is(options.submenuSelector)) {
                    // If there is no other submenu row already active, then
                    // go ahead and activate immediately.
                    return 0;
                }

                var offset = $menu.offset(),
                    upperLeft = {
                        x: offset.left,
                        y: offset.top - options.tolerance
                    },
                    upperRight = {
                        x: offset.left + $menu.outerWidth(),
                        y: upperLeft.y
                    },
                    lowerLeft = {
                        x: offset.left,
                        y: offset.top + $menu.outerHeight() + options.tolerance
                    },
                    lowerRight = {
                        x: offset.left + $menu.outerWidth(),
                        y: lowerLeft.y
                    },
                    loc = mouseLocs[mouseLocs.length - 1],
                    prevLoc = mouseLocs[0];

                if (!loc) {
                    return 0;
                }

                if (!prevLoc) {
                    prevLoc = loc;
                }

                if (prevLoc.x < offset.left || prevLoc.x > lowerRight.x ||
                    prevLoc.y < offset.top || prevLoc.y > lowerRight.y) {
                    // If the previous mouse location was outside of the entire
                    // menu's bounds, immediately activate.
                    return 0;
                }

                if (lastDelayLoc &&
                        loc.x == lastDelayLoc.x && loc.y == lastDelayLoc.y) {
                    // If the mouse hasn't moved since the last time we checked
                    // for activation status, immediately activate.
                    return 0;
                }

                // Detect if the user is moving towards the currently activated
                // submenu.
                //
                // If the mouse is heading relatively clearly towards
                // the submenu's content, we should wait and give the user more
                // time before activating a new row. If the mouse is heading
                // elsewhere, we can immediately activate a new row.
                //
                // We detect this by calculating the slope formed between the
                // current mouse location and the upper/lower right points of
                // the menu. We do the same for the previous mouse location.
                // If the current mouse location's slopes are
                // increasing/decreasing appropriately compared to the
                // previous's, we know the user is moving toward the submenu.
                //
                // Note that since the y-axis increases as the cursor moves
                // down the screen, we are looking for the slope between the
                // cursor and the upper right corner to decrease over time, not
                // increase (somewhat counterintuitively).
                function slope(a, b) {
                    return (b.y - a.y) / (b.x - a.x);
                };

                var decreasingCorner = upperRight,
                    increasingCorner = lowerRight;

                // Our expectations for decreasing or increasing slope values
                // depends on which direction the submenu opens relative to the
                // main menu. By default, if the menu opens on the right, we
                // expect the slope between the cursor and the upper right
                // corner to decrease over time, as explained above. If the
                // submenu opens in a different direction, we change our slope
                // expectations.
                if (options.submenuDirection == "left") {
                    decreasingCorner = lowerLeft;
                    increasingCorner = upperLeft;
                } else if (options.submenuDirection == "below") {
                    decreasingCorner = lowerRight;
                    increasingCorner = lowerLeft;
                } else if (options.submenuDirection == "above") {
                    decreasingCorner = upperLeft;
                    increasingCorner = upperRight;
                }

                var decreasingSlope = slope(loc, decreasingCorner),
                    increasingSlope = slope(loc, increasingCorner),
                    prevDecreasingSlope = slope(prevLoc, decreasingCorner),
                    prevIncreasingSlope = slope(prevLoc, increasingCorner);

                if (decreasingSlope < prevDecreasingSlope &&
                        increasingSlope > prevIncreasingSlope) {
                    // Mouse is moving from previous location towards the
                    // currently activated submenu. Delay before activating a
                    // new menu row, because user may be moving into submenu.
                    lastDelayLoc = loc;
                    return DELAY;
                }

                lastDelayLoc = null;
                return 0;
            };

        /**
         * Hook up initial menu events
         */
        $menu
            .mouseleave(mouseleaveMenu)
            .find(options.rowSelector)
                .mouseenter(mouseenterRow)
                .mouseleave(mouseleaveRow)
                .click(clickRow);

        $(document).mousemove(mousemoveDocument);

    };
})(jQuery);




//global variables
var responsiveflag = true;



var timeLightbox = '';
var openLightbox = function (el) {
     $('.lightboxs').fadeIn('fast').addClass('active');
};
var closeLightbox = function () {
      $('.lightboxs').fadeOut('fast').removeClass('active');
};
var lastScrollTop = 0;
var headerH = 65+15; //height nav_fixed
var offsetSlide = 0;
var topSlide = 0;
var slideTopDowns = function (){//fix filters categorys
    if ($('#js-slide-main').length == 1 ){

        var jsSlideTop = $('#js-slide-main').offset().top - headerH;
        var jsSlideBottom = jsSlideTop + $('#js-slide-main').height() - $('.js-slide-trg').height();
        var downpos = $('.js-slide-trg').offset().top + $('.js-slide-trg').height();
        if($('#js-slide-main').height() > $('.js-slide-trg').height() ){//&& $(window).width() > 1280  &&
            //console.log($('.js-slide-trg').height(), $(window).scrollTop(), jsSlideBottom);
            if ($('#js-slide-main').height() > $('.js-slide-trg').height()){

                topSlide = $('.js-slide-trg').offset().top;
                if($(window).height() <= $('.js-slide-trg').height() + headerH){
                    console.log(topSlide, 'topstyle1');
                    $('.js-slide-trg').css('top', topSlide);
                    $('.js-slide-trg').removeClass('fixed').addClass('pos-absolute');
                    topSlide = topSlide;
                }else{
                    console.log(top, 'topstyle2');
                    $('.js-slide-trg').removeClass('pos-absolute').addClass('fixed');
                }


                var st = $(this).scrollTop();
                if( $(window).scrollTop() + $(window).height() >= downpos && st > lastScrollTop){
                    //downscroll
                     console.log('downscroll');
                    $('.js-slide-trg').removeClass('pos-absolute').addClass('fixed').css('top',$(window).height() - $('.js-slide-trg').height());
                    offsetSlide = $('.js-slide-trg').offset().top;
                }
                else if($(window).scrollTop() <= $('.js-slide-trg').offset().top && st < lastScrollTop){
                    console.log('endtopscroll');
                    $('.js-slide-trg').removeClass('pos-absolute').addClass('fixed').css('top',$(window).height() + $('.js-slide-trg').height());
                }
                else if(st < lastScrollTop){
                    console.log('upscroll');
                    $('.js-slide-trg').removeClass('fixed').addClass('pos-absolute').css('top', offsetSlide ); // + $('.js-slide-trg').height() - $(window).height()
                }
                lastScrollTop = st;


                 if(!$('.js-slide-trg').hasClass('pos-absolute')){
                    /*else */if ($(window).scrollTop() >= jsSlideTop){
                        $('.js-slide-trg').addClass('fixed').css('top', headerH);

                    }else if ($(window).scrollTop() < jsSlideTop){
                        $('.js-slide-trg').removeClass('fixed').css('top', 0);
                    }
                    else if($(window).scrollTop() > jsSlideBottom){
                        $('.js-slide-trg').removeClass('fixed').css('top',jsSlideBottom - jsSlideTop);
                    }
                }
            }
        }else{
            $('.js-slide-trg').removeClass('fixed').css('top', 0);
        }
    }
};

$(window).load(function(){
	$('#navs_info').addClass('active');
    if($(window).width() < 1200){
        // ogranichit catalog
        $('#grid').click();
	}
    $('.js-slide__trg:first').children('.js-slide').click(); //open first filter
});

$(document).ready(function(){
	// $.material.init();
	// $(".js-nouislider").noUiSlider({
	  // start: 40,
	  // connect: "lower",
	  // range: {
		// min: 0,
		// max: 100
	  // }
    // });
	
    $('.input-checkbox').on('click', function(event){
         var checkBoxes = $(this).children('.checkbox')
        //console.log('lol',$(this).children('.checkbox').prop("checked"));
        checkBoxes.prop("checked", !checkBoxes.prop("checked"));
    });
	$('.input-checkbox + label').on('click', function(event) {
         $(this).prev('.input-checkbox').click();
    });
	
    $('.checkbox-ripple').rkmd_checkboxRipple();
    change_checkbox_color();

    if($('body').hasClass('category')){
        $('.js-slide-trg, #center_column')
        	.theiaStickySidebar({
        		additionalMarginTop: 80,
                minWidth: 300
                // containerSelector: '#slidercont'
    	});
    }

    $(window).scroll(function(){
        $('.js-slide-trg').children().removeClass('ease');
        // slideTopDown();
    });

   //выпадающие блоки как в фильтрах листинга
   var jsSlideH = $('#js-slide-main').height();
   // var jsSlideH = $('#js-slide-main').offset().top + $('#js-slide-main').height();
   $(document).on('click','.js-slide', function(event) {
       event.preventDefault();
       var trg = jQuery(this).parents('.js-slide__trg');
       var cont = jQuery(this).next();
       if (!trg.hasClass('closed')){
           $('.bubble').hide();
           cont.slideUp(300, function() {
               trg.addClass('closed');
               trg.attr('data-status','closed');
           });
       }
       else{
           cont.slideDown(300, function() {
               $('.bubble').show();
           });
           trg.removeClass('closed');
           trg.attr('data-status','opened');
       }
    //    $('.js-slide-trg').children().addClass('ease');
       setTimeout(function(){


        //    var top = $('.js-slide-trg').offset().top;
        //    if($(window).height() <= $('.js-slide-trg').height() + headerH){
           //
        //        console.log(top, 'topstyle1');
        //        $('.js-slide-trg').css('top', top);
        //        $('.js-slide-trg').removeClass('fixed').addClass('pos-absolute');
        //    }else{
        //        console.log(top, 'topstyle2');
        //        $('.js-slide-trg').removeClass('pos-absolute').addClass('fixed');
        //    }
           //
        //    slideTopDown();

           //click
           // if( $('.js-slide__trg').data('status') == "opened" && $('.js-slide-trg').css('top') > headerH){
           //     console.log($('.js-slide__trg').offset().top, 'top' );
           //     $('.js-slide-trg').removeClass('fixed').css('top',jsSlideBottom - jsSlideTop);
           // }
       }, 400);

    //    setTimeout(function(){
    //        var jsSlideTop = $('#js-slide-main').offset().top - 80;
    //        var jsSlideBottom = jsSlideTop + $('#js-slide-main').height() - $('.js-slide-trg').children().height();
    //        if($(window).scrollTop() > jsSlideBottom){
    //            var topSlide =  $('.js-slide-trg').children().offset().top - $('.js-slide-trg').offset().top;
    //            $('.js-slide-trg').children().css('transform', 'translateY('+topSlide+')');
    //        }
    //         console.log($(window).scrollTop(),jsSlideBottom, topSlide);
    //    },300)
   });


    $('body').each(function(index, el) {
        var listing = $(this).find('#for-grey-bg').length;
        if (listing){
           $(this).attr('id','categorys');
        }
    });

     $('.js-availability').each(function(index, el) {
         var txt = $(this).find('.label-success').text();
         var status = txt.replace(/\s+/g, '');
         console.log(status);
         switch (status) {
             case 'Вналичии':
             case 'Доставка7-9дней':
             case 'Есть,доставка3-7дней':
                 $(this).addClass('availability_green');
                 break;
             case 'Подзаказ':
                 $(this).addClass('availability_orange');
                 break;
             case 'Подзаказ14-21дней':
                 $(this).addClass('availability_orange');
                 break;
             case 'Подзаказ5-7недель':
                 $(this).addClass('availability_orange');
                 break;
             case 'Подзаказ7-21дней':
                 $(this).addClass('availability_orange');
                 break;
             case 'Временнонет':
                 $(this).addClass('availability_grey');
                 break;
             default:

         }
     });
    // category
    $('#categorys #pagination_bottom .product-count').appendTo('.page-h1.page-heading');


    $('#toggle-search').on('click', function(event) {
		/* Act on the event */
		$('#search-main').slideToggle('fast');
	});



	if ($(window).width() > 992){
        // mainmenu 325
        jQuery('#pts-verticalmenu ul').menuAim({
            rowSelector: ">li",
            submenuDirection: "right",
            tolerance: 1000,
            activate: function(a){
                $(a).children('.dropdown-menu').show();
            },
            deactivate: function(a){
                $(a).children('.dropdown-menu').hide();
            }
        });
        //равная высота меню
        $('.pts-verticalmenu.navbar-collapse.collapse.navbar-ex2-collapse').attr('style','display:block!important');
        $('.nav.navbar-nav.verticalmenu').each(function(){
          var h = $(this).outerHeight();
        //   console.log(h);
          $(this).find('.dropdown-menu').attr('style','min-height:'+h+'px!important');
        });
        $('.pts-verticalmenu.navbar-collapse.collapse.navbar-ex2-collapse').attr('style','display:none');


        $(window).scroll(function() {
            var trg = $("#pts-mainnav");

            if ($('.pts-verticalmenu').is(':visible')){
                trg.addClass("menu_fixed-no");
            } else {
                trg.removeClass("menu_fixed-no");
            }

            //console.log(trg.hasClass("menu_fixed"));
        });

        var timeMenu = '';
	    $( "#pts-verticalmenu" )
	    .mouseenter(function() {
            timeLightbox = setTimeout(function(){
                openLightbox();
                $( ".pts-verticalmenu.navbar-collapse" ).attr('style','display:block!important');
            },100);
            clearTimeout(timeMenu);
		 })
	     .mouseleave(function() {
            clearTimeout(timeLightbox);
            //$( ".pts-verticalmenu.navbar-collapse" ).attr('style','display:block!important');
            timeMenu = setTimeout(function(){
                closeLightbox();
                $( ".pts-verticalmenu.navbar-collapse" ).attr('style','display:none!important');
            },500);
		 });

		$("#pts-mini-cart").mouseenter(function() {//#cart .mini-cart a
            if($('.ajax_cart_no_product').is(':hidden')){
                timeLightbox = setTimeout(function(){
                    openLightbox();
                },100);
            }
		}).mouseleave(function() {
            clearTimeout(timeLightbox);
			setTimeout(function(){closeLightbox()},500);
		});
	} else if($(window).width() < 1200){
	} else{


		$( "#pts-verticalmenu" )
			.click(function() {
                $( ".pts-verticalmenu" ).each(function(index, el) {
                    var width = $(this).parents('.container').width();
        		    $(this).width(width); $(this).find('.dropdown-toggle.has-subhtml').width(width);
        		});
				if($('#lightbox').is(':visible')){ // && $('.pts-verticalmenu.navbar-collapse').is(':hidden')
					closeLightbox();
				}else{
					openLightbox();
				}

			});
	}



	// $('.js-lightbox-show').on('click', function(event) {
	// 	openLightbox();
	// });
	$('.lightboxs').on('click', function(event) {
		closeLightbox();
	});

	// меню иконки
	$('#pts-verticalmenu').find('li.parent.dropdown').not('.dropdown-submenu').each(function(){
		var indexnum = $(this).index();
		var el = $(this).children('a.dropdown-toggle.has-subhtml');
		var href = el.attr('href');
		var title = (el.find('.menu-desc').text())? el.find('.menu-desc').text() : el.find('.menu-title').text();
        var orderRxp = (el.parent('.order-ico').length)? el.parent().attr('class') : "order-ico_9";
        var order = orderRxp.match(/\d+$/ig)[0];
        //orderRxp.replace("parent dropdown navs-ico navs-ico_","");
 		$('<li class="navs__wrap" data-order="'+order+'"><a href="'+href+'" class="navs__item navs__item_ico navs__item_ico'+indexnum+'"><span>'+title+'</span></a></li>')
        .appendTo('#navs_info');
	});
    $('#navs_info').find('.navs__wrap')
    .sort(function (a, b) {  return a.dataset.order - b.dataset.order;  })
    .appendTo('#navs_info');
    $('a.dropdown-toggle.has-subhtml').find('.menu-title').each(function(){
        $(this).html($(this).html().replace(/&amp;nbsp;/gi,' '));
        //console.log($(this).html());
    });

	//перенос описание категории в листинге
	var catdesk = $( ".page-h1.page-heading + .cat_desc" );
	if (catdesk.length > 0){
		var catdeskH = catdesk.outerHeight(true) + 108;
		console.log(catdeskH);
		catdesk.each(function(){
			$(this).css('color','initial').parent().css({
				'padding-bottom': catdeskH,
				'position': 'relative'
			})
		});
	}

	// custom 325


	// /* automatic keep header always displaying on top */
    if( $("body").hasClass("layout-boxed") || $("body").hasClass("layout-fullwidth") ){
       var _menu_action = 0;
	    if($('.main-menu').length){
	    	 _menu_action = $('.main-menu').offset().top;
		}
		var _is_menu_action = $('#pts-mainnav').hasClass('no-fixed');
		var _enable_menu_fixed = $('body').hasClass('keep-header');

		var Menu_Fixed = function(){
			var $mainmenu =  $('#pts-mainnav');
			if(!_is_menu_action){
				if( $(document).scrollTop() > _menu_action + 85){
					$mainmenu.addClass('menu_fixed');
					$('.return-top').addClass('display');
					$('#header-main').addClass('display-after');
				}else{
					$mainmenu.removeClass('menu_fixed');
					$('.menu_fixed_height').remove();
					$('.return-top').removeClass('display');
					$('#header-main').removeClass('display-after');
				}
			}
		}

		jQuery(document).ready(function() {
			Menu_Fixed();
		});

	    $(window).scroll(function(event) {
	    	Menu_Fixed();
	    });
    }

	$('.block-borderbox .title_block').each(function(){

		var str = $(this).text();
		var end_str = '<span>' + str + '</span>';
		$(this).html(end_str);
	});

//carousell
		$('.boxcarousel').bind('slide.bs.carousel', function (e) {
		     $(this).find(".carousel-inner ").css("overflow","hidden");
		 });
		 $('.boxcarousel').bind('slid.bs.carousel', function () {
		    $(this).find(".carousel-inner ").css("overflow","visible");
		 });

	$('.carousel').each(function(){
        $(this).carousel({
            interval: false
        });
    });
	$(function () {
	  $('[data-toggle="tooltip"]').tooltip()
	})
	//gototop
	$(window).scroll(function() {
	    if ($(window).scrollTop() >= 200) {
	        $('#to_top').fadeIn();
	    } else {
	        $('#to_top').fadeOut();
	    }
	});
	$("#to_top").click(function(){
		$("body,html").animate({scrollTop:0	},"normal");
		$("#page").animate({scrollTop:0	},"normal");
			return!1
	});

	 $("a.pts-fancybox").fancybox();
	$('#fancybox-map').fancybox({
		'transitionIn'	:	'elastic',
		'transitionOut'	:	'elastic',
		'speedIn'		:	600,
		'speedOut'		:	200,
		'overlayShow'	:	false,
		'type' : 'iframe'
	});

	$('.fancybox').fancybox({
		'transitionIn'	:	'elastic',
		'transitionOut'	:	'elastic',
		'speedIn'		:	600,
		'speedOut'		:	200,
		'overlayShow'	:	false
	});

	highdpiInit();
	responsiveResize();
	$(window).resize(responsiveResize);
	if (navigator.userAgent.match(/Android/i))
	{
		var viewport = document.querySelector('meta[name="viewport"]');
		viewport.setAttribute('content', 'initial-scale=1.0,maximum-scale=1.0,user-scalable=0,width=device-width,height=device-height');
		window.scrollTo(0, 1);
	}
	//blockHover();
	if (typeof quickView !== 'undefined' && quickView)
		quick_view();
	dropDown();

	if (typeof page_name != 'undefined' && !in_array(page_name, ['index', 'product']))
	{
		bindGrid();

 		$(document).on('change', '.selectProductSort', function(e){
			if (typeof request != 'undefined' && request)
				var requestSortProducts = request;
 			var splitData = $(this).val().split(':');
 			var url = '';
			if (typeof requestSortProducts != 'undefined' && requestSortProducts)
			{
				url += requestSortProducts ;
				if (typeof splitData[0] !== 'undefined' && splitData[0])
				{
					url += ( requestSortProducts.indexOf('?') < 0 ? '?' : '&') + 'orderby=' + splitData[0] + (splitData[1] ? '&orderway=' + splitData[1] : '');
					if (typeof splitData[1] !== 'undefined' && splitData[1])
						url += '&orderway=' + splitData[1];
				}
				document.location.href = url;
			}
    	});

		$(document).on('change', 'select[name="n"]', function(){
			$(this.form).submit();
		});

		$(document).on('change', 'select[name="currency_payment"]', function(){
			setCurrency($(this).val());
		});
	}

		$(document).on('change', 'select[name="manufacturer_list"], select[name="supplier_list"]', function() {
			if (this.value != '')
				location.href = this.value;
		});


	$(document).on('click', '.back', function(e){
		e.preventDefault();
		history.back();
	});

	jQuery.curCSS = jQuery.css;
	if (!!$.prototype.cluetip)
		$('a.cluetip').cluetip({
			local:true,
			cursor: 'pointer',
			dropShadow: false,
			dropShadowSteps: 0,
			showTitle: false,
			tracking: true,
			sticky: false,
			mouseOutClose: true,
			fx: {
		    	open:       'fadeIn',
		    	openSpeed:  'fast'
			}
		}).css('opacity', 0.8);

	if (!!$.prototype.fancybox)
		$.extend($.fancybox.defaults.tpl, {
			closeBtn : '<a title="' + FancyboxI18nClose + '" class="fancybox-item fancybox-close" href="javascript:;"></a>',
			next     : '<a title="' + FancyboxI18nNext + '" class="fancybox-nav fancybox-next" href="javascript:;"><span></span></a>',
			prev     : '<a title="' + FancyboxI18nPrev + '" class="fancybox-nav fancybox-prev" href="javascript:;"><span></span></a>'
		});
	// Close Alert messages
	$(".alert.alert-danger").on('click', this, function(e){
		if (e.offsetX >= 16 && e.offsetX <= 39 && e.offsetY >= 16 && e.offsetY <= 34)
			$(this).fadeOut();
	});
});

function highdpiInit()
{
	if($('.replace-2x').css('font-size') == "1px")
	{
		var els = $("img.replace-2x").get();
		for(var i = 0; i < els.length; i++)
		{
			src = els[i].src;
			extension = src.substr( (src.lastIndexOf('.') +1) );
			src = src.replace("." + extension, "2x." + extension);

			var img = new Image();
			img.src = src;
			img.height != 0 ? els[i].src = src : els[i].src = els[i].src;
		}
	}
}


// Used to compensante Chrome/Safari bug (they don't care about scroll bar for width)
function scrollCompensate()
{
    var inner = document.createElement('p');
    inner.style.width = "100%";
    inner.style.height = "200px";

    var outer = document.createElement('div');
    outer.style.position = "absolute";
    outer.style.top = "0px";
    outer.style.left = "0px";
    outer.style.visibility = "hidden";
    outer.style.width = "200px";
    outer.style.height = "150px";
    outer.style.overflow = "hidden";
    outer.appendChild(inner);

    document.body.appendChild(outer);
    var w1 = inner.offsetWidth;
    outer.style.overflow = 'scroll';
    var w2 = inner.offsetWidth;
    if (w1 == w2) w2 = outer.clientWidth;

    document.body.removeChild(outer);

    return (w1 - w2);
}


function responsiveResize()
{
	compensante = scrollCompensate();
	if (($(window).width()+scrollCompensate()) <= 992 && responsiveflag == false)
	{
		accordionTop('enable');
		if (($(window).width()+scrollCompensate()) <= 767 && responsiveflag == false)
			{
				accordion('enable');
				accordionFooter('enable');
				accordionTop('enable');
			}
		responsiveflag = true;
	}
	else if (($(window).width()+scrollCompensate()) >= 992) {
		accordionTop('disable');
		if (($(window).width()+scrollCompensate()) >= 768)
			{
				accordion('disable');
				accordionFooter('disable');
				accordionTop('disable');
			}
		responsiveflag = false;
	}

}

function blockHover(status)
{
	$(document).off('mouseenter').on('mouseenter', '.product_list.grid li.ajax_block_product .product-container', function(e){

		if ($('body').find('.container').width() == 1170)
		{
			var pcHeight = $(this).parent().outerHeight();
			var pcPHeight = $(this).parent().find('.button-container').outerHeight() + $(this).parent().find('.comments_note').outerHeight() + $(this).parent().find('.functional-buttons').outerHeight();
			$(this).parent().addClass('hovered').css({'height':pcHeight + pcPHeight, 'margin-bottom':pcPHeight * (-1)});
		}
	});

	$(document).off('mouseleave').on('mouseleave', '.product_list.grid li.ajax_block_product .product-container', function(e){
		if ($('body').find('.container').width() == 1170)
			$(this).parent().removeClass('hovered').css({'height':'auto', 'margin-bottom':'0'});
	});
}

function quick_view()
{
	$(document).on('click', '.quick-view:visible, .quick-view-mobile:visible', function(e){
		e.preventDefault();
		var url = this.rel;
		var anchor = '';

		if (url.indexOf('#') != -1)
		{
			anchor = url.substring(url.indexOf('#'), url.length);
			url = url.substring(0, url.indexOf('#'));
		}

		if (url.indexOf('?') != -1)
			url += '&';
		else
			url += '?';

		if (!!$.prototype.fancybox)
			$.fancybox({
				'padding':  0,
				'width':    1087,
				'height':   610,
				'type':     'iframe',
				'href':     url + 'content_only=1' + anchor
			});
	});
}

function bindGrid()
{
	var view = $.totalStorage('display');

	if (!view && (typeof displayList != 'undefined') && displayList)
		view = 'list';

	if (view && view != 'grid')
		display(view);
	else
		$('.display').find('li#grid').addClass('selected');

	$(document).on('click', '#grid', function(e){
		e.preventDefault();
		display('grid');
	});

	$(document).on('click', '#list', function(e){
		e.preventDefault();
		display('list');
	});
}

function display(view)
{

	var left = 'col-sm-4 col-md-4 col-lg-3';
	var right = 'col-sm-8 col-md-8 col-lg-9';
	if (view == 'list')
	{
		$('ul.product_list').removeClass('grid').addClass('list row');

		$('ul.product_list > li').each( function(){
			var $li = $(this);
			$li.find( '.left-block' ).addClass( left );
			$li.find( '.right-block' ).addClass( right );
			$li.removeClass( "col-lg-"+$li.data('col-lg') ).removeClass( "col-md-"+$li.data('col-md')   ).removeClass(  "col-sm-"+$li.data('col-sm')  ).removeClass(  "col-xs-"+$li.data('col-xs')  );
		} );

		$('.display').find('li#list').addClass('selected');
		$('.display').find('li#grid').removeAttr('class');
		$.totalStorage('display', 'list');
	}
	else
	{
		$('ul.product_list').removeClass('list').addClass('grid row');

		 $('ul.product_list > li').each( function(){
			var $li = $(this);
			$li.find( '.left-block' ).removeClass( left );
			$li.find( '.right-block' ).removeClass( right );
			$li.addClass( "col-lg-"+$li.data('col-lg') ).addClass( "col-md-"+$li.data('col-md')   ).addClass(  "col-sm-"+$li.data('col-sm')  ).addClass(  "col-xs-"+$li.data('col-xs')  );
		} );

		$('.display').find('li#grid').addClass('selected');
		$('.display').find('li#list').removeAttr('class');


		$.totalStorage('display', 'grid');
	}
}

function dropDown()
{
	elementClick = '#header .current';
	elementSlide =  'ul.toogle_content';
	activeClass = 'active';

	$(elementClick).on('click', function(e){
		e.stopPropagation();
		var subUl = $(this).next(elementSlide);
		if(subUl.is(':hidden'))
		{
			subUl.slideDown();
			$(this).addClass(activeClass);
		}
		else
		{
			subUl.slideUp();
			$(this).removeClass(activeClass);
		}
		$(elementClick).not(this).next(elementSlide).slideUp();
		$(elementClick).not(this).removeClass(activeClass);
		e.preventDefault();
	});

	$(elementSlide).on('click', function(e){
		e.stopPropagation();
	});

	$(document).on('click', function(e){
		e.stopPropagation();
		var elementHide = $(elementClick).next(elementSlide);
		$(elementHide).slideUp();
		$(elementClick).removeClass('active');
	});
}

function accordionFooter(status)
{
	if(status == 'enable')
	{
		$('#footer .footer-block h4').on('click', function(){
			$(this).toggleClass('active').parent().find('.toggle-footer').stop().slideToggle('medium');
		})
		$('#footer').addClass('accordion').find('.toggle-footer').slideUp('fast');
	}
	else
	{
		$('.footer-block h4').removeClass('active').off().parent().find('.toggle-footer').removeAttr('style').slideDown('fast');
		$('#footer').removeClass('accordion');
	}
}

function accordion(status)
{
	if(status == 'enable')
	{
		var accordion_selector = '#right_column .block .title_block, #left_column .block .title_block, #left_column #newsletter_block_left h4,' +
								'#left_column .shopping_cart > a:first-child, #right_column .shopping_cart > a:first-child';

		$(accordion_selector).on('click', function(e){
			$(this).toggleClass('active').parent().find('.block_content').stop().slideToggle('medium');
		});
		$('#right_column, #left_column').addClass('accordion').find('.block .block_content').slideUp('fast');
		if (typeof(ajaxCart) !== 'undefined')
			ajaxCart.collapse();
	}
	else
	{
		$('#right_column .block .title_block, #left_column .block .title_block, #left_column #newsletter_block_left h4').removeClass('active').off().parent().find('.block_content').removeAttr('style').slideDown('fast');
		$('#left_column, #right_column').removeClass('accordion');
	}
}
function accordionTop(status)
{
	if(status == 'enable')
	{
		$('#header').find('.content_top').addClass('toogle_content');
	}
	else
	{
		$('#header').find('.content_top').removeClass('toogle_content');
	}
}


(function($) {

  $.fn.rkmd_checkboxRipple = function() {
    var self, checkbox, ripple, size, rippleX, rippleY, eWidth, eHeight;
    self = this;
    checkbox = self.find('.input-checkbox');

    checkbox.on('mousedown', function(e) {
      if(e.button === 2) {
        return false;
      }

      if($(this).find('.ripple').length === 0) {
        $(this).append('<span class="ripple"></span>');
      }
      ripple = $(this).find('.ripple');

      eWidth = $(this).outerWidth();
      eHeight = $(this).outerHeight();
      size = Math.max(eWidth, eHeight);
      ripple.css({'width': size, 'height': size});
      ripple.addClass('animated');

      $(this).on('mouseup', function() {
        setTimeout(function () {
          ripple.removeClass('animated');
        }, 200);
      });

    });
  }

}(jQuery));

function change_checkbox_color() {
  $('.color-box .show-box').on('click', function() {
    $(".color-box").toggleClass("open");
  });

  $('.colors-list a').on('click', function() {
    var curr_color = $('main').data('checkbox-color');
    var color = $(this).data('checkbox-color');
    var new_colot = 'checkbox-' + color;

    $('.rkmd-checkbox .input-checkbox').each(function(i, v) {
      var findColor = $(this).hasClass(curr_color);

      if(findColor) {
        $(this).removeClass(curr_color);
        $(this).addClass(new_colot);
      }

      $('main').data('checkbox-color', new_colot);

    });
  });
}
