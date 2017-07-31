<?php
/**
 * Pts Prestashop Theme Framework for Prestashop 1.6.x
 *
 * @package   ptspagebuilder
 * @version   5.0
 * @author    http://www.prestabrain.com
 * @copyright Copyright (C) October 2013 prestabrain.com <@emai:prestabrain@gmail.com>
 *               <info@prestabrain.com>.All rights reserved.
 * @license   GNU General Public License version 2
 */

class PtsWidgetSubcategories_tab extends PtsWidgetPageBuilder {

		public $name = 'subcategories_tab';

		public  static function getWidgetInfo(){
			return array( 'label' => 'Display Subcategories Tabs', 'explain' => 'Display Subcategories Tabs', 'group' => 'prestashop'  );
		}

		public static function renderButton(){

		}

		public function renderForm( $args, $data ){
			$helper = $this->getFormHelper();

			$this->fields_form[1]['form'] = array(
	            'input' => array(
	            	array(
						'type'  => 'categories',
						'label' => $this->l('Parent category'),
						'name'  => 'id_parent'
					)
	            )
	        );
		 	$fields_value = $this->getConfigFieldsValues( $data  );
		 	$selected_categories = array((isset($fields_value['id_parent']) && $fields_value['id_parent']) ? $fields_value['id_parent'] : 0);
			
			$orders = array(
	            0 => array('value' => 'date_add', 'name' => $this->l('Date Add')),
	            1 => array('value' => 'date_add DESC', 'name' => $this->l('Date Add DESC')),
	            2 => array('value' => 'name', 'name' => $this->l('Name')),
	            3 => array('value' => 'name DESC', 'name' => $this->l('Name DESC')),
	            4 => array('value' => 'quantity', 'name' => $this->l('Quantity')),
	            5 => array('value' => 'quantity DESC', 'name' => $this->l('Quantity DESC')),
	            6 => array('value' => 'price', 'name' => $this->l('Price')),
	            7 => array('value' => 'price DESC', 'name' => $this->l('Price DESC'))
	        );

			$events = array(
	            0 => array('value' => 'hover', 'name' => $this->l('Hover')),
	            1 => array('value' => 'click DESC', 'name' => $this->l('Click'))
	        );


			$key = time();	
			$this->fields_form[1]['form'] = array(
	            'legend' => array(
	                'title' => $this->l('Widget Form.'),
	            ),
	            'input' => array(
	            	array(
						'type'  => 'categories',
						'label' => $this->l('Parent category'),
						'name'  => 'id_parent',
						'tree'  => array(
							'id'                  => 'categories-tree',
							'selected_categories' => $selected_categories,
							'disabled_categories' => null,
							'root_category'       => $this->context->shop->getCategory()
						)
					),
	                array(
	                    'type' => 'text',
	                    'label' => $this->l('Limit Subcategories'),
	                    'name' => 'limit_sub',
	                    'default'=> '6',
	                ),
	                array(
	                    'type'  => 'text',
	                    'label' => $this->l('Banner Image 1'),
	                    'name'  => 'imagefile1',
	                    'class' => 'imageupload',
	                    'default'=> '',
	                    'id'	 => 'imagefile1'.$key
	                ),
	                array(
	                    'type'  => 'text',
	                    'label' => $this->l('Banner URL 1'),
	                    'name'  => 'url1',
	                    'default'=> '#',
	                    'lang' => true
	                ),
	                array(
	                    'type'  => 'text',
	                    'label' => $this->l('Banner Image 2'),
	                    'name'  => 'imagefile2',
	                    'class' => 'imageupload',
	                    'default'=> '',
	                    'id'	 => 'imagefile2'.$key
	                ),
	                array(
	                    'type'  => 'text',
	                    'label' => $this->l('Banner URL 2'),
	                    'name'  => 'url2',
	                    'default'=> '#',
	                    'lang' => true
	                ),
	                array(
	                    'type'  => 'text',
	                    'label' => $this->l('Tab Icon'),
	                    'name'  => 'tabicon',
	                    'class' => 'imageupload',
	                    'default'=> '',
	                    'id'	 => 'tabicon'.$key
	                ),
	                array(
	                    'type'  => 'text',
	                    'label' => $this->l('Tab Index'),
	                    'name'  => 'tab_index',
	                    'default'=> '',
	                ),
	                array(
	                    'type' => 'select',
	                    'label' => $this->l( 'Order By' ),
	                    'name' => 'order_by',
	                    'options' => array(
	                    	'query' => $orders ,
	                    	'id' => 'value',
                            'name' => 'name'
                        ),
	                    'default' => "date_add"
	                ),
	                array(
	                    'type'  => 'text',
	                    'label' => $this->l('Limit'),
	                    'name'  => 'limit',
	                    'default'=> 6,
	                ),
	     			array(
	                    'type'  => 'text',
	                    'label' => $this->l('Column'),
	                    'name'  => 'column',
	                    'default'=> 4,
	                    'desc'	=> $this->l('Show In Carousel with N Column in each page')
	                ),
	                array(
	                    'type'  => 'text',
	                    'label' => $this->l('Items Per Page'),
	                    'name'  => 'itemsperpage',
	                    'default'=> 4,
	                    'desc'	=> $this->l('Show In Carousel, Max Products in each page')
	                ),
	     			array(
                        'type' => 'select',
                        'label' => $this->l('Tab event'),
                        'name' => 'event',
                        'options' => array(
                            'query' => $events,
                            'id' => 'value',
                            'name' => 'name'
                        ),
                        'default' => 'hover',
                    ),
	            ),

	      		'submit' => array(
	                'title' => $this->l('Save'),
	                'class' => 'button'
	       		)
	        );
			
		 	$default_lang = (int)Configuration::get('PS_LANG_DEFAULT');
			$helper->tpl_vars = array(
	                'fields_value' => $this->getConfigFieldsValues( $data  ),
	                'languages' => Context::getContext()->controller->getLanguages(),
	                'id_language' => $default_lang
        	);  
			$string = '
					<script type="text/javascript">
						$(".imageupload").WPO_Gallery({gallery:false} );
					</script>';
			return  '<div id="imageslist'.$key.'">'.$helper->generateForm( $this->fields_form ) .$string."</div>";
		}

