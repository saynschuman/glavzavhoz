{if $instantsearch}
	<script type="text/javascript">
	// <![CDATA[
		function tryToCloseInstantSearch() {
			if ($('#old_center_column').length > 0)
			{
				$('#center_column').remove();
				$('#old_center_column').attr('id', 'center_column');
				$('#center_column').show();
				return false;
			}
		}
		
		instantSearchQueries = new Array();
		function stopInstantSearchQueries(){
			for(i=0;i<instantSearchQueries.length;i++) {
				instantSearchQueries[i].abort();
			}
			instantSearchQueries = new Array();
		}
		
		$("#pts_search_query_{$ptsblocksearch_type}").keyup(function(){
			if($(this).val().length > 0){
				stopInstantSearchQueries();
				instantSearchQuery = $.ajax({
					url: '{if $search_ssl == 1}{$link->getPageLink('search', true)|addslashes}{else}{$link->getPageLink('search')|addslashes}{/if}',
					data: {
						instantSearch: 1,
						id_lang: {$cookie->id_lang},
						q: $(this).val(),
						category_filter: $("#category_filter").val()
					},
					dataType: 'html',
					type: 'POST',
					success: function(data){
						if($("#pts_search_query_{$ptsblocksearch_type}").val().length > 0)
						{
							tryToCloseInstantSearch();
							$('#center_column').attr('id', 'old_center_column');
							$('#old_center_column').after('<div id="center_column" class="' + $('#old_center_column').attr('class') + '">'+data+'</div>');
							$('#old_center_column').hide();
							// Button override
							ajaxCart.overrideButtonsInThePage();
							$("#instant_search_results a.close").click(function() {
								$("#pts_search_query_{$ptsblocksearch_type}").val('');
								return tryToCloseInstantSearch();
							});
							return false;
						}
						else
							tryToCloseInstantSearch();
					}
				});
				instantSearchQueries.push(instantSearchQuery);
			}
			else
				tryToCloseInstantSearch();
		});
	// ]]>
	</script>
{/if}


    <script type="text/javascript">
    // <![CDATA[
            $('document').ready( function() {
                    var ac = $("#pts_search_query_{$ptsblocksearch_type}")
                            .autocomplete(
                                    '{if $search_ssl == 1}{$link->getPageLink('search', true)|addslashes}{else}{$link->getPageLink('search')|addslashes}{/if}', {
                                            minChars: 3,
                                            max: 10,
                                            width: 500,
                                            selectFirst: false,
                                            scroll: false,
                                            dataType: "json",
                                            formatItem: function(data, i, max, value, term) {
                                                    return value;
                                            },
                                            parse: function(data) {
                                                    var mytab = new Array();
                                                    for (var i = 0; i < data.length; i++)
                                                        mytab[mytab.length] = { 
                                                            data: data[i], 
                                                            value: '<img class="pull-left" src="'+ data[i].image+'" style="margin-right:10px;"><div class="name">'+ data[i].pname +'</div><div class="price">Price '+ data[i].dprice +'</div> '
                                                        };
                                                    return mytab;
                                            },
                                            extraParams: {
                                                ajaxSearch: 1,
                                                id_lang: {$cookie->id_lang},
                                                category_filter: $("#category_filter").val()
                                            }
                                    }
                            )
                            .result(function(event, data, formatted) {
                                    $('#pts_search_query_{$ptsblocksearch_type}').val(data.pname);
                                    document.location.href = data.product_link;
                            });
                            
                            $("#category_filter").change(function() {
                                ac.setOptions({
                                    extraParams: {
                                        ajaxSearch: 1,
                                        id_lang: {$cookie->id_lang},
                                        category_filter: $("#category_filter").val()
                                    }
                                });
                            });
                              
            });
    // ]]>
    </script>