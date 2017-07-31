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

class PtsWidgetProducttabs extends PtsWidgetPageBuilder {

		public $name = 'producttabs';
		public $group = 'product';
		
		public static function getWidgetInfo(){
			return array('label' =>  ('Product Tabs'), 'explain' => 'Dislay Tabs: Newest, Bestseller, Special, Featured', 'group' => 'prestashop'  );
		}


		public function renderForm( $args, $data ){
			$helper = $this->getFormHelper();
			

	 		$soption = array(
	            array(
	                'id' => 'active_on',
	                'value' => 1,
	                'label' => $this->l('Enabled', 'producttabs')
	            ),
	            array(
	                'id' => 'active_off',
	                'value' => 0,
	                'label' => $this->l('Disabled', 'producttabs')
	            )
	        );
	 		$lists = array();
		 	$lists[] = array(
		 		'value' => 'list',
		 		'text'  => $this->l('List')
		 	);
		 	$lists[] = array(
		 		'value' => 'grid',
		 		'text'  => $this->l('Grid')
		 	);

	 		$this->fields_form[1]['form'] = array(
	            'input' => array (
	                array (
                        'type'  => 'categories_select',
                        'label' => $this->l('Categories:'),
                        'name'  => 'categoryBox',
                        'default' => '',
                    )
	            )
	        );
			$values = $this->getConfigFieldsValues( $data  );

			$selected_cat = $values['categoryBox'];
	        $categories = explode(',', $selected_cat);
	        $root = Category::getRootCategory();

	        $tree = new HelperTreeCategories('associated-categories-tree', 'Associated categories');
	        $tree->setRootCategory($root->id)
	            ->setUseCheckBox(true)
	            ->setUseSearch(true)
	            ->setSelectedCategories($categories);
	        $category_tpl = $tree->render();


			$this->fields_form[1]['form'] = array(
	            'legend' => array(
	                'title' => $this->l('Widget Form.', 'producttabs'),
	            ),
	            'input' => array(
	                array(
                        'type'  => 'categories_select',
                        'label' => $this->l('Categories:', 'producttabs'),
                        'name'  => 'categoryBox',
                        'category_tree'  =>  $category_tpl,
                        'default' => '1,2,3',
                        'desc' => $this->l('Categories only apply for Products List Type: Products Newest, Products Bestseller, Products Special, Products Top Rating, Products Most View', 'producttabs')
                    ),
 					array(
	                    'type'    => 'text',
	                    'label'   => $this->l('Limit', 'producttabs'),
	                    'name'    => 'limit',
	                    'default' => 6,
	                ),
	     			array(
	                    'type'  => 'text',
	                    'label' => $this->l('Column', 'producttabs'),
	                    'name'  => 'column',
	                    'default'=> 4,
	                    'desc'	=> $this->l('Show In Carousel with N Column in each page', 'producttabs')
	                ),
	                array(
	                    'type'  => 'text',
	                    'label' => $this->l('Items Per Page', 'producttabs'),
	                    'name'  => 'itemsperpage',
	                    'default'=> 4,
	                    'desc'	=> $this->l('Show In Carousel, Max Products in each page', 'producttabs')
	                ),
	                array(
	                    'type' 	  => 'switch',
	                    'label'   => $this->l('Enable Newest', 'producttabs'),
	                    'name' 	  => 'enable_newest',
	                    'values'  => $soption,
	                    'default' => "1",
	                    'desc'    => $this->l('Whethere to display Newest Products', 'producttabs')
	                ),
	                array(
	                    'type' 	  => 'switch',
	                    'label'   => $this->l('Enable Featured', 'producttabs'),
	                    'name' 	  => 'enable_featured',
	                    'values'  => $soption,
	                    'default' => "0",
	                    'desc'    => $this->l('Whethere to display featured Products', 'producttabs')
	                ),
	                array(
	                    'type' 	  => 'switch',
	                    'label'   => $this->l('Enable Bestseller', 'producttabs'),
	                    'name' 	  => 'enable_bestseller',
	                    'values'  => $soption,
	                    'default' => "1",
	                    'desc'    => $this->l('Whethere to display Bestseller Products', 'producttabs')
	                ),
	                array(
	                    'type' 	  => 'switch',
	                    'label'   => $this->l('Enable Special', 'producttabs'),
	                    'name' 	  => 'enable_special',
	                    'values'  => $soption,
	                    'default' => "1",
	                    'desc'    => $this->l('Whethere to display Special Products', 'producttabs')
	                ),
	                array(
	                    'type' 	  => 'switch',
	                    'label'   => $this->l('Enable Top Rating', 'producttabs'),
	                    'name' 	  => 'enable_toprating',
	                    'values'  => $soption,
	                    'default' => "1",
	                    'desc'    => $this->l('Whethere to display Top Rating Products', 'producttabs')
	                ),
	                array(
	                    'type' 	  => 'switch',
	                    'label'   => $this->l( 'Enable Most View' ),
	                    'name' 	  => 'enable_mostview',
	                    'values'  => $soption,
	                    'default' => "1",
	                    'desc'    => $this->l('Whethere to display Most View Products', 'producttabs')
	                ),
	                array(
	                    'type' 	  => 'select',
	                    'label'   => $this->l( 'List Mode' ),
	                    'name' 	  => 'list_mode',
	                    'options' => array(  'query' => $lists ,
	                    'id' 	  => 'value',
	                    'name' 	  => 'text' ),
	                    'default' => "grid",
	                ),
	            ),
	      		 'submit' => array(
	                'title' => $this->l('Save', 'producttabs'),
	                'class' => 'button'
           		 )
	        );

 
		 	$default_lang = (int)Configuration::get('PS_LANG_DEFAULT');
			
			$helper->tpl_vars = array(
	                'fields_value' => $this->getConfigFieldsValues( $data  ),
	                'languages' => Context::getContext()->controller->getLanguages(),
	                'id_language' => $default_lang
        	);  

			return  $helper->generateForm( $this->fields_form );
		}