		public function renderContent($args, $setting)
		{
			$t  = array(
				'id_parent' => '',
				'limit_sub' => 6,
				'imagefile1' => '',
				'url1' => '#',
				'imagefile2' => '',
				'url2' => '#',
				'tabicon' => '',
				'tab_index' => '',
				'order_by' => 'date_add',
				'limit' => 6,
				'column' => 4,
				'itemsperpage' => 4,
				'event' => 'hover'
			);

			$setting = array_merge( $t, $setting );
			$setting['id_category'] = $setting['id_parent'];
			$porder = preg_split("#\s+#", $setting['order_by']);
            if (!isset($porder[1])) {
                $porder[1] = null;
            }
			$context = Context::getContext();
			$languageID = $context->language->id;
			if ($setting['id_parent']) {
				$subcategories = self::getSubCategories($setting['id_parent'], $setting['limit_sub'], $context->language->id);
				foreach ($subcategories as &$category) {
					$obj = new Category($category['id_category'], $context->language->id);
					$category['products'] = $obj->getProducts($context->language->id, 0, $setting['limit'], $porder[0], $porder[1]);
				}
				$setting['subcategories'] = $subcategories;
				$setting['imageurl1'] = '';
				if ($setting['imagefile1'] && file_exists(_PAGEBUILDER_IMAGE_DIR_.$setting['imagefile1'])) {
					$setting['imageurl1'] = _PAGEBUILDER_IMAGE_URL_.$setting['imagefile1'];
				}
				$setting['imageurl2'] = '';
				if ($setting['imagefile2'] && file_exists(_PAGEBUILDER_IMAGE_DIR_.$setting['imagefile2'])) {
					$setting['imageurl2'] = _PAGEBUILDER_IMAGE_URL_.$setting['imagefile2'];
				}
				if ($setting['tabicon'] && file_exists(_PAGEBUILDER_IMAGE_DIR_.$setting['tabicon'])) {
					$setting['tabicon'] = _PAGEBUILDER_IMAGE_URL_.$setting['tabicon'];
				}
				$setting['url1'] = isset($setting['url1_'.$languageID]) ? ($setting['url1_'.$languageID]) : '';
				$setting['url2'] = isset($setting['url2_'.$languageID]) ? ($setting['url2_'.$languageID]) : '';
			}
			$dir = _PS_MODULE_DIR_.'/ptspagebuilder/views/templates/front/widgets/sub/products.tpl';
			$tdir = _PS_ALL_THEMES_DIR_ . _THEME_NAME_ . '/modules/ptspagebuilder/views/templates/front/widgets/sub/products.tpl';
            if (file_exists($tdir)) {
                $dir = $tdir;
            }

            $setting['product_tpl'] = $dir;
            $setting['wkey'] = rand(0,time());
			//d($setting);
			$output = array('type'=>'subcategories_tab', 'data' => $setting);

	  		return $output;
		}

		public function getSubCategories($id_category, $nb = 5, $id_lang, $active = true)
		{
			$sql_groups_where = '';
			$sql_groups_join = '';
			if (Group::isFeatureActive())
			{
				$sql_groups_join = 'LEFT JOIN `'._DB_PREFIX_.'category_group` cg ON (cg.`id_category` = c.`id_category`)';
				$groups = FrontController::getCurrentCustomerGroups();
				$sql_groups_where = 'AND cg.`id_group` '.(count($groups) ? 'IN ('.implode(',', $groups).')' : '='.(int)Group::getCurrent()->id);
			}

			$result = Db::getInstance(_PS_USE_SQL_SLAVE_)->executeS('
			SELECT c.*, cl.id_lang, cl.name, cl.description, cl.link_rewrite, cl.meta_title, cl.meta_keywords, cl.meta_description
			FROM `'._DB_PREFIX_.'category` c
			'.Shop::addSqlAssociation('category', 'c').'
			LEFT JOIN `'._DB_PREFIX_.'category_lang` cl ON (c.`id_category` = cl.`id_category` AND `id_lang` = '.(int)$id_lang.' '.Shop::addSqlRestrictionOnLang('cl').')
			'.$sql_groups_join.'
			WHERE `id_parent` = '.(int)$id_category.'
			'.($active ? 'AND `active` = 1' : '').'
			'.$sql_groups_where.'
			GROUP BY c.`id_category`
			ORDER BY `level_depth` ASC, category_shop.`position` ASC
			LIMIT 0,'.(int)$nb );

			foreach ($result as &$row)
			{
				$row['id_image'] = Tools::file_exists_cache(_PS_CAT_IMG_DIR_.$row['id_category'].'.jpg') ? (int)$row['id_category'] : Language::getIsoById($id_lang).'-default';
				$row['legend'] = 'no picture';
			}
			return $result;
		}

	}
?>