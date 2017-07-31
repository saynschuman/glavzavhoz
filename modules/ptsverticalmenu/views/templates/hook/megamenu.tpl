<div id="pts-verticalmenu" class="dropdown block js-lightbox-show">
  <div class="verticalmenu navbar navbar-default" role="navigation">
     <p class="title_block dropdown-toggle" data-target=".navbar-ex2-collapse" data-toggle="collapse">
         <span class="verticalmenu__name">Категории товаров</span>
         <span class="verticalmenu__hamburger"></span>
     </p>
     <div class="pts-verticalmenu navbar-collapse collapse navbar-ex2-collapse">
          {$ptsverticalmenu}
     </div>
  </div>
</div>


<script type="text/javascript">
    if($(window).width() >= 992){
        $('#pts-verticalmenu a.dropdown-toggle').click(function(){
            var redirect_url = $(this).attr('href');
            window.location = redirect_url;
        });
    }
</script>