		/**
		 *
		 */
		public function renderContent( $args, $setting ){ 

			$t = array(
				'categoryBox'=> '',
				'list_type'=> '',
				'list_mode' => 'grid',
				'limit' => 8,
				'image_width'=>'200',
				'image_height' =>'200',
				'enable_special' => '1',
				'enable_bestseller' => '1',
				'enable_featured' => '0',
				'enable_newest' => '1',
				'enable_mostview' => 0,
				'enable_toprating' => 0,
				'itemsperpage'	=> 4,
				'column'		=> 4,
			);
			
			$setting = array_merge( $t, $setting );
 			

 			
 			$output = array();
			//
			if( $setting['enable_newest'] ){
				$output['newest']['key'] = 'newest'.time();
				$output['newest']['title'] =  $this->l('New arrivals', 'producttabs');
				$output['newest']['products'] = self::getNewProducts($setting['categoryBox'], $this->langID, 0, (int)$setting['limit'] );
			}
			if( $setting['enable_bestseller'] ){
				$output['bestseller']['key'] = 'bestseller'.time();
				$output['bestseller']['title'] =  $this->l('Bestseller', 'producttabs');
				$output['bestseller']['products'] = self::getBestSalesLight($setting['categoryBox'], (int)$this->langID, 0, (int)$setting['limit']);
			}
			if( $setting['enable_featured'] ){
				$category = new Category(Context::getContext()->shop->getCategory(), $this->langID );
				$nb = (int)$setting['limit'];
				$output['featured']['key'] = 'featured'.time();
				$output['featured']['title'] =  $this->l('Featured', 'producttabs');
				$output['featured']['products'] = $category->getProducts((int)$this->langID, 1, ($nb ? $nb : 8));
			}
			if( $setting['enable_special'] ){	
				$output['special']['key'] = 'special'.time();
				$output['special']['title'] =  $this->l('Special', 'producttabs');
				$output['special']['products'] = self::getPricesDrop($setting['categoryBox'], $this->langID, 0, (int)$setting['limit'] );
			}
			if( $setting['enable_toprating'] ){	
				$output['toprating']['key'] = 'toprating'.time();
				$output['toprating']['title'] =  $this->l('Top Rating', 'producttabs');
				$output['toprating']['products'] = self::getProducts($setting['categoryBox'], 0, (int)$setting['limit'] );
			}
			if( $setting['enable_mostview'] ){	
				$output['mostview']['key'] = 'mostview'.time();
				$output['mostview']['title'] =  $this->l('Most View', 'producttabs');
				$output['mostview']['products'] = self::getProducts($setting['categoryBox'], 0, (int)$setting['limit'], true, null, 'mostview' );
			}

			$dir = _PS_MODULE_DIR_.'/ptspagebuilder/views/templates/front/widgets/sub/products.tpl';
			if($setting['list_mode'] == 'list'){
				$tdir = _PS_ALL_THEMES_DIR_ . _THEME_NAME_ . '/modules/ptspagebuilder/views/templates/front/widgets/sub/products_list2.tpl';
			}else{
				$tdir = _PS_ALL_THEMES_DIR_ . _THEME_NAME_ . '/modules/ptspagebuilder/views/templates/front/widgets/sub/products.tpl';
			}
            if (file_exists($tdir)) {
                $dir = $tdir;
            }

			$setting['producttabs'] = $output;
			$setting['product_tpl']  = $dir;
			$link = Context::getContext()->link; 
			$setting['link'] = $link;
		//   echo '<pre>'.print_r(  $output, 1 );die; 
			$output = array('type'=>'producttabs','data' => $setting );
 
			return $output;
		}

