<?php 
$query_tables = array();
$query_sql = array();
$query_tables['ptsmegamenu']['ptsmegamenu'] = 'CREATE TABLE IF NOT EXISTS  `'._DB_PREFIX_.'ptsmegamenu` (
  `id_ptsmegamenu` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  `id_parent` int(11) NOT NULL,
  `is_group` tinyint(1) NOT NULL,
  `width` varchar(255) DEFAULT NULL,
  `submenu_width` varchar(255) DEFAULT NULL,
  `colum_width` varchar(255) DEFAULT NULL,
  `submenu_colum_width` varchar(255) DEFAULT NULL,
  `item` varchar(255) DEFAULT NULL,
  `colums` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `is_content` tinyint(1) NOT NULL,
  `show_title` tinyint(1) NOT NULL,
  `type_submenu` varchar(10) NOT NULL,
  `level_depth` smallint(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `position` int(11) NOT NULL,
  `submenu_content` text NOT NULL,
  `show_sub` tinyint(1) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `target` varchar(25) DEFAULT NULL,
  `privacy` smallint(6) DEFAULT NULL,
  `position_type` varchar(25) DEFAULT NULL,
  `menu_class` varchar(25) DEFAULT NULL,
  `content` text,
  `icon_class` varchar(255) DEFAULT NULL,
  `level` int(11) NOT NULL,
  `left` int(11) NOT NULL,
  `right` int(11) NOT NULL,
  `submenu_catids` text,
  `is_cattree` tinyint(1) DEFAULT \'1\',
  `date_add` datetime DEFAULT NULL,
  `date_upd` datetime DEFAULT NULL,
  PRIMARY KEY (`id_ptsmegamenu`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8';


$query_tables['ptsmegamenu']['ptsmegamenu_lang'] = 'CREATE TABLE IF NOT EXISTS  `'._DB_PREFIX_.'ptsmegamenu_lang` (
  `id_ptsmegamenu` int(11) NOT NULL,
  `id_lang` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `description` text,
  `content_text` text,
  `submenu_content_text` text,
  PRIMARY KEY (`id_ptsmegamenu`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8';


$query_tables['ptsmegamenu']['ptsmegamenu_shop'] = 'CREATE TABLE IF NOT EXISTS  `'._DB_PREFIX_.'ptsmegamenu_shop` (
  `id_ptsmegamenu` int(11) NOT NULL DEFAULT \'0\',
  `id_shop` int(11) NOT NULL DEFAULT \'0\',
  PRIMARY KEY (`id_ptsmegamenu`,`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8';


$query_tables['ptsmegamenu']['ptsmegamenu_widgets'] = 'CREATE TABLE IF NOT EXISTS  `'._DB_PREFIX_.'ptsmegamenu_widgets` (
  `id_widget` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `type` varchar(255) NOT NULL,
  `params` text NOT NULL,
  `id_shop` int(11) NOT NULL,
  `key_widget` int(11) NOT NULL,
  PRIMARY KEY (`id_widget`,`id_shop`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8';


/*DATA FOR TABLE ptsmegamenu*/
 $query_sql['ptsmegamenu'][] = 'INSERT INTO '._DB_PREFIX_.'ptsmegamenu( `id_ptsmegamenu`,`image`,`id_parent`,`is_group`,`width`,`submenu_width`,`colum_width`,`submenu_colum_width`,`item`,`colums`,`type`,`is_content`,`show_title`,`type_submenu`,`level_depth`,`active`,`position`,`submenu_content`,`show_sub`,`url`,`target`,`privacy`,`position_type`,`menu_class`,`content`,`icon_class`,`level`,`left`,`right`,`submenu_catids`,`is_cattree`,`date_add`,`date_upd` ) 
							VALUES(\'22\', \'\', \'1\', \'0\', \'\', \'\', \'\', \'\', \'\', \'1\', \'url\', \'0\', \'1\', \'menu\', \'1\', \'1\', \'0\', \'\', \'0\', \'index.php\', \'_self\', \'0\', \'\', \'\', \'\', \'\', \'0\', \'0\', \'0\', \'\', \'1\', \'2014-06-10 03:49:18\', \'2014-06-10 04:39:30\')'; 
 $query_sql['ptsmegamenu'][] = 'INSERT INTO '._DB_PREFIX_.'ptsmegamenu( `id_ptsmegamenu`,`image`,`id_parent`,`is_group`,`width`,`submenu_width`,`colum_width`,`submenu_colum_width`,`item`,`colums`,`type`,`is_content`,`show_title`,`type_submenu`,`level_depth`,`active`,`position`,`submenu_content`,`show_sub`,`url`,`target`,`privacy`,`position_type`,`menu_class`,`content`,`icon_class`,`level`,`left`,`right`,`submenu_catids`,`is_cattree`,`date_add`,`date_upd` ) 
							VALUES(\'23\', \'\', \'1\', \'0\', \'\', \'\', \'\', \'\', \'2\', \'1\', \'url\', \'0\', \'1\', \'menu\', \'1\', \'1\', \'1\', \'\', \'0\', \'#\', \'_self\', \'0\', \'\', \'\', \'\', \'\', \'0\', \'0\', \'0\', \'\', \'1\', \'2014-06-10 05:37:02\', \'2015-04-13 03:24:06\')'; 
 $query_sql['ptsmegamenu'][] = 'INSERT INTO '._DB_PREFIX_.'ptsmegamenu( `id_ptsmegamenu`,`image`,`id_parent`,`is_group`,`width`,`submenu_width`,`colum_width`,`submenu_colum_width`,`item`,`colums`,`type`,`is_content`,`show_title`,`type_submenu`,`level_depth`,`active`,`position`,`submenu_content`,`show_sub`,`url`,`target`,`privacy`,`position_type`,`menu_class`,`content`,`icon_class`,`level`,`left`,`right`,`submenu_catids`,`is_cattree`,`date_add`,`date_upd` ) 
							VALUES(\'24\', \'\', \'1\', \'0\', \'\', \'\', \'\', \'\', \'\', \'1\', \'url\', \'0\', \'1\', \'menu\', \'1\', \'1\', \'2\', \'\', \'0\', \'index.php\', \'_self\', \'0\', \'\', \'hot\', \'\', \'\', \'0\', \'0\', \'0\', \'\', \'1\', \'2014-06-10 06:31:22\', \'2015-07-29 22:49:11\')'; 
 $query_sql['ptsmegamenu'][] = 'INSERT INTO '._DB_PREFIX_.'ptsmegamenu( `id_ptsmegamenu`,`image`,`id_parent`,`is_group`,`width`,`submenu_width`,`colum_width`,`submenu_colum_width`,`item`,`colums`,`type`,`is_content`,`show_title`,`type_submenu`,`level_depth`,`active`,`position`,`submenu_content`,`show_sub`,`url`,`target`,`privacy`,`position_type`,`menu_class`,`content`,`icon_class`,`level`,`left`,`right`,`submenu_catids`,`is_cattree`,`date_add`,`date_upd` ) 
							VALUES(\'26\', \'\', \'1\', \'0\', \'\', \'\', \'\', \'\', \'4\', \'1\', \'url\', \'0\', \'1\', \'menu\', \'1\', \'1\', \'4\', \'\', \'0\', \'list&fc=module&module=leoblog\', \'_self\', \'0\', \'\', \'\', \'\', \'\', \'0\', \'0\', \'0\', \'\', \'1\', \'2014-06-10 06:34:37\', \'2015-03-13 04:58:35\')'; 
 $query_sql['ptsmegamenu'][] = 'INSERT INTO '._DB_PREFIX_.'ptsmegamenu( `id_ptsmegamenu`,`image`,`id_parent`,`is_group`,`width`,`submenu_width`,`colum_width`,`submenu_colum_width`,`item`,`colums`,`type`,`is_content`,`show_title`,`type_submenu`,`level_depth`,`active`,`position`,`submenu_content`,`show_sub`,`url`,`target`,`privacy`,`position_type`,`menu_class`,`content`,`icon_class`,`level`,`left`,`right`,`submenu_catids`,`is_cattree`,`date_add`,`date_upd` ) 
							VALUES(\'27\', \'\', \'1\', \'0\', \'\', \'\', \'\', \'\', \'\', \'1\', \'url\', \'0\', \'1\', \'menu\', \'1\', \'1\', \'3\', \'\', \'0\', \'sitemap\', \'_self\', \'0\', \'\', \'\', \'\', \'\', \'0\', \'0\', \'0\', \'\', \'1\', \'2014-06-10 06:35:25\', \'2015-07-28 03:17:35\')'; 
 $query_sql['ptsmegamenu'][] = 'INSERT INTO '._DB_PREFIX_.'ptsmegamenu( `id_ptsmegamenu`,`image`,`id_parent`,`is_group`,`width`,`submenu_width`,`colum_width`,`submenu_colum_width`,`item`,`colums`,`type`,`is_content`,`show_title`,`type_submenu`,`level_depth`,`active`,`position`,`submenu_content`,`show_sub`,`url`,`target`,`privacy`,`position_type`,`menu_class`,`content`,`icon_class`,`level`,`left`,`right`,`submenu_catids`,`is_cattree`,`date_add`,`date_upd` ) 
							VALUES(\'28\', \'\', \'27\', \'0\', \'\', \'\', \'\', \'\', \'\', \'1\', \'url\', \'0\', \'1\', \'menu\', \'2\', \'1\', \'1\', \'\', \'0\', \'index.php?controller=sitemap\', \'_self\', \'0\', \'\', \'\', \'\', \'\', \'0\', \'0\', \'0\', \'\', \'1\', \'2014-06-10 06:37:09\', \'2015-04-03 05:45:56\')'; 
 $query_sql['ptsmegamenu'][] = 'INSERT INTO '._DB_PREFIX_.'ptsmegamenu( `id_ptsmegamenu`,`image`,`id_parent`,`is_group`,`width`,`submenu_width`,`colum_width`,`submenu_colum_width`,`item`,`colums`,`type`,`is_content`,`show_title`,`type_submenu`,`level_depth`,`active`,`position`,`submenu_content`,`show_sub`,`url`,`target`,`privacy`,`position_type`,`menu_class`,`content`,`icon_class`,`level`,`left`,`right`,`submenu_catids`,`is_cattree`,`date_add`,`date_upd` ) 
							VALUES(\'29\', \'\', \'27\', \'0\', \'\', \'\', \'\', \'\', \'\', \'1\', \'url\', \'0\', \'1\', \'menu\', \'2\', \'1\', \'2\', \'\', \'0\', \'index.php?id_cms_category=1&controller=cms\', \'_self\', \'0\', \'\', \'\', \'\', \'\', \'0\', \'0\', \'0\', \'\', \'1\', \'2014-06-11 00:47:31\', \'2015-07-28 03:02:04\')'; 
 $query_sql['ptsmegamenu'][] = 'INSERT INTO '._DB_PREFIX_.'ptsmegamenu( `id_ptsmegamenu`,`image`,`id_parent`,`is_group`,`width`,`submenu_width`,`colum_width`,`submenu_colum_width`,`item`,`colums`,`type`,`is_content`,`show_title`,`type_submenu`,`level_depth`,`active`,`position`,`submenu_content`,`show_sub`,`url`,`target`,`privacy`,`position_type`,`menu_class`,`content`,`icon_class`,`level`,`left`,`right`,`submenu_catids`,`is_cattree`,`date_add`,`date_upd` ) 
							VALUES(\'30\', \'\', \'27\', \'0\', \'\', \'\', \'\', \'\', \'\', \'1\', \'url\', \'0\', \'1\', \'menu\', \'2\', \'1\', \'0\', \'\', \'0\', \'index.php\', \'_self\', \'0\', \'\', \'\', \'\', \'\', \'0\', \'0\', \'0\', \'\', \'1\', \'2014-06-11 00:47:56\', \'2015-04-03 06:06:28\')'; 
 $query_sql['ptsmegamenu'][] = 'INSERT INTO '._DB_PREFIX_.'ptsmegamenu( `id_ptsmegamenu`,`image`,`id_parent`,`is_group`,`width`,`submenu_width`,`colum_width`,`submenu_colum_width`,`item`,`colums`,`type`,`is_content`,`show_title`,`type_submenu`,`level_depth`,`active`,`position`,`submenu_content`,`show_sub`,`url`,`target`,`privacy`,`position_type`,`menu_class`,`content`,`icon_class`,`level`,`left`,`right`,`submenu_catids`,`is_cattree`,`date_add`,`date_upd` ) 
							VALUES(\'31\', \'\', \'27\', \'0\', \'\', \'\', \'\', \'\', \'\', \'1\', \'url\', \'0\', \'1\', \'menu\', \'2\', \'1\', \'3\', \'\', \'0\', \'index.php?controller=authentication&back=my-account\', \'_self\', \'0\', \'\', \'\', \'\', \'\', \'0\', \'0\', \'0\', \'\', \'1\', \'2014-06-11 00:48:20\', \'2015-04-03 06:04:30\')'; 
 $query_sql['ptsmegamenu'][] = 'INSERT INTO '._DB_PREFIX_.'ptsmegamenu( `id_ptsmegamenu`,`image`,`id_parent`,`is_group`,`width`,`submenu_width`,`colum_width`,`submenu_colum_width`,`item`,`colums`,`type`,`is_content`,`show_title`,`type_submenu`,`level_depth`,`active`,`position`,`submenu_content`,`show_sub`,`url`,`target`,`privacy`,`position_type`,`menu_class`,`content`,`icon_class`,`level`,`left`,`right`,`submenu_catids`,`is_cattree`,`date_add`,`date_upd` ) 
							VALUES(\'35\', \'\', \'1\', \'0\', \'\', \'\', \'\', \'\', \'\', \'1\', \'url\', \'0\', \'1\', \'menu\', \'1\', \'1\', \'5\', \'\', \'0\', \'contact\', \'_self\', \'0\', \'\', \'\', \'\', \'\', \'0\', \'0\', \'0\', \'\', \'1\', \'2014-06-11 00:52:41\', \'2015-07-29 22:49:27\')'; 
 $query_sql['ptsmegamenu'][] = 'INSERT INTO '._DB_PREFIX_.'ptsmegamenu( `id_ptsmegamenu`,`image`,`id_parent`,`is_group`,`width`,`submenu_width`,`colum_width`,`submenu_colum_width`,`item`,`colums`,`type`,`is_content`,`show_title`,`type_submenu`,`level_depth`,`active`,`position`,`submenu_content`,`show_sub`,`url`,`target`,`privacy`,`position_type`,`menu_class`,`content`,`icon_class`,`level`,`left`,`right`,`submenu_catids`,`is_cattree`,`date_add`,`date_upd` ) 
							VALUES(\'36\', \'\', \'28\', \'0\', \'\', \'\', \'\', \'\', \'\', \'1\', \'url\', \'0\', \'1\', \'menu\', \'3\', \'1\', \'0\', \'\', \'0\', \'new-products\', \'_self\', \'0\', \'\', \'\', \'\', \'\', \'0\', \'0\', \'0\', \'\', \'1\', \'2015-04-03 06:08:40\', \'2015-04-05 22:33:37\')'; 
 $query_sql['ptsmegamenu'][] = 'INSERT INTO '._DB_PREFIX_.'ptsmegamenu( `id_ptsmegamenu`,`image`,`id_parent`,`is_group`,`width`,`submenu_width`,`colum_width`,`submenu_colum_width`,`item`,`colums`,`type`,`is_content`,`show_title`,`type_submenu`,`level_depth`,`active`,`position`,`submenu_content`,`show_sub`,`url`,`target`,`privacy`,`position_type`,`menu_class`,`content`,`icon_class`,`level`,`left`,`right`,`submenu_catids`,`is_cattree`,`date_add`,`date_upd` ) 
							VALUES(\'37\', \'\', \'28\', \'0\', \'\', \'\', \'\', \'\', \'\', \'1\', \'url\', \'0\', \'1\', \'menu\', \'3\', \'1\', \'1\', \'\', \'0\', \'best-sales\', \'_self\', \'0\', \'\', \'\', \'\', \'\', \'0\', \'0\', \'0\', \'\', \'1\', \'2015-04-03 06:09:19\', \'2015-04-05 22:34:16\')'; 
 $query_sql['ptsmegamenu'][] = 'INSERT INTO '._DB_PREFIX_.'ptsmegamenu( `id_ptsmegamenu`,`image`,`id_parent`,`is_group`,`width`,`submenu_width`,`colum_width`,`submenu_colum_width`,`item`,`colums`,`type`,`is_content`,`show_title`,`type_submenu`,`level_depth`,`active`,`position`,`submenu_content`,`show_sub`,`url`,`target`,`privacy`,`position_type`,`menu_class`,`content`,`icon_class`,`level`,`left`,`right`,`submenu_catids`,`is_cattree`,`date_add`,`date_upd` ) 
							VALUES(\'38\', \'\', \'28\', \'0\', \'\', \'\', \'\', \'\', \'\', \'1\', \'url\', \'0\', \'1\', \'menu\', \'3\', \'1\', \'2\', \'\', \'0\', \'prices-drop\', \'_self\', \'0\', \'\', \'\', \'\', \'\', \'0\', \'0\', \'0\', \'\', \'1\', \'2015-04-03 06:10:09\', \'2015-04-05 22:34:31\')'; 
 $query_sql['ptsmegamenu'][] = 'INSERT INTO '._DB_PREFIX_.'ptsmegamenu( `id_ptsmegamenu`,`image`,`id_parent`,`is_group`,`width`,`submenu_width`,`colum_width`,`submenu_colum_width`,`item`,`colums`,`type`,`is_content`,`show_title`,`type_submenu`,`level_depth`,`active`,`position`,`submenu_content`,`show_sub`,`url`,`target`,`privacy`,`position_type`,`menu_class`,`content`,`icon_class`,`level`,`left`,`right`,`submenu_catids`,`is_cattree`,`date_add`,`date_upd` ) 
							VALUES(\'39\', \'\', \'28\', \'0\', \'\', \'\', \'\', \'\', \'\', \'1\', \'url\', \'0\', \'1\', \'menu\', \'3\', \'1\', \'3\', \'\', \'0\', \'manufacturer\', \'_self\', \'0\', \'\', \'\', \'\', \'\', \'0\', \'0\', \'0\', \'\', \'1\', \'2015-04-03 06:10:39\', \'2015-04-05 22:34:42\')'; 
 $query_sql['ptsmegamenu'][] = 'INSERT INTO '._DB_PREFIX_.'ptsmegamenu( `id_ptsmegamenu`,`image`,`id_parent`,`is_group`,`width`,`submenu_width`,`colum_width`,`submenu_colum_width`,`item`,`colums`,`type`,`is_content`,`show_title`,`type_submenu`,`level_depth`,`active`,`position`,`submenu_content`,`show_sub`,`url`,`target`,`privacy`,`position_type`,`menu_class`,`content`,`icon_class`,`level`,`left`,`right`,`submenu_catids`,`is_cattree`,`date_add`,`date_upd` ) 
							VALUES(\'40\', \'\', \'28\', \'0\', \'\', \'\', \'\', \'\', \'\', \'1\', \'url\', \'0\', \'1\', \'menu\', \'3\', \'1\', \'4\', \'\', \'0\', \'supplier\', \'_self\', \'0\', \'\', \'\', \'\', \'\', \'0\', \'0\', \'0\', \'\', \'1\', \'2015-04-03 06:11:14\', \'2015-04-05 22:34:54\')'; 
 $query_sql['ptsmegamenu'][] = 'INSERT INTO '._DB_PREFIX_.'ptsmegamenu( `id_ptsmegamenu`,`image`,`id_parent`,`is_group`,`width`,`submenu_width`,`colum_width`,`submenu_colum_width`,`item`,`colums`,`type`,`is_content`,`show_title`,`type_submenu`,`level_depth`,`active`,`position`,`submenu_content`,`show_sub`,`url`,`target`,`privacy`,`position_type`,`menu_class`,`content`,`icon_class`,`level`,`left`,`right`,`submenu_catids`,`is_cattree`,`date_add`,`date_upd` ) 
							VALUES(\'41\', \'\', \'29\', \'0\', \'\', \'\', \'\', \'\', \'1\', \'1\', \'cms\', \'0\', \'1\', \'menu\', \'3\', \'1\', \'0\', \'\', \'0\', \'index.php?id_cms=1&controller=cms\', \'_self\', \'0\', \'\', \'\', \'\', \'\', \'0\', \'0\', \'0\', \'\', \'1\', \'2015-04-03 06:12:08\', \'2015-04-05 22:35:29\')'; 
 $query_sql['ptsmegamenu'][] = 'INSERT INTO '._DB_PREFIX_.'ptsmegamenu( `id_ptsmegamenu`,`image`,`id_parent`,`is_group`,`width`,`submenu_width`,`colum_width`,`submenu_colum_width`,`item`,`colums`,`type`,`is_content`,`show_title`,`type_submenu`,`level_depth`,`active`,`position`,`submenu_content`,`show_sub`,`url`,`target`,`privacy`,`position_type`,`menu_class`,`content`,`icon_class`,`level`,`left`,`right`,`submenu_catids`,`is_cattree`,`date_add`,`date_upd` ) 
							VALUES(\'42\', \'\', \'29\', \'0\', \'\', \'\', \'\', \'\', \'2\', \'1\', \'cms\', \'0\', \'1\', \'menu\', \'3\', \'1\', \'1\', \'\', \'0\', \'index.php?id_cms=2&controller=cms\', \'_self\', \'0\', \'\', \'\', \'\', \'\', \'0\', \'0\', \'0\', \'\', \'1\', \'2015-04-03 06:12:51\', \'2015-04-05 22:35:17\')'; 
 $query_sql['ptsmegamenu'][] = 'INSERT INTO '._DB_PREFIX_.'ptsmegamenu( `id_ptsmegamenu`,`image`,`id_parent`,`is_group`,`width`,`submenu_width`,`colum_width`,`submenu_colum_width`,`item`,`colums`,`type`,`is_content`,`show_title`,`type_submenu`,`level_depth`,`active`,`position`,`submenu_content`,`show_sub`,`url`,`target`,`privacy`,`position_type`,`menu_class`,`content`,`icon_class`,`level`,`left`,`right`,`submenu_catids`,`is_cattree`,`date_add`,`date_upd` ) 
							VALUES(\'43\', \'\', \'29\', \'0\', \'\', \'\', \'\', \'\', \'3\', \'1\', \'cms\', \'0\', \'1\', \'menu\', \'3\', \'1\', \'2\', \'\', \'0\', \'index.php?id_cms=3&controller=cms\', \'_self\', \'0\', \'\', \'\', \'\', \'\', \'0\', \'0\', \'0\', \'\', \'1\', \'2015-04-03 06:13:19\', \'2015-04-05 22:35:41\')'; 
 $query_sql['ptsmegamenu'][] = 'INSERT INTO '._DB_PREFIX_.'ptsmegamenu( `id_ptsmegamenu`,`image`,`id_parent`,`is_group`,`width`,`submenu_width`,`colum_width`,`submenu_colum_width`,`item`,`colums`,`type`,`is_content`,`show_title`,`type_submenu`,`level_depth`,`active`,`position`,`submenu_content`,`show_sub`,`url`,`target`,`privacy`,`position_type`,`menu_class`,`content`,`icon_class`,`level`,`left`,`right`,`submenu_catids`,`is_cattree`,`date_add`,`date_upd` ) 
							VALUES(\'44\', \'\', \'29\', \'0\', \'\', \'\', \'\', \'\', \'4\', \'1\', \'cms\', \'0\', \'1\', \'menu\', \'3\', \'1\', \'4\', \'\', \'0\', \'index.php?id_cms=4&controller=cms\', \'_self\', \'0\', \'\', \'\', \'\', \'\', \'0\', \'0\', \'0\', \'\', \'1\', \'2015-04-03 06:13:52\', \'2015-04-05 22:36:14\')'; 
 $query_sql['ptsmegamenu'][] = 'INSERT INTO '._DB_PREFIX_.'ptsmegamenu( `id_ptsmegamenu`,`image`,`id_parent`,`is_group`,`width`,`submenu_width`,`colum_width`,`submenu_colum_width`,`item`,`colums`,`type`,`is_content`,`show_title`,`type_submenu`,`level_depth`,`active`,`position`,`submenu_content`,`show_sub`,`url`,`target`,`privacy`,`position_type`,`menu_class`,`content`,`icon_class`,`level`,`left`,`right`,`submenu_catids`,`is_cattree`,`date_add`,`date_upd` ) 
							VALUES(\'45\', \'\', \'29\', \'0\', \'\', \'\', \'\', \'\', \'5\', \'1\', \'cms\', \'0\', \'1\', \'menu\', \'3\', \'1\', \'3\', \'\', \'0\', \'index.php?id_cms=5&controller=cms\', \'_self\', \'0\', \'\', \'\', \'\', \'\', \'0\', \'0\', \'0\', \'\', \'1\', \'2015-04-03 06:14:25\', \'2015-04-05 22:35:57\')'; 
 $query_sql['ptsmegamenu'][] = 'INSERT INTO '._DB_PREFIX_.'ptsmegamenu( `id_ptsmegamenu`,`image`,`id_parent`,`is_group`,`width`,`submenu_width`,`colum_width`,`submenu_colum_width`,`item`,`colums`,`type`,`is_content`,`show_title`,`type_submenu`,`level_depth`,`active`,`position`,`submenu_content`,`show_sub`,`url`,`target`,`privacy`,`position_type`,`menu_class`,`content`,`icon_class`,`level`,`left`,`right`,`submenu_catids`,`is_cattree`,`date_add`,`date_upd` ) 
							VALUES(\'46\', \'\', \'29\', \'0\', \'\', \'\', \'\', \'\', \'\', \'1\', \'url\', \'0\', \'1\', \'menu\', \'3\', \'1\', \'5\', \'\', \'0\', \'contact\', \'_self\', \'0\', \'\', \'\', \'\', \'\', \'0\', \'0\', \'0\', \'\', \'1\', \'2015-04-03 06:15:04\', \'2015-04-05 22:36:33\')'; 
 $query_sql['ptsmegamenu'][] = 'INSERT INTO '._DB_PREFIX_.'ptsmegamenu( `id_ptsmegamenu`,`image`,`id_parent`,`is_group`,`width`,`submenu_width`,`colum_width`,`submenu_colum_width`,`item`,`colums`,`type`,`is_content`,`show_title`,`type_submenu`,`level_depth`,`active`,`position`,`submenu_content`,`show_sub`,`url`,`target`,`privacy`,`position_type`,`menu_class`,`content`,`icon_class`,`level`,`left`,`right`,`submenu_catids`,`is_cattree`,`date_add`,`date_upd` ) 
							VALUES(\'47\', \'\', \'1\', \'0\', \'\', \'\', \'\', \'\', \'4\', \'1\', \'cms\', \'0\', \'1\', \'menu\', \'1\', \'1\', \'6\', \'\', \'0\', \'\', \'_self\', \'0\', \'\', \'\', \'\', \'\', \'0\', \'0\', \'0\', \'\', \'1\', \'2015-07-29 22:52:14\', \'2015-07-29 22:52:25\')'; 
/*DATA FOR TABLE ptsmegamenu_lang*/
 $query_sql['ptsmegamenu_lang'][] = 'INSERT INTO '._DB_PREFIX_.'ptsmegamenu_lang( `id_ptsmegamenu`,`id_lang`,`title`,`text`,`description`,`content_text`,`submenu_content_text` ) 
							VALUES(\'22\', \'_LANGUAGEID_\', \'Home\', \'\', \'\', \'\', \'\')'; 
 $query_sql['ptsmegamenu_lang'][] = 'INSERT INTO '._DB_PREFIX_.'ptsmegamenu_lang( `id_ptsmegamenu`,`id_lang`,`title`,`text`,`description`,`content_text`,`submenu_content_text` ) 
							VALUES(\'23\', \'_LANGUAGEID_\', \'Categories\', \'\', \'\', \'\', \'\')'; 
 $query_sql['ptsmegamenu_lang'][] = 'INSERT INTO '._DB_PREFIX_.'ptsmegamenu_lang( `id_ptsmegamenu`,`id_lang`,`title`,`text`,`description`,`content_text`,`submenu_content_text` ) 
							VALUES(\'24\', \'_LANGUAGEID_\', \'special\', \'hot\', \'\', \'\', \'\')'; 
 $query_sql['ptsmegamenu_lang'][] = 'INSERT INTO '._DB_PREFIX_.'ptsmegamenu_lang( `id_ptsmegamenu`,`id_lang`,`title`,`text`,`description`,`content_text`,`submenu_content_text` ) 
							VALUES(\'26\', \'_LANGUAGEID_\', \'Blog\', \'new\', \'\', \'\', \'\')'; 
 $query_sql['ptsmegamenu_lang'][] = 'INSERT INTO '._DB_PREFIX_.'ptsmegamenu_lang( `id_ptsmegamenu`,`id_lang`,`title`,`text`,`description`,`content_text`,`submenu_content_text` ) 
							VALUES(\'27\', \'_LANGUAGEID_\', \'Pages\', \'\', \'\', \'\', \'\')'; 
 $query_sql['ptsmegamenu_lang'][] = 'INSERT INTO '._DB_PREFIX_.'ptsmegamenu_lang( `id_ptsmegamenu`,`id_lang`,`title`,`text`,`description`,`content_text`,`submenu_content_text` ) 
							VALUES(\'28\', \'_LANGUAGEID_\', \'Our offers\', \'\', \'\', \'\', \'\')'; 
 $query_sql['ptsmegamenu_lang'][] = 'INSERT INTO '._DB_PREFIX_.'ptsmegamenu_lang( `id_ptsmegamenu`,`id_lang`,`title`,`text`,`description`,`content_text`,`submenu_content_text` ) 
							VALUES(\'29\', \'_LANGUAGEID_\', \'cms pages\', \'\', \'\', \'\', \'\')'; 
 $query_sql['ptsmegamenu_lang'][] = 'INSERT INTO '._DB_PREFIX_.'ptsmegamenu_lang( `id_ptsmegamenu`,`id_lang`,`title`,`text`,`description`,`content_text`,`submenu_content_text` ) 
							VALUES(\'30\', \'_LANGUAGEID_\', \'Home pages\', \'\', \'\', \'\', \'\')'; 
 $query_sql['ptsmegamenu_lang'][] = 'INSERT INTO '._DB_PREFIX_.'ptsmegamenu_lang( `id_ptsmegamenu`,`id_lang`,`title`,`text`,`description`,`content_text`,`submenu_content_text` ) 
							VALUES(\'31\', \'_LANGUAGEID_\', \'Your Account \', \'\', \'\', \'\', \'\')'; 
 $query_sql['ptsmegamenu_lang'][] = 'INSERT INTO '._DB_PREFIX_.'ptsmegamenu_lang( `id_ptsmegamenu`,`id_lang`,`title`,`text`,`description`,`content_text`,`submenu_content_text` ) 
							VALUES(\'35\', \'_LANGUAGEID_\', \'Contact\', \'\', \'\', \'\', \'\')'; 
 $query_sql['ptsmegamenu_lang'][] = 'INSERT INTO '._DB_PREFIX_.'ptsmegamenu_lang( `id_ptsmegamenu`,`id_lang`,`title`,`text`,`description`,`content_text`,`submenu_content_text` ) 
							VALUES(\'36\', \'_LANGUAGEID_\', \'New products \', \'\', \'\', \'\', \'\')'; 
 $query_sql['ptsmegamenu_lang'][] = 'INSERT INTO '._DB_PREFIX_.'ptsmegamenu_lang( `id_ptsmegamenu`,`id_lang`,`title`,`text`,`description`,`content_text`,`submenu_content_text` ) 
							VALUES(\'37\', \'_LANGUAGEID_\', \'Best sellers\', \'\', \'\', \'\', \'\')'; 
 $query_sql['ptsmegamenu_lang'][] = 'INSERT INTO '._DB_PREFIX_.'ptsmegamenu_lang( `id_ptsmegamenu`,`id_lang`,`title`,`text`,`description`,`content_text`,`submenu_content_text` ) 
							VALUES(\'38\', \'_LANGUAGEID_\', \'Price drop\', \'\', \'\', \'\', \'\')'; 
 $query_sql['ptsmegamenu_lang'][] = 'INSERT INTO '._DB_PREFIX_.'ptsmegamenu_lang( `id_ptsmegamenu`,`id_lang`,`title`,`text`,`description`,`content_text`,`submenu_content_text` ) 
							VALUES(\'39\', \'_LANGUAGEID_\', \'Manufacturers \', \'\', \'\', \'\', \'\')'; 
 $query_sql['ptsmegamenu_lang'][] = 'INSERT INTO '._DB_PREFIX_.'ptsmegamenu_lang( `id_ptsmegamenu`,`id_lang`,`title`,`text`,`description`,`content_text`,`submenu_content_text` ) 
							VALUES(\'40\', \'_LANGUAGEID_\', \' Suppliers\', \'\', \'\', \'\', \'\')'; 
 $query_sql['ptsmegamenu_lang'][] = 'INSERT INTO '._DB_PREFIX_.'ptsmegamenu_lang( `id_ptsmegamenu`,`id_lang`,`title`,`text`,`description`,`content_text`,`submenu_content_text` ) 
							VALUES(\'41\', \'_LANGUAGEID_\', \'Delivery \', \'\', \'\', \'\', \'\')'; 
 $query_sql['ptsmegamenu_lang'][] = 'INSERT INTO '._DB_PREFIX_.'ptsmegamenu_lang( `id_ptsmegamenu`,`id_lang`,`title`,`text`,`description`,`content_text`,`submenu_content_text` ) 
							VALUES(\'42\', \'_LANGUAGEID_\', \' Legal Notice \', \'\', \'\', \'\', \'\')'; 
 $query_sql['ptsmegamenu_lang'][] = 'INSERT INTO '._DB_PREFIX_.'ptsmegamenu_lang( `id_ptsmegamenu`,`id_lang`,`title`,`text`,`description`,`content_text`,`submenu_content_text` ) 
							VALUES(\'43\', \'_LANGUAGEID_\', \'Terms and conditions of use \', \'\', \'\', \'\', \'\')'; 
 $query_sql['ptsmegamenu_lang'][] = 'INSERT INTO '._DB_PREFIX_.'ptsmegamenu_lang( `id_ptsmegamenu`,`id_lang`,`title`,`text`,`description`,`content_text`,`submenu_content_text` ) 
							VALUES(\'44\', \'_LANGUAGEID_\', \' About us \', \'\', \'\', \'\', \'\')'; 
 $query_sql['ptsmegamenu_lang'][] = 'INSERT INTO '._DB_PREFIX_.'ptsmegamenu_lang( `id_ptsmegamenu`,`id_lang`,`title`,`text`,`description`,`content_text`,`submenu_content_text` ) 
							VALUES(\'45\', \'_LANGUAGEID_\', \'Secure payment \', \'\', \'\', \'\', \'\')'; 
 $query_sql['ptsmegamenu_lang'][] = 'INSERT INTO '._DB_PREFIX_.'ptsmegamenu_lang( `id_ptsmegamenu`,`id_lang`,`title`,`text`,`description`,`content_text`,`submenu_content_text` ) 
							VALUES(\'46\', \'_LANGUAGEID_\', \'Contact \', \'\', \'\', \'\', \'\')'; 
 $query_sql['ptsmegamenu_lang'][] = 'INSERT INTO '._DB_PREFIX_.'ptsmegamenu_lang( `id_ptsmegamenu`,`id_lang`,`title`,`text`,`description`,`content_text`,`submenu_content_text` ) 
							VALUES(\'47\', \'_LANGUAGEID_\', \'about\', \'\', \'\', \'\', \'\')'; 
/*DATA FOR TABLE ptsmegamenu_shop*/
 $query_sql['ptsmegamenu_shop'][] = 'INSERT INTO '._DB_PREFIX_.'ptsmegamenu_shop( `id_ptsmegamenu`,`id_shop` ) 
							VALUES(\'22\', \'_SHOPID_\')'; 
 $query_sql['ptsmegamenu_shop'][] = 'INSERT INTO '._DB_PREFIX_.'ptsmegamenu_shop( `id_ptsmegamenu`,`id_shop` ) 
							VALUES(\'23\', \'_SHOPID_\')'; 
 $query_sql['ptsmegamenu_shop'][] = 'INSERT INTO '._DB_PREFIX_.'ptsmegamenu_shop( `id_ptsmegamenu`,`id_shop` ) 
							VALUES(\'24\', \'_SHOPID_\')'; 
 $query_sql['ptsmegamenu_shop'][] = 'INSERT INTO '._DB_PREFIX_.'ptsmegamenu_shop( `id_ptsmegamenu`,`id_shop` ) 
							VALUES(\'26\', \'_SHOPID_\')'; 
 $query_sql['ptsmegamenu_shop'][] = 'INSERT INTO '._DB_PREFIX_.'ptsmegamenu_shop( `id_ptsmegamenu`,`id_shop` ) 
							VALUES(\'27\', \'_SHOPID_\')'; 
 $query_sql['ptsmegamenu_shop'][] = 'INSERT INTO '._DB_PREFIX_.'ptsmegamenu_shop( `id_ptsmegamenu`,`id_shop` ) 
							VALUES(\'28\', \'_SHOPID_\')'; 
 $query_sql['ptsmegamenu_shop'][] = 'INSERT INTO '._DB_PREFIX_.'ptsmegamenu_shop( `id_ptsmegamenu`,`id_shop` ) 
							VALUES(\'29\', \'_SHOPID_\')'; 
 $query_sql['ptsmegamenu_shop'][] = 'INSERT INTO '._DB_PREFIX_.'ptsmegamenu_shop( `id_ptsmegamenu`,`id_shop` ) 
							VALUES(\'30\', \'_SHOPID_\')'; 
 $query_sql['ptsmegamenu_shop'][] = 'INSERT INTO '._DB_PREFIX_.'ptsmegamenu_shop( `id_ptsmegamenu`,`id_shop` ) 
							VALUES(\'31\', \'_SHOPID_\')'; 
 $query_sql['ptsmegamenu_shop'][] = 'INSERT INTO '._DB_PREFIX_.'ptsmegamenu_shop( `id_ptsmegamenu`,`id_shop` ) 
							VALUES(\'35\', \'_SHOPID_\')'; 
 $query_sql['ptsmegamenu_shop'][] = 'INSERT INTO '._DB_PREFIX_.'ptsmegamenu_shop( `id_ptsmegamenu`,`id_shop` ) 
							VALUES(\'36\', \'_SHOPID_\')'; 
 $query_sql['ptsmegamenu_shop'][] = 'INSERT INTO '._DB_PREFIX_.'ptsmegamenu_shop( `id_ptsmegamenu`,`id_shop` ) 
							VALUES(\'37\', \'_SHOPID_\')'; 
 $query_sql['ptsmegamenu_shop'][] = 'INSERT INTO '._DB_PREFIX_.'ptsmegamenu_shop( `id_ptsmegamenu`,`id_shop` ) 
							VALUES(\'38\', \'_SHOPID_\')'; 
 $query_sql['ptsmegamenu_shop'][] = 'INSERT INTO '._DB_PREFIX_.'ptsmegamenu_shop( `id_ptsmegamenu`,`id_shop` ) 
							VALUES(\'39\', \'_SHOPID_\')'; 
 $query_sql['ptsmegamenu_shop'][] = 'INSERT INTO '._DB_PREFIX_.'ptsmegamenu_shop( `id_ptsmegamenu`,`id_shop` ) 
							VALUES(\'40\', \'_SHOPID_\')'; 
 $query_sql['ptsmegamenu_shop'][] = 'INSERT INTO '._DB_PREFIX_.'ptsmegamenu_shop( `id_ptsmegamenu`,`id_shop` ) 
							VALUES(\'41\', \'_SHOPID_\')'; 
 $query_sql['ptsmegamenu_shop'][] = 'INSERT INTO '._DB_PREFIX_.'ptsmegamenu_shop( `id_ptsmegamenu`,`id_shop` ) 
							VALUES(\'42\', \'_SHOPID_\')'; 
 $query_sql['ptsmegamenu_shop'][] = 'INSERT INTO '._DB_PREFIX_.'ptsmegamenu_shop( `id_ptsmegamenu`,`id_shop` ) 
							VALUES(\'43\', \'_SHOPID_\')'; 
 $query_sql['ptsmegamenu_shop'][] = 'INSERT INTO '._DB_PREFIX_.'ptsmegamenu_shop( `id_ptsmegamenu`,`id_shop` ) 
							VALUES(\'44\', \'_SHOPID_\')'; 
 $query_sql['ptsmegamenu_shop'][] = 'INSERT INTO '._DB_PREFIX_.'ptsmegamenu_shop( `id_ptsmegamenu`,`id_shop` ) 
							VALUES(\'45\', \'_SHOPID_\')'; 
 $query_sql['ptsmegamenu_shop'][] = 'INSERT INTO '._DB_PREFIX_.'ptsmegamenu_shop( `id_ptsmegamenu`,`id_shop` ) 
							VALUES(\'46\', \'_SHOPID_\')'; 
 $query_sql['ptsmegamenu_shop'][] = 'INSERT INTO '._DB_PREFIX_.'ptsmegamenu_shop( `id_ptsmegamenu`,`id_shop` ) 
							VALUES(\'47\', \'_SHOPID_\')'; 
/*DATA FOR TABLE ptsmegamenu_widgets*/
 $query_sql['ptsmegamenu_widgets'][] = 'INSERT INTO '._DB_PREFIX_.'ptsmegamenu_widgets( `id_widget`,`name`,`type`,`params`,`id_shop`,`key_widget` ) 
							VALUES(\'29\', \'Fashion & Clothing\', \'sub_categories\', \'YToxNTp7czoxNToic2F2ZXB0c21lZ2FtZW51IjtzOjE6IjEiO3M6OToiaWRfd2lkZ2V0IjtzOjI6IjI5IjtzOjExOiJ3aWRnZXRfbmFtZSI7czoxODoiRmFzaGlvbiAmIENsb3RoaW5nIjtzOjE0OiJ3aWRnZXRfdGl0bGVfMSI7czoxODoiRmFzaGlvbiAmIENsb3RoaW5nIjtzOjE0OiJhZGRpdGlvbmNsc3NfMSI7czowOiIiO3M6MTE6IndpZGdldF90eXBlIjtzOjE0OiJzdWJfY2F0ZWdvcmllcyI7czoxMToiY2F0ZWdvcnlfaWQiO3M6MjoiMTMiO3M6NToibGltaXQiO3M6MToiNiI7czozOiJ0YWIiO3M6MTI6IkFkbWluTW9kdWxlcyI7czoxNDoid2lkZ2V0X3RpdGxlXzIiO3M6MTg6IkZhc2hpb24gJiBDbG90aGluZyI7czoxNDoiYWRkaXRpb25jbHNzXzIiO3M6MDoiIjtzOjE0OiJ3aWRnZXRfdGl0bGVfMyI7czoxODoiRmFzaGlvbiAmIENsb3RoaW5nIjtzOjE0OiJhZGRpdGlvbmNsc3NfMyI7czowOiIiO3M6MTQ6IndpZGdldF90aXRsZV80IjtzOjE4OiJGYXNoaW9uICYgQ2xvdGhpbmciO3M6MTQ6ImFkZGl0aW9uY2xzc180IjtzOjA6IiI7fQ==\', \'_SHOPID_\', \'1411705855\')'; 
 $query_sql['ptsmegamenu_widgets'][] = 'INSERT INTO '._DB_PREFIX_.'ptsmegamenu_widgets( `id_widget`,`name`,`type`,`params`,`id_shop`,`key_widget` ) 
							VALUES(\'30\', \'Custom html\', \'html\', \'YToxNzp7czoxNToic2F2ZXB0c21lZ2FtZW51IjtzOjE6IjEiO3M6OToiaWRfd2lkZ2V0IjtzOjI6IjMwIjtzOjExOiJ3aWRnZXRfbmFtZSI7czoxMToiQ3VzdG9tIGh0bWwiO3M6MTQ6IndpZGdldF90aXRsZV8xIjtzOjExOiJDdXN0b20gaHRtbCI7czoxNDoiYWRkaXRpb25jbHNzXzEiO3M6MDoiIjtzOjExOiJ3aWRnZXRfdHlwZSI7czo0OiJodG1sIjtzOjEzOiJodG1sY29udGVudF8xIjtzOjE1NToiPHA+UHJvaW4gZWxlbWVudHVtLCBmZWxpcyBpZCBwbGFjZXJhdCBkYXBpYnVzLCBwdXJ1cyBpcHN1bSBsb2JvcnRpcyB0ZWxsdXMsIHV0IHZlaGljdWxhIG5pc2wgbWV0dXMgZWdldCBhcmN1LiBGdXNjZSBsb2JvcnRpcyBwb3N1ZXJlIGVsaXQgZXUgZWxlbWVudHVtLjwvcD4iO3M6MzoidGFiIjtzOjEyOiJBZG1pbk1vZHVsZXMiO3M6MTQ6IndpZGdldF90aXRsZV8yIjtzOjExOiJDdXN0b20gaHRtbCI7czoxNDoiYWRkaXRpb25jbHNzXzIiO3M6MDoiIjtzOjEzOiJodG1sY29udGVudF8yIjtzOjE1NToiPHA+UHJvaW4gZWxlbWVudHVtLCBmZWxpcyBpZCBwbGFjZXJhdCBkYXBpYnVzLCBwdXJ1cyBpcHN1bSBsb2JvcnRpcyB0ZWxsdXMsIHV0IHZlaGljdWxhIG5pc2wgbWV0dXMgZWdldCBhcmN1LiBGdXNjZSBsb2JvcnRpcyBwb3N1ZXJlIGVsaXQgZXUgZWxlbWVudHVtLjwvcD4iO3M6MTQ6IndpZGdldF90aXRsZV8zIjtzOjExOiJDdXN0b20gaHRtbCI7czoxNDoiYWRkaXRpb25jbHNzXzMiO3M6MDoiIjtzOjEzOiJodG1sY29udGVudF8zIjtzOjE1NToiPHA+UHJvaW4gZWxlbWVudHVtLCBmZWxpcyBpZCBwbGFjZXJhdCBkYXBpYnVzLCBwdXJ1cyBpcHN1bSBsb2JvcnRpcyB0ZWxsdXMsIHV0IHZlaGljdWxhIG5pc2wgbWV0dXMgZWdldCBhcmN1LiBGdXNjZSBsb2JvcnRpcyBwb3N1ZXJlIGVsaXQgZXUgZWxlbWVudHVtLjwvcD4iO3M6MTQ6IndpZGdldF90aXRsZV80IjtzOjExOiJDdXN0b20gaHRtbCI7czoxNDoiYWRkaXRpb25jbHNzXzQiO3M6MDoiIjtzOjEzOiJodG1sY29udGVudF80IjtzOjE1NToiPHA+UHJvaW4gZWxlbWVudHVtLCBmZWxpcyBpZCBwbGFjZXJhdCBkYXBpYnVzLCBwdXJ1cyBpcHN1bSBsb2JvcnRpcyB0ZWxsdXMsIHV0IHZlaGljdWxhIG5pc2wgbWV0dXMgZWdldCBhcmN1LiBGdXNjZSBsb2JvcnRpcyBwb3N1ZXJlIGVsaXQgZXUgZWxlbWVudHVtLjwvcD4iO30=\', \'_SHOPID_\', \'1411706090\')'; 
 $query_sql['ptsmegamenu_widgets'][] = 'INSERT INTO '._DB_PREFIX_.'ptsmegamenu_widgets( `id_widget`,`name`,`type`,`params`,`id_shop`,`key_widget` ) 
							VALUES(\'31\', \'Manufactures\', \'manufacture\', \'YToxNDp7czoxNToic2F2ZXB0c21lZ2FtZW51IjtzOjE6IjEiO3M6OToiaWRfd2lkZ2V0IjtzOjI6IjMxIjtzOjExOiJ3aWRnZXRfbmFtZSI7czoxMjoiTWFudWZhY3R1cmVzIjtzOjE0OiJ3aWRnZXRfdGl0bGVfMSI7czoxMjoiTWFudWZhY3R1cmVzIjtzOjE0OiJhZGRpdGlvbmNsc3NfMSI7czowOiIiO3M6MTE6IndpZGdldF90eXBlIjtzOjExOiJtYW51ZmFjdHVyZSI7czo1OiJsaW1pdCI7czoxOiIyIjtzOjM6InRhYiI7czoxMjoiQWRtaW5Nb2R1bGVzIjtzOjE0OiJ3aWRnZXRfdGl0bGVfMiI7czoxMjoiTWFudWZhY3R1cmVzIjtzOjE0OiJhZGRpdGlvbmNsc3NfMiI7czowOiIiO3M6MTQ6IndpZGdldF90aXRsZV8zIjtzOjEyOiJNYW51ZmFjdHVyZXMiO3M6MTQ6ImFkZGl0aW9uY2xzc18zIjtzOjA6IiI7czoxNDoid2lkZ2V0X3RpdGxlXzQiO3M6MTI6Ik1hbnVmYWN0dXJlcyI7czoxNDoiYWRkaXRpb25jbHNzXzQiO3M6MDoiIjt9\', \'_SHOPID_\', \'1411706243\')'; 
 $query_sql['ptsmegamenu_widgets'][] = 'INSERT INTO '._DB_PREFIX_.'ptsmegamenu_widgets( `id_widget`,`name`,`type`,`params`,`id_shop`,`key_widget` ) 
							VALUES(\'32\', \'Video widget\', \'video_code\', \'YToyNjp7czoxNToic2F2ZXB0c21lZ2FtZW51IjtzOjE6IjEiO3M6OToiaWRfd2lkZ2V0IjtzOjA6IiI7czoxMToid2lkZ2V0X25hbWUiO3M6MTI6IlZpZGVvIHdpZGdldCI7czoxNDoid2lkZ2V0X3RpdGxlXzEiO3M6MTI6IlZpZGVvIHdpZGdldCI7czoxNDoiYWRkaXRpb25jbHNzXzEiO3M6MDoiIjtzOjExOiJ3aWRnZXRfdHlwZSI7czoxMDoidmlkZW9fY29kZSI7czoxMDoidmlkZW9fbGluayI7czo0MjoiaHR0cDovL3d3dy55b3V0dWJlLmNvbS93YXRjaD92PWx6WTRsa1Q4RWxVIjtzOjU6IndpZHRoIjtzOjQ6IjEwMCUiO3M6NjoiaGVpZ2h0IjtzOjM6IjI1MCI7czozOiJ0YWIiO3M6MTI6IkFkbWluTW9kdWxlcyI7czoxNDoid2lkZ2V0X3RpdGxlXzIiO3M6MTI6IlZpZGVvIHdpZGdldCI7czoxNDoiYWRkaXRpb25jbHNzXzIiO3M6MDoiIjtzOjE0OiJ3aWRnZXRfdGl0bGVfMyI7czoxMjoiVmlkZW8gd2lkZ2V0IjtzOjE0OiJhZGRpdGlvbmNsc3NfMyI7czowOiIiO3M6MTQ6IndpZGdldF90aXRsZV80IjtzOjEyOiJWaWRlbyB3aWRnZXQiO3M6MTQ6ImFkZGl0aW9uY2xzc180IjtzOjA6IiI7czoxNDoid2lkZ2V0X3RpdGxlXzUiO3M6MTI6IlZpZGVvIHdpZGdldCI7czoxNDoiYWRkaXRpb25jbHNzXzUiO3M6MDoiIjtzOjE0OiJ3aWRnZXRfdGl0bGVfNiI7czoxMjoiVmlkZW8gd2lkZ2V0IjtzOjE0OiJhZGRpdGlvbmNsc3NfNiI7czowOiIiO3M6MTQ6IndpZGdldF90aXRsZV83IjtzOjEyOiJWaWRlbyB3aWRnZXQiO3M6MTQ6ImFkZGl0aW9uY2xzc183IjtzOjA6IiI7czoxNDoid2lkZ2V0X3RpdGxlXzgiO3M6MTI6IlZpZGVvIHdpZGdldCI7czoxNDoiYWRkaXRpb25jbHNzXzgiO3M6MDoiIjtzOjE0OiJ3aWRnZXRfdGl0bGVfOSI7czoxMjoiVmlkZW8gd2lkZ2V0IjtzOjE0OiJhZGRpdGlvbmNsc3NfOSI7czowOiIiO30=\', \'_SHOPID_\', \'1411706413\')'; 
 $query_sql['ptsmegamenu_widgets'][] = 'INSERT INTO '._DB_PREFIX_.'ptsmegamenu_widgets( `id_widget`,`name`,`type`,`params`,`id_shop`,`key_widget` ) 
							VALUES(\'33\', \'New products\', \'product_list\', \'YToxNTp7czoxNToic2F2ZXB0c21lZ2FtZW51IjtzOjE6IjEiO3M6OToiaWRfd2lkZ2V0IjtzOjI6IjMzIjtzOjExOiJ3aWRnZXRfbmFtZSI7czoxMjoiTmV3IHByb2R1Y3RzIjtzOjE0OiJ3aWRnZXRfdGl0bGVfMSI7czoxMjoiTmV3IHByb2R1Y3RzIjtzOjE0OiJhZGRpdGlvbmNsc3NfMSI7czowOiIiO3M6MTE6IndpZGdldF90eXBlIjtzOjEyOiJwcm9kdWN0X2xpc3QiO3M6NToibGltaXQiO3M6MToiMiI7czo5OiJsaXN0X3R5cGUiO3M6NjoibmV3ZXN0IjtzOjM6InRhYiI7czoxMjoiQWRtaW5Nb2R1bGVzIjtzOjE0OiJ3aWRnZXRfdGl0bGVfMiI7czoxMjoiTmV3IHByb2R1Y3RzIjtzOjE0OiJhZGRpdGlvbmNsc3NfMiI7czowOiIiO3M6MTQ6IndpZGdldF90aXRsZV8zIjtzOjEyOiJOZXcgcHJvZHVjdHMiO3M6MTQ6ImFkZGl0aW9uY2xzc18zIjtzOjA6IiI7czoxNDoid2lkZ2V0X3RpdGxlXzQiO3M6MTI6Ik5ldyBwcm9kdWN0cyI7czoxNDoiYWRkaXRpb25jbHNzXzQiO3M6MDoiIjt9\', \'_SHOPID_\', \'1411706494\')'; 
 $query_sql['ptsmegamenu_widgets'][] = 'INSERT INTO '._DB_PREFIX_.'ptsmegamenu_widgets( `id_widget`,`name`,`type`,`params`,`id_shop`,`key_widget` ) 
							VALUES(\'34\', \'pts modules\', \'links\', \'YTo2Mjp7czoxNToic2F2ZXB0c21lZ2FtZW51IjtzOjE6IjEiO3M6OToiaWRfd2lkZ2V0IjtzOjI6IjM0IjtzOjExOiJ3aWRnZXRfbmFtZSI7czoxMToicHRzIG1vZHVsZXMiO3M6MTQ6IndpZGdldF90aXRsZV8xIjtzOjExOiJwdHMgbW9kdWxlcyI7czoxNDoiYWRkaXRpb25jbHNzXzEiO3M6MDoiIjtzOjExOiJ3aWRnZXRfdHlwZSI7czo1OiJsaW5rcyI7czoxMzoidGV4dF9saW5rXzFfMSI7czoxMjoiUHRzIE1lZ2FtZW51IjtzOjY6ImxpbmtfMSI7czo0MzoiaHR0cHM6Ly93d3cueW91dHViZS5jb20vd2F0Y2g/dj1pcGJ5MkJVMnpZSSI7czoxMzoidGV4dF9saW5rXzJfMSI7czoxNjoiUHRzIFBhZ2UgQnVpbGRlciI7czo2OiJsaW5rXzIiO3M6NDM6Imh0dHBzOi8vd3d3LnlvdXR1YmUuY29tL3dhdGNoP3Y9aXBieTJCVTJ6WUkiO3M6MTM6InRleHRfbGlua18zXzEiO3M6MjM6IlBUUyBUaGVtZSBDb250cm9sIFBhbmVsIjtzOjY6ImxpbmtfMyI7czo0MzoiaHR0cHM6Ly93d3cueW91dHViZS5jb20vd2F0Y2g/dj1pcGJ5MkJVMnpZSSI7czoxMzoidGV4dF9saW5rXzRfMSI7czoxNjoiUHRzIFNsaWRlciBMYXllciI7czo2OiJsaW5rXzQiO3M6NDM6Imh0dHBzOi8vd3d3LnlvdXR1YmUuY29tL3dhdGNoP3Y9aXBieTJCVTJ6WUkiO3M6MTM6InRleHRfbGlua181XzEiO3M6MDoiIjtzOjY6ImxpbmtfNSI7czowOiIiO3M6MTM6InRleHRfbGlua182XzEiO3M6MDoiIjtzOjY6ImxpbmtfNiI7czowOiIiO3M6MTM6InRleHRfbGlua183XzEiO3M6MDoiIjtzOjY6ImxpbmtfNyI7czowOiIiO3M6MTM6InRleHRfbGlua184XzEiO3M6MDoiIjtzOjY6ImxpbmtfOCI7czowOiIiO3M6MTM6InRleHRfbGlua185XzEiO3M6MDoiIjtzOjY6ImxpbmtfOSI7czowOiIiO3M6MTQ6InRleHRfbGlua18xMF8xIjtzOjA6IiI7czozOiJ0YWIiO3M6MTI6IkFkbWluTW9kdWxlcyI7czoxNDoid2lkZ2V0X3RpdGxlXzIiO3M6MTE6InB0cyBtb2R1bGVzIjtzOjE0OiJhZGRpdGlvbmNsc3NfMiI7czowOiIiO3M6MTM6InRleHRfbGlua18xXzIiO3M6MTI6IlB0cyBNZWdhbWVudSI7czoxMzoidGV4dF9saW5rXzJfMiI7czoxNjoiUHRzIFBhZ2UgQnVpbGRlciI7czoxMzoidGV4dF9saW5rXzNfMiI7czoyMzoiUFRTIFRoZW1lIENvbnRyb2wgUGFuZWwiO3M6MTM6InRleHRfbGlua180XzIiO3M6MTY6IlB0cyBTbGlkZXIgTGF5ZXIiO3M6MTM6InRleHRfbGlua181XzIiO3M6MDoiIjtzOjEzOiJ0ZXh0X2xpbmtfNl8yIjtzOjA6IiI7czoxMzoidGV4dF9saW5rXzdfMiI7czowOiIiO3M6MTM6InRleHRfbGlua184XzIiO3M6MDoiIjtzOjEzOiJ0ZXh0X2xpbmtfOV8yIjtzOjA6IiI7czoxNDoidGV4dF9saW5rXzEwXzIiO3M6MDoiIjtzOjE0OiJ3aWRnZXRfdGl0bGVfMyI7czoxMToicHRzIG1vZHVsZXMiO3M6MTQ6ImFkZGl0aW9uY2xzc18zIjtzOjA6IiI7czoxMzoidGV4dF9saW5rXzFfMyI7czoxMjoiUHRzIE1lZ2FtZW51IjtzOjEzOiJ0ZXh0X2xpbmtfMl8zIjtzOjE2OiJQdHMgUGFnZSBCdWlsZGVyIjtzOjEzOiJ0ZXh0X2xpbmtfM18zIjtzOjIzOiJQVFMgVGhlbWUgQ29udHJvbCBQYW5lbCI7czoxMzoidGV4dF9saW5rXzRfMyI7czoxNjoiUHRzIFNsaWRlciBMYXllciI7czoxMzoidGV4dF9saW5rXzVfMyI7czowOiIiO3M6MTM6InRleHRfbGlua182XzMiO3M6MDoiIjtzOjEzOiJ0ZXh0X2xpbmtfN18zIjtzOjA6IiI7czoxMzoidGV4dF9saW5rXzhfMyI7czowOiIiO3M6MTM6InRleHRfbGlua185XzMiO3M6MDoiIjtzOjE0OiJ0ZXh0X2xpbmtfMTBfMyI7czowOiIiO3M6MTQ6IndpZGdldF90aXRsZV80IjtzOjExOiJwdHMgbW9kdWxlcyI7czoxNDoiYWRkaXRpb25jbHNzXzQiO3M6MDoiIjtzOjEzOiJ0ZXh0X2xpbmtfMV80IjtzOjEyOiJQdHMgTWVnYW1lbnUiO3M6MTM6InRleHRfbGlua18yXzQiO3M6MTY6IlB0cyBQYWdlIEJ1aWxkZXIiO3M6MTM6InRleHRfbGlua18zXzQiO3M6MjM6IlBUUyBUaGVtZSBDb250cm9sIFBhbmVsIjtzOjEzOiJ0ZXh0X2xpbmtfNF80IjtzOjE2OiJQdHMgU2xpZGVyIExheWVyIjtzOjEzOiJ0ZXh0X2xpbmtfNV80IjtzOjA6IiI7czoxMzoidGV4dF9saW5rXzZfNCI7czowOiIiO3M6MTM6InRleHRfbGlua183XzQiO3M6MDoiIjtzOjEzOiJ0ZXh0X2xpbmtfOF80IjtzOjA6IiI7czoxMzoidGV4dF9saW5rXzlfNCI7czowOiIiO3M6MTQ6InRleHRfbGlua18xMF80IjtzOjA6IiI7fQ==\', \'_SHOPID_\', \'1428305765\')'; 
 $query_sql['ptsmegamenu_widgets'][] = 'INSERT INTO '._DB_PREFIX_.'ptsmegamenu_widgets( `id_widget`,`name`,`type`,`params`,`id_shop`,`key_widget` ) 
							VALUES(\'35\', \'Home Options\', \'links\', \'YTo2Mjp7czoxNToic2F2ZXB0c21lZ2FtZW51IjtzOjE6IjEiO3M6OToiaWRfd2lkZ2V0IjtzOjI6IjM1IjtzOjExOiJ3aWRnZXRfbmFtZSI7czoxMjoiSG9tZSBPcHRpb25zIjtzOjE0OiJ3aWRnZXRfdGl0bGVfMSI7czoxMjoiSG9tZSBPcHRpb25zIjtzOjE0OiJ3aWRnZXRfdGl0bGVfMiI7czoxMjoiSG9tZSBPcHRpb25zIjtzOjE0OiJ3aWRnZXRfdGl0bGVfMyI7czoxMjoiSG9tZSBPcHRpb25zIjtzOjE0OiJ3aWRnZXRfdGl0bGVfNCI7czoxMjoiSG9tZSBPcHRpb25zIjtzOjE0OiJhZGRpdGlvbmNsc3NfMSI7czowOiIiO3M6MTQ6ImFkZGl0aW9uY2xzc18yIjtzOjA6IiI7czoxNDoiYWRkaXRpb25jbHNzXzMiO3M6MDoiIjtzOjE0OiJhZGRpdGlvbmNsc3NfNCI7czowOiIiO3M6MTE6IndpZGdldF90eXBlIjtzOjU6ImxpbmtzIjtzOjEzOiJ0ZXh0X2xpbmtfMV8xIjtzOjEwOiJob21lcGFnZSAxIjtzOjEzOiJ0ZXh0X2xpbmtfMV8yIjtzOjEwOiJob21lcGFnZSAxIjtzOjEzOiJ0ZXh0X2xpbmtfMV8zIjtzOjEwOiJob21lcGFnZSAxIjtzOjEzOiJ0ZXh0X2xpbmtfMV80IjtzOjEwOiJob21lcGFnZSAxIjtzOjY6ImxpbmtfMSI7czo0NjoiaW5kZXgucGhwP3RoZW1lc2tpbj1kZWZhdWx0JnRoZW1lc2tpbmFjdGl2ZWQ9MSI7czoxMzoidGV4dF9saW5rXzJfMSI7czoxMDoiaG9tZXBhZ2UgMiI7czoxMzoidGV4dF9saW5rXzJfMiI7czoxMDoiaG9tZXBhZ2UgMiI7czoxMzoidGV4dF9saW5rXzJfMyI7czoxMDoiaG9tZXBhZ2UgMiI7czoxMzoidGV4dF9saW5rXzJfNCI7czoxMDoiaG9tZXBhZ2UgMiI7czo2OiJsaW5rXzIiO3M6NDQ6ImluZGV4LnBocD90aGVtZXNraW49aG9tZTImdGhlbWVza2luYWN0aXZlZD0xIjtzOjEzOiJ0ZXh0X2xpbmtfM18xIjtzOjEwOiJob21lcGFnZSAzIjtzOjEzOiJ0ZXh0X2xpbmtfM18yIjtzOjEwOiJob21lcGFnZSAzIjtzOjEzOiJ0ZXh0X2xpbmtfM18zIjtzOjEwOiJob21lcGFnZSAzIjtzOjEzOiJ0ZXh0X2xpbmtfM180IjtzOjEwOiJob21lcGFnZSAzIjtzOjY6ImxpbmtfMyI7czo0NDoiaW5kZXgucGhwP3RoZW1lc2tpbj1ob21lMyZ0aGVtZXNraW5hY3RpdmVkPTEiO3M6MTM6InRleHRfbGlua180XzEiO3M6MTA6ImhvbWVwYWdlIDQiO3M6MTM6InRleHRfbGlua180XzIiO3M6MTA6ImhvbWVwYWdlIDQiO3M6MTM6InRleHRfbGlua180XzMiO3M6MTA6ImhvbWVwYWdlIDQiO3M6MTM6InRleHRfbGlua180XzQiO3M6MTA6ImhvbWVwYWdlIDQiO3M6NjoibGlua180IjtzOjQ0OiJpbmRleC5waHA/dGhlbWVza2luPWhvbWU0JnRoZW1lc2tpbmFjdGl2ZWQ9MSI7czoxMzoidGV4dF9saW5rXzVfMSI7czowOiIiO3M6MTM6InRleHRfbGlua181XzIiO3M6MDoiIjtzOjEzOiJ0ZXh0X2xpbmtfNV8zIjtzOjA6IiI7czoxMzoidGV4dF9saW5rXzVfNCI7czowOiIiO3M6NjoibGlua181IjtzOjA6IiI7czoxMzoidGV4dF9saW5rXzZfMSI7czowOiIiO3M6MTM6InRleHRfbGlua182XzIiO3M6MDoiIjtzOjEzOiJ0ZXh0X2xpbmtfNl8zIjtzOjA6IiI7czoxMzoidGV4dF9saW5rXzZfNCI7czowOiIiO3M6NjoibGlua182IjtzOjA6IiI7czoxMzoidGV4dF9saW5rXzdfMSI7czowOiIiO3M6MTM6InRleHRfbGlua183XzIiO3M6MDoiIjtzOjEzOiJ0ZXh0X2xpbmtfN18zIjtzOjA6IiI7czoxMzoidGV4dF9saW5rXzdfNCI7czowOiIiO3M6NjoibGlua183IjtzOjA6IiI7czoxMzoidGV4dF9saW5rXzhfMSI7czowOiIiO3M6MTM6InRleHRfbGlua184XzIiO3M6MDoiIjtzOjEzOiJ0ZXh0X2xpbmtfOF8zIjtzOjA6IiI7czoxMzoidGV4dF9saW5rXzhfNCI7czowOiIiO3M6NjoibGlua184IjtzOjA6IiI7czoxMzoidGV4dF9saW5rXzlfMSI7czowOiIiO3M6MTM6InRleHRfbGlua185XzIiO3M6MDoiIjtzOjEzOiJ0ZXh0X2xpbmtfOV8zIjtzOjA6IiI7czoxMzoidGV4dF9saW5rXzlfNCI7czowOiIiO3M6NjoibGlua185IjtzOjA6IiI7czoxNDoidGV4dF9saW5rXzEwXzEiO3M6MDoiIjtzOjE0OiJ0ZXh0X2xpbmtfMTBfMiI7czowOiIiO3M6MTQ6InRleHRfbGlua18xMF8zIjtzOjA6IiI7czoxNDoidGV4dF9saW5rXzEwXzQiO3M6MDoiIjtzOjM6InRhYiI7czoxMjoiQWRtaW5Nb2R1bGVzIjt9\', \'_SHOPID_\', \'1432088386\')'; 
 $query_sql['ptsmegamenu_widgets'][] = 'INSERT INTO '._DB_PREFIX_.'ptsmegamenu_widgets( `id_widget`,`name`,`type`,`params`,`id_shop`,`key_widget` ) 
							VALUES(\'36\', \'Headers Options\', \'links\', \'YTo2Mjp7czoxNToic2F2ZXB0c21lZ2FtZW51IjtzOjE6IjEiO3M6OToiaWRfd2lkZ2V0IjtzOjI6IjM2IjtzOjExOiJ3aWRnZXRfbmFtZSI7czoxNToiSGVhZGVycyBPcHRpb25zIjtzOjE0OiJ3aWRnZXRfdGl0bGVfMSI7czoxNToiSGVhZGVycyBPcHRpb25zIjtzOjE0OiJ3aWRnZXRfdGl0bGVfMiI7czoxNToiSGVhZGVycyBPcHRpb25zIjtzOjE0OiJ3aWRnZXRfdGl0bGVfMyI7czoxNToiSGVhZGVycyBPcHRpb25zIjtzOjE0OiJ3aWRnZXRfdGl0bGVfNCI7czoxNToiSGVhZGVycyBPcHRpb25zIjtzOjE0OiJhZGRpdGlvbmNsc3NfMSI7czowOiIiO3M6MTQ6ImFkZGl0aW9uY2xzc18yIjtzOjA6IiI7czoxNDoiYWRkaXRpb25jbHNzXzMiO3M6MDoiIjtzOjE0OiJhZGRpdGlvbmNsc3NfNCI7czowOiIiO3M6MTE6IndpZGdldF90eXBlIjtzOjU6ImxpbmtzIjtzOjEzOiJ0ZXh0X2xpbmtfMV8xIjtzOjE0OiJIZWFkZXIgZGVmYXVsdCI7czoxMzoidGV4dF9saW5rXzFfMiI7czoxNDoiSGVhZGVyIGRlZmF1bHQiO3M6MTM6InRleHRfbGlua18xXzMiO3M6MTQ6IkhlYWRlciBkZWZhdWx0IjtzOjEzOiJ0ZXh0X2xpbmtfMV80IjtzOjE0OiJIZWFkZXIgZGVmYXVsdCI7czo2OiJsaW5rXzEiO3M6NDA6ImluZGV4LnBocD9oZWFkZXJzPWRlZmF1bHQmaGVhZGVyY3RpdmVkPTEiO3M6MTM6InRleHRfbGlua18yXzEiO3M6ODoiaGVhZGVyIDEiO3M6MTM6InRleHRfbGlua18yXzIiO3M6ODoiaGVhZGVyIDEiO3M6MTM6InRleHRfbGlua18yXzMiO3M6ODoiaGVhZGVyIDEiO3M6MTM6InRleHRfbGlua18yXzQiO3M6ODoiaGVhZGVyIDEiO3M6NjoibGlua18yIjtzOjQwOiJpbmRleC5waHA/aGVhZGVycz1oZWFkZXIxJmhlYWRlcmN0aXZlZD0xIjtzOjEzOiJ0ZXh0X2xpbmtfM18xIjtzOjg6ImhlYWRlciAyIjtzOjEzOiJ0ZXh0X2xpbmtfM18yIjtzOjg6ImhlYWRlciAyIjtzOjEzOiJ0ZXh0X2xpbmtfM18zIjtzOjg6ImhlYWRlciAyIjtzOjEzOiJ0ZXh0X2xpbmtfM180IjtzOjg6ImhlYWRlciAyIjtzOjY6ImxpbmtfMyI7czo0MDoiaW5kZXgucGhwP2hlYWRlcnM9aGVhZGVyMiZoZWFkZXJjdGl2ZWQ9MSI7czoxMzoidGV4dF9saW5rXzRfMSI7czo4OiJoZWFkZXIgMyI7czoxMzoidGV4dF9saW5rXzRfMiI7czo4OiJoZWFkZXIgMyI7czoxMzoidGV4dF9saW5rXzRfMyI7czo4OiJoZWFkZXIgMyI7czoxMzoidGV4dF9saW5rXzRfNCI7czo4OiJoZWFkZXIgMyI7czo2OiJsaW5rXzQiO3M6NDA6ImluZGV4LnBocD9oZWFkZXJzPWhlYWRlcjMmaGVhZGVyY3RpdmVkPTEiO3M6MTM6InRleHRfbGlua181XzEiO3M6MDoiIjtzOjEzOiJ0ZXh0X2xpbmtfNV8yIjtzOjA6IiI7czoxMzoidGV4dF9saW5rXzVfMyI7czowOiIiO3M6MTM6InRleHRfbGlua181XzQiO3M6MDoiIjtzOjY6ImxpbmtfNSI7czowOiIiO3M6MTM6InRleHRfbGlua182XzEiO3M6MDoiIjtzOjEzOiJ0ZXh0X2xpbmtfNl8yIjtzOjA6IiI7czoxMzoidGV4dF9saW5rXzZfMyI7czowOiIiO3M6MTM6InRleHRfbGlua182XzQiO3M6MDoiIjtzOjY6ImxpbmtfNiI7czowOiIiO3M6MTM6InRleHRfbGlua183XzEiO3M6MDoiIjtzOjEzOiJ0ZXh0X2xpbmtfN18yIjtzOjA6IiI7czoxMzoidGV4dF9saW5rXzdfMyI7czowOiIiO3M6MTM6InRleHRfbGlua183XzQiO3M6MDoiIjtzOjY6ImxpbmtfNyI7czowOiIiO3M6MTM6InRleHRfbGlua184XzEiO3M6MDoiIjtzOjEzOiJ0ZXh0X2xpbmtfOF8yIjtzOjA6IiI7czoxMzoidGV4dF9saW5rXzhfMyI7czowOiIiO3M6MTM6InRleHRfbGlua184XzQiO3M6MDoiIjtzOjY6ImxpbmtfOCI7czowOiIiO3M6MTM6InRleHRfbGlua185XzEiO3M6MDoiIjtzOjEzOiJ0ZXh0X2xpbmtfOV8yIjtzOjA6IiI7czoxMzoidGV4dF9saW5rXzlfMyI7czowOiIiO3M6MTM6InRleHRfbGlua185XzQiO3M6MDoiIjtzOjY6ImxpbmtfOSI7czowOiIiO3M6MTQ6InRleHRfbGlua18xMF8xIjtzOjA6IiI7czoxNDoidGV4dF9saW5rXzEwXzIiO3M6MDoiIjtzOjE0OiJ0ZXh0X2xpbmtfMTBfMyI7czowOiIiO3M6MTQ6InRleHRfbGlua18xMF80IjtzOjA6IiI7czozOiJ0YWIiO3M6MTI6IkFkbWluTW9kdWxlcyI7fQ==\', \'_SHOPID_\', \'1432088826\')'; 

 ?>