		public static function getProducts($categories, $p = 1, $n, $active = true, Context $context = null, $type = 'toprating')
	    {
	        if (!$context)
	            $context = Context::getContext();
	        $id_lang = $context->language->id;

	        $front = true;
	        if (!in_array($context->controller->controller_type, array('front', 'modulefront')))
	            $front = false;

	        if ($p < 1) $p = 1;

	        $id_supplier = (int)Tools::getValue('id_supplier');

	        $sql = 'SELECT p.*, product_shop.*, stock.out_of_stock, IFNULL(stock.quantity, 0) as quantity, MAX(product_attribute_shop.id_product_attribute) id_product_attribute, product_attribute_shop.minimal_quantity AS product_attribute_minimal_quantity, pl.`description`, pl.`description_short`, pl.`available_now`,
	                pl.`available_later`, pl.`link_rewrite`, pl.`meta_description`, pl.`meta_keywords`, pl.`meta_title`, pl.`name`, MAX(image_shop.`id_image`) id_image,
	                il.`legend`, m.`name` AS manufacturer_name, cl.`name` AS category_default,
	                DATEDIFF(product_shop.`date_add`, DATE_SUB(NOW(),
	                INTERVAL '.(Validate::isUnsignedInt(Configuration::get('PS_NB_DAYS_NEW_PRODUCT')) ? Configuration::get('PS_NB_DAYS_NEW_PRODUCT') : 20).'
	                    DAY)) > 0 AS new, product_shop.price AS orderprice'. ($type == 'mostview' ? ', count(cnn.id_connections) as pages' : ''). ($type == 'toprating' ? ', AVG(pc.grade) as avg_grade' : '').'
	            FROM `'._DB_PREFIX_.'category_product` cp
	            LEFT JOIN `'._DB_PREFIX_.'product` p
	                ON p.`id_product` = cp.`id_product`
	            '.Shop::addSqlAssociation('product', 'p').'
	            LEFT JOIN `'._DB_PREFIX_.'product_attribute` pa
	            ON (p.`id_product` = pa.`id_product`)
	            '.Shop::addSqlAssociation('product_attribute', 'pa', false, 'product_attribute_shop.`default_on` = 1').'
	            '.Product::sqlStock('p', 'product_attribute_shop', false, $context->shop).'
	            LEFT JOIN `'._DB_PREFIX_.'category_lang` cl
	                ON (product_shop.`id_category_default` = cl.`id_category`
	                AND cl.`id_lang` = '.(int)$id_lang.Shop::addSqlRestrictionOnLang('cl').')
	            LEFT JOIN `'._DB_PREFIX_.'product_lang` pl
	                ON (p.`id_product` = pl.`id_product`
	                AND pl.`id_lang` = '.(int)$id_lang.Shop::addSqlRestrictionOnLang('pl').')
	            LEFT JOIN `'._DB_PREFIX_.'image` i
	                ON (i.`id_product` = p.`id_product`)'.
	            Shop::addSqlAssociation('image', 'i', false, 'image_shop.cover=1').'
	            LEFT JOIN `'._DB_PREFIX_.'image_lang` il
	                ON (image_shop.`id_image` = il.`id_image`
	                AND il.`id_lang` = '.(int)$id_lang.')
	            LEFT JOIN `'._DB_PREFIX_.'manufacturer` m
	                ON m.`id_manufacturer` = p.`id_manufacturer`

	            '. ($type == 'mostview' ? '
				LEFT JOIN `'._DB_PREFIX_.'page` pag ON (cp.id_product = pag.id_object)
				LEFT JOIN `'._DB_PREFIX_.'connections` cnn ON (cnn.id_page = pag.id_page)
				LEFT JOIN `'._DB_PREFIX_.'page_type` pat ON (pat.id_page_type = pag.id_page_type)
				' : '').
				($type == 'toprating' ? '
				JOIN `'._DB_PREFIX_.'product_comment` pc ON (cp.id_product = pc.id_product AND pc.validate = 1)
				' : '').'

	            WHERE product_shop.`id_shop` = '.(int)$context->shop->id.($type == 'mostview' ? ' AND pat.`name` = \'product\'' : '')
	            .($active ? ' AND product_shop.`active` = 1' : '')
	            .($front ? ' AND product_shop.`visibility` IN ("both", "catalog")' : '')
	            .($id_supplier ? ' AND p.id_supplier = '.(int)$id_supplier : '')
	            .($categories ? ' AND cp.id_category IN (0, '.$categories.')' : '');
				
			if($type == 'mostview'){
				$sql .=' GROUP BY cnn.id_page';
				$sql .= ' ORDER BY pages DESC ';
			}elseif($type == 'toprating'){
				$sql .= ' GROUP BY product_shop.id_product ';
	        	$sql .= ' ORDER BY avg_grade DESC ';
	        }
	        $sql .=' LIMIT '.(((int)$p - 1) * (int)$n).','.(int)$n;
	        $result = Db::getInstance(_PS_USE_SQL_SLAVE_)->executeS($sql);
	        if (!$result)
	            return array();
	        /* Modify SQL result */
	        return Product::getProductsProperties($id_lang, $result);
	    }

	    public static function getNewProducts($categories, $id_lang, $page_number = 0, $nb_products = 10, $order_by = null, $order_way = null, Context $context = null)
		{
			if (!$context)
				$context = Context::getContext();

			$front = true;
			if (!in_array($context->controller->controller_type, array('front', 'modulefront')))
				$front = false;

			if ($page_number < 0) $page_number = 0;
			if ($nb_products < 1) $nb_products = 10;
			if (empty($order_by) || $order_by == 'position') $order_by = 'date_add';
			if (empty($order_way)) $order_way = 'DESC';
			if ($order_by == 'id_product' || $order_by == 'price' || $order_by == 'date_add'  || $order_by == 'date_upd')
				$order_by_prefix = 'p';
			else if ($order_by == 'name')
				$order_by_prefix = 'pl';
			if (!Validate::isOrderBy($order_by) || !Validate::isOrderWay($order_way))
				die(Tools::displayError());

			$sql_groups = '';
			if (Group::isFeatureActive())
			{
				$groups = FrontController::getCurrentCustomerGroups();
				$sql_groups = 'AND p.`id_product` IN (
					SELECT cp.`id_product`
					FROM `'._DB_PREFIX_.'category_group` cg
					LEFT JOIN `'._DB_PREFIX_.'category_product` cp ON (cp.`id_category` = cg.`id_category`)
					WHERE cg.`id_group` '.(count($groups) ? 'IN ('.implode(',', $groups).')' : '= 1').'
				)';
			}

			if (strpos($order_by, '.') > 0)
			{
				$order_by = explode('.', $order_by);
				$order_by_prefix = $order_by[0];
				$order_by = $order_by[1];
			}

			$sql = new DbQuery();
			$sql->select(
				'p.*, product_shop.*, stock.out_of_stock, IFNULL(stock.quantity, 0) as quantity, pl.`description`, pl.`description_short`, pl.`link_rewrite`, pl.`meta_description`,
				pl.`meta_keywords`, pl.`meta_title`, pl.`name`, pl.`available_now`, pl.`available_later`, MAX(image_shop.`id_image`) id_image, il.`legend`, m.`name` AS manufacturer_name,
				product_shop.`date_add` > "'.date('Y-m-d', strtotime('-'.(Configuration::get('PS_NB_DAYS_NEW_PRODUCT') ? (int)Configuration::get('PS_NB_DAYS_NEW_PRODUCT') : 20).' DAY')).'" as new'
			);

			$sql->from('product', 'p');
			$sql->join(Shop::addSqlAssociation('product', 'p'));
			$sql->leftJoin('product_lang', 'pl', '
				p.`id_product` = pl.`id_product`
				AND pl.`id_lang` = '.(int)$id_lang.Shop::addSqlRestrictionOnLang('pl')
			);
			$sql->leftJoin('category_product', 'cpp', 'cpp.`id_product` = p.`id_product`');

			$sql->leftJoin('image', 'i', 'i.`id_product` = p.`id_product`');
			$sql->join(Shop::addSqlAssociation('image', 'i', false, 'image_shop.cover=1'));
			$sql->leftJoin('image_lang', 'il', 'i.`id_image` = il.`id_image` AND il.`id_lang` = '.(int)$id_lang);
			$sql->leftJoin('manufacturer', 'm', 'm.`id_manufacturer` = p.`id_manufacturer`');

			$sql->where('product_shop.`active` = 1');
			if ($front)
				$sql->where('product_shop.`visibility` IN ("both", "catalog")');
			$sql->where('product_shop.`date_add` > "'.date('Y-m-d', strtotime('-'.(Configuration::get('PS_NB_DAYS_NEW_PRODUCT') ? (int)Configuration::get('PS_NB_DAYS_NEW_PRODUCT') : 20).' DAY')).'"');
			
			if($categories)
				$sql->where('cpp.`id_category` IN (0, '.$categories.')');
			

			if (Group::isFeatureActive())
				$sql->where('p.`id_product` IN (
					SELECT cp.`id_product`
					FROM `'._DB_PREFIX_.'category_group` cg
					LEFT JOIN `'._DB_PREFIX_.'category_product` cp ON (cp.`id_category` = cg.`id_category`)
					WHERE cg.`id_group` '.$sql_groups.'
				)');
			$sql->groupBy('product_shop.id_product');

			$sql->orderBy((isset($order_by_prefix) ? pSQL($order_by_prefix).'.' : '').'`'.pSQL($order_by).'` '.pSQL($order_way));
			$sql->limit($nb_products, $page_number * $nb_products);

			if (Combination::isFeatureActive())
			{
				$sql->select('MAX(product_attribute_shop.id_product_attribute) id_product_attribute');
				$sql->leftOuterJoin('product_attribute', 'pa', 'p.`id_product` = pa.`id_product`');
				$sql->join(Shop::addSqlAssociation('product_attribute', 'pa', false, 'product_attribute_shop.default_on = 1'));
			}
			$sql->join(Product::sqlStock('p', Combination::isFeatureActive() ? 'product_attribute_shop' : 0));

			$result = Db::getInstance(_PS_USE_SQL_SLAVE_)->executeS($sql);

			if ($order_by == 'price')
				Tools::orderbyPrice($result, $order_way);
			if (!$result)
				return false;

			$products_ids = array();
			foreach ($result as $row)
				$products_ids[] = $row['id_product'];
			// Thus you can avoid one query per product, because there will be only one query for all the products of the cart
			Product::cacheFrontFeatures($products_ids, $id_lang);
			return Product::getProductsProperties((int)$id_lang, $result);
		}

		public static function getBestSalesLight($categories, $id_lang, $page_number = 0, $nb_products = 10, Context $context = null)
		{
			if (!$context)
				$context = Context::getContext();
			if ($page_number < 0) $page_number = 0;
			if ($nb_products < 1) $nb_products = 10;

			$sql_groups = '';
			if (Group::isFeatureActive())
			{
				$groups = FrontController::getCurrentCustomerGroups();
				$sql_groups = 'AND cg.`id_group` '.(count($groups) ? 'IN ('.implode(',', $groups).')' : '= 1');
			}

			//Subquery: get product ids in a separate query to (greatly!) improve performances and RAM usage
			$products = Db::getInstance(_PS_USE_SQL_SLAVE_)->executeS('
			SELECT cp.`id_product`
			FROM `'._DB_PREFIX_.'category_product` cp
			LEFT JOIN `'._DB_PREFIX_.'category_group` cg ON (cg.`id_category` = cp.`id_category`)
			WHERE cg.`id_group` '.$sql_groups);
			
			$ids = array();
			foreach ($products as $product)
				$ids[$product['id_product']] = 1;

			$ids = array_keys($ids);		
			sort($ids);
			$ids = count($ids) > 0 ? implode(',', $ids) : 'NULL';

			//Main query
			$sql = '
			SELECT
				p.id_product,  MAX(product_attribute_shop.id_product_attribute) id_product_attribute, pl.`link_rewrite`, pl.`name`, pl.`description_short`, product_shop.`id_category_default`,
				MAX(image_shop.`id_image`) id_image, il.`legend`,
				ps.`quantity` AS sales, p.`ean13`, p.`upc`, cl.`link_rewrite` AS category, p.show_price, p.available_for_order, IFNULL(stock.quantity, 0) as quantity, p.customizable,
				IFNULL(pa.minimal_quantity, p.minimal_quantity) as minimal_quantity, stock.out_of_stock,
				product_shop.`date_add` > "'.date('Y-m-d', strtotime('-'.(Configuration::get('PS_NB_DAYS_NEW_PRODUCT') ? (int)Configuration::get('PS_NB_DAYS_NEW_PRODUCT') : 20).' DAY')).'" as new, product_shop.`on_sale`
			FROM `'._DB_PREFIX_.'product_sale` ps
			LEFT JOIN `'._DB_PREFIX_.'product` p ON ps.`id_product` = p.`id_product`
			'.Shop::addSqlAssociation('product', 'p').'
			LEFT JOIN `'._DB_PREFIX_.'product_attribute` pa
				ON (p.`id_product` = pa.`id_product`)
			'.Shop::addSqlAssociation('product_attribute', 'pa', false, 'product_attribute_shop.`default_on` = 1').'
			'.Product::sqlStock('p', 'product_attribute_shop', false, $context->shop).'
			LEFT JOIN `'._DB_PREFIX_.'product_lang` pl
				ON p.`id_product` = pl.`id_product`
				AND pl.`id_lang` = '.(int)$id_lang.Shop::addSqlRestrictionOnLang('pl').'
			LEFT JOIN `'._DB_PREFIX_.'image` i ON (i.`id_product` = p.`id_product`)'.
			Shop::addSqlAssociation('image', 'i', false, 'image_shop.cover=1').'
			LEFT JOIN `'._DB_PREFIX_.'image_lang` il ON (i.`id_image` = il.`id_image` AND il.`id_lang` = '.(int)$id_lang.')
			LEFT JOIN `'._DB_PREFIX_.'category_lang` cl
				ON cl.`id_category` = product_shop.`id_category_default`
				AND cl.`id_lang` = '.(int)$id_lang.Shop::addSqlRestrictionOnLang('cl').'
			WHERE product_shop.`active` = 1
			AND p.`visibility` != \'none\'
			AND p.`id_product` IN ('.$ids.')
			'.($categories ? 'AND product_shop.`id_category_default` IN (0, '.$categories.')' : '').'
			GROUP BY product_shop.id_product
			ORDER BY sales DESC
			LIMIT '.(int)($page_number * $nb_products).', '.(int)$nb_products;

			if (!$result = Db::getInstance(_PS_USE_SQL_SLAVE_)->executeS($sql))
				return false;

			return Product::getProductsProperties($id_lang, $result);
		}

		public static function getPricesDrop($categories, $id_lang, $page_number = 0, $nb_products = 10, $order_by = null, $order_way = null, $beginning = false, $ending = false, Context $context = null)
		{
			if (!$context) $context = Context::getContext();
			if ($page_number < 0) $page_number = 0;
			if ($nb_products < 1) $nb_products = 10;
			if (empty($order_by) || $order_by == 'position') $order_by = 'price';
			if (empty($order_way)) $order_way = 'DESC';
			if ($order_by == 'id_product' || $order_by == 'price' || $order_by == 'date_add'  || $order_by == 'date_upd')
				$order_by_prefix = 'p';
			else if ($order_by == 'name')
				$order_by_prefix = 'pl';
			if (!Validate::isOrderBy($order_by) || !Validate::isOrderWay($order_way))
				die (Tools::displayError());
			$current_date = date('Y-m-d H:i:s');
			$ids_product = self::_getProductIdByDate($categories, (!$beginning ? $current_date : $beginning), (!$ending ? $current_date : $ending), $context);

			$tab_id_product = array();
			foreach ($ids_product as $product)
				if (is_array($product))
					$tab_id_product[] = (int)$product['id_product'];
				else
					$tab_id_product[] = (int)$product;

			$front = true;
			if (!in_array($context->controller->controller_type, array('front', 'modulefront')))
				$front = false;

			$sql_groups = '';
			if (Group::isFeatureActive())
			{
				$groups = FrontController::getCurrentCustomerGroups();
				$sql_groups = 'AND p.`id_product` IN (
					SELECT cp.`id_product`
					FROM `'._DB_PREFIX_.'category_group` cg
					LEFT JOIN `'._DB_PREFIX_.'category_product` cp ON (cp.`id_category` = cg.`id_category`)
					WHERE cg.`id_group` '.(count($groups) ? 'IN ('.implode(',', $groups).')' : '= 1').'
				)';
			}
			
			if (strpos($order_by, '.') > 0)
			{
				$order_by = explode('.', $order_by);
				$order_by = pSQL($order_by[0]).'.`'.pSQL($order_by[1]).'`';
			}

			$sql = '
			SELECT
				p.*, product_shop.*, stock.out_of_stock, IFNULL(stock.quantity, 0) as quantity, pl.`description`, pl.`description_short`,
				MAX(product_attribute_shop.id_product_attribute) id_product_attribute,
				pl.`link_rewrite`, pl.`meta_description`, pl.`meta_keywords`, pl.`meta_title`,
				pl.`name`, MAX(image_shop.`id_image`) id_image, il.`legend`, m.`name` AS manufacturer_name,
				DATEDIFF(
					p.`date_add`,
					DATE_SUB(
						NOW(),
						INTERVAL '.(Validate::isUnsignedInt(Configuration::get('PS_NB_DAYS_NEW_PRODUCT')) ? Configuration::get('PS_NB_DAYS_NEW_PRODUCT') : 20).' DAY
					)
				) > 0 AS new
			FROM `'._DB_PREFIX_.'product` p
			'.Shop::addSqlAssociation('product', 'p').'
			LEFT JOIN '._DB_PREFIX_.'product_attribute pa ON (pa.id_product = p.id_product)
			'.Shop::addSqlAssociation('product_attribute', 'pa', false, 'product_attribute_shop.default_on=1').'
			'.Product::sqlStock('p', 0, false, $context->shop).'
			LEFT JOIN `'._DB_PREFIX_.'product_lang` pl ON (
				p.`id_product` = pl.`id_product`
				AND pl.`id_lang` = '.(int)$id_lang.Shop::addSqlRestrictionOnLang('pl').'
			)
			LEFT JOIN `'._DB_PREFIX_.'image` i ON (i.`id_product` = p.`id_product`)'.
			Shop::addSqlAssociation('image', 'i', false, 'image_shop.cover=1').'
			LEFT JOIN `'._DB_PREFIX_.'image_lang` il ON (i.`id_image` = il.`id_image` AND il.`id_lang` = '.(int)$id_lang.')
			LEFT JOIN `'._DB_PREFIX_.'manufacturer` m ON (m.`id_manufacturer` = p.`id_manufacturer`)
			WHERE product_shop.`active` = 1
			AND product_shop.`show_price` = 1
			'.($front ? ' AND p.`visibility` IN ("both", "catalog")' : '').'
			'.((!$beginning && !$ending) ? ' AND p.`id_product` IN ('.((is_array($tab_id_product) && count($tab_id_product)) ? implode(', ', $tab_id_product) : 0).')' : '').'
			'.$sql_groups.'
			GROUP BY product_shop.id_product
			ORDER BY '.(isset($order_by_prefix) ? pSQL($order_by_prefix).'.' : '').pSQL($order_by).' '.pSQL($order_way).'
			LIMIT '.(int)($page_number * $nb_products).', '.(int)$nb_products;

			$result = Db::getInstance(_PS_USE_SQL_SLAVE_)->executeS($sql);

			if (!$result)
				return false;

			if ($order_by == 'price')
				Tools::orderbyPrice($result, $order_way);

			return Product::getProductsProperties($id_lang, $result);
		}

		public static function _getProductIdByDate($categories, $beginning, $ending, Context $context = null, $with_combination = false)
		{
			if (!$context)
				$context = Context::getContext();

			$id_address = $context->cart->{Configuration::get('PS_TAX_ADDRESS_TYPE')};
			$ids = Address::getCountryAndState($id_address);
			$id_country = (int)($ids['id_country'] ? $ids['id_country'] : Configuration::get('PS_COUNTRY_DEFAULT'));

			return self::getProductIdByDate(
				$categories,
				$context->shop->id,
				$context->currency->id,
				$id_country,
				$context->customer->id_default_group,
				$beginning,
				$ending,
				0,
				$with_combination
			);
		}

		public static function getProductIdByDate($categories, $id_shop, $id_currency, $id_country, $id_group, $beginning, $ending, $id_customer = 0, $with_combination_id = false)
		{
			if (!SpecificPrice::isFeatureActive())
				return array();

			$result = Db::getInstance(_PS_USE_SQL_SLAVE_)->executeS('
				SELECT sp.`id_product`, sp.`id_product_attribute`
				FROM `'._DB_PREFIX_.'specific_price` sp 
				JOIN `'._DB_PREFIX_.'category_product` cp ON (sp.`id_product` = cp.`id_product`)
				WHERE	sp.`id_shop` IN(0, '.(int)$id_shop.') AND
						sp.`id_currency` IN(0, '.(int)$id_currency.') AND
						sp.`id_country` IN(0, '.(int)$id_country.') AND
						sp.`id_group` IN(0, '.(int)$id_group.') AND
						sp.`id_customer` IN(0, '.(int)$id_customer.') AND
						sp.`from_quantity` = 1 AND
						(
							(`from` = \'0000-00-00 00:00:00\' OR \''.pSQL($beginning).'\' >= `from`)
							AND
							(`to` = \'0000-00-00 00:00:00\' OR \''.pSQL($ending).'\' <= `to`)
						)
						AND
						sp.`reduction` > 0
						'.($categories ? ' AND cp.`id_category` IN (0, '.$categories.')' : '').'
			', false);
			$ids_product = array();
			while ($row = Db::getInstance()->nextRow($result))
				$ids_product[] = $with_combination_id ? array('id_product' => (int)$row['id_product'], 'id_product_attribute' => (int)$row['id_product_attribute']) : (int)$row['id_product'];
			return $ids_product;
		}

	}
?>