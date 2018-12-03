/*
Navicat MySQL Data Transfer

Source Server         : web
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : sisterstailor

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-12-04 00:38:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for activations
-- ----------------------------
DROP TABLE IF EXISTS `activations`;
CREATE TABLE `activations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of activations
-- ----------------------------
INSERT INTO `activations` VALUES ('1', '1', 'cGM7dlIpTxsejfg0WZcTNweHKUKcvxRu', '1', '2018-12-03 15:38:42', '2018-12-03 15:38:42', '2018-12-03 15:38:42');
INSERT INTO `activations` VALUES ('2', '2', 'kw2oXJwW5Z4fJNcHlu0arfhGe4zVTpKV', '0', null, '2018-12-03 16:23:16', '2018-12-03 16:23:16');

-- ----------------------------
-- Table structure for dashboard__widgets
-- ----------------------------
DROP TABLE IF EXISTS `dashboard__widgets`;
CREATE TABLE `dashboard__widgets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `widgets` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard__widgets_user_id_foreign` (`user_id`),
  CONSTRAINT `dashboard__widgets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of dashboard__widgets
-- ----------------------------

-- ----------------------------
-- Table structure for media__files
-- ----------------------------
DROP TABLE IF EXISTS `media__files`;
CREATE TABLE `media__files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_folder` tinyint(1) NOT NULL DEFAULT '0',
  `filename` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extension` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mimetype` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filesize` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `folder_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of media__files
-- ----------------------------

-- ----------------------------
-- Table structure for media__file_translations
-- ----------------------------
DROP TABLE IF EXISTS `media__file_translations`;
CREATE TABLE `media__file_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `file_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt_attribute` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keywords` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `media__file_translations_file_id_locale_unique` (`file_id`,`locale`),
  KEY `media__file_translations_locale_index` (`locale`),
  CONSTRAINT `media__file_translations_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `media__files` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of media__file_translations
-- ----------------------------

-- ----------------------------
-- Table structure for media__imageables
-- ----------------------------
DROP TABLE IF EXISTS `media__imageables`;
CREATE TABLE `media__imageables` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `file_id` int(11) NOT NULL,
  `imageable_id` int(11) NOT NULL,
  `imageable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of media__imageables
-- ----------------------------

-- ----------------------------
-- Table structure for menu__menuitems
-- ----------------------------
DROP TABLE IF EXISTS `menu__menuitems`;
CREATE TABLE `menu__menuitems` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned NOT NULL,
  `page_id` int(10) unsigned DEFAULT NULL,
  `position` int(10) unsigned NOT NULL DEFAULT '0',
  `target` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'page',
  `class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `module_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `depth` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_root` tinyint(1) NOT NULL DEFAULT '0',
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu__menuitems_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu__menuitems_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menu__menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of menu__menuitems
-- ----------------------------

-- ----------------------------
-- Table structure for menu__menuitem_translations
-- ----------------------------
DROP TABLE IF EXISTS `menu__menuitem_translations`;
CREATE TABLE `menu__menuitem_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menuitem_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uri` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menu__menuitem_translations_menuitem_id_locale_unique` (`menuitem_id`,`locale`),
  KEY `menu__menuitem_translations_locale_index` (`locale`),
  CONSTRAINT `menu__menuitem_translations_menuitem_id_foreign` FOREIGN KEY (`menuitem_id`) REFERENCES `menu__menuitems` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of menu__menuitem_translations
-- ----------------------------

-- ----------------------------
-- Table structure for menu__menus
-- ----------------------------
DROP TABLE IF EXISTS `menu__menus`;
CREATE TABLE `menu__menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `primary` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of menu__menus
-- ----------------------------

-- ----------------------------
-- Table structure for menu__menu_translations
-- ----------------------------
DROP TABLE IF EXISTS `menu__menu_translations`;
CREATE TABLE `menu__menu_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menu__menu_translations_menu_id_locale_unique` (`menu_id`,`locale`),
  KEY `menu__menu_translations_locale_index` (`locale`),
  CONSTRAINT `menu__menu_translations_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menu__menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of menu__menu_translations
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('1', '2014_07_02_230147_migration_cartalyst_sentinel', '1');
INSERT INTO `migrations` VALUES ('2', '2016_06_24_193447_create_user_tokens_table', '1');
INSERT INTO `migrations` VALUES ('3', '2014_10_14_200250_create_settings_table', '2');
INSERT INTO `migrations` VALUES ('4', '2014_10_15_191204_create_setting_translations_table', '2');
INSERT INTO `migrations` VALUES ('5', '2015_06_18_170048_make_settings_value_text_field', '2');
INSERT INTO `migrations` VALUES ('6', '2015_10_22_130947_make_settings_name_unique', '2');
INSERT INTO `migrations` VALUES ('7', '2017_09_17_164631_make_setting_value_nullable', '2');
INSERT INTO `migrations` VALUES ('8', '2014_11_03_160015_create_menus_table', '3');
INSERT INTO `migrations` VALUES ('9', '2014_11_03_160138_create_menu-translations_table', '3');
INSERT INTO `migrations` VALUES ('10', '2014_11_03_160753_create_menuitems_table', '3');
INSERT INTO `migrations` VALUES ('11', '2014_11_03_160804_create_menuitem_translation_table', '3');
INSERT INTO `migrations` VALUES ('12', '2014_12_17_185301_add_root_column_to_menus_table', '3');
INSERT INTO `migrations` VALUES ('13', '2015_09_05_100142_add_icon_column_to_menuitems_table', '3');
INSERT INTO `migrations` VALUES ('14', '2016_01_26_102307_update_icon_column_on_menuitems_table', '3');
INSERT INTO `migrations` VALUES ('15', '2016_08_01_142345_add_link_type_colymn_to_menuitems_table', '3');
INSERT INTO `migrations` VALUES ('16', '2016_08_01_143130_add_class_column_to_menuitems_table', '3');
INSERT INTO `migrations` VALUES ('17', '2017_09_18_192639_make_title_field_nullable_menu_table', '3');
INSERT INTO `migrations` VALUES ('18', '2014_10_26_162751_create_files_table', '4');
INSERT INTO `migrations` VALUES ('19', '2014_10_26_162811_create_file_translations_table', '4');
INSERT INTO `migrations` VALUES ('20', '2015_02_27_105241_create_image_links_table', '4');
INSERT INTO `migrations` VALUES ('21', '2015_12_19_143643_add_sortable', '4');
INSERT INTO `migrations` VALUES ('22', '2017_09_20_144631_add_folders_columns_on_files_table', '4');
INSERT INTO `migrations` VALUES ('23', '2014_11_30_191858_create_pages_tables', '5');
INSERT INTO `migrations` VALUES ('24', '2017_10_13_103344_make_status_field_nullable_on_page_translations_table', '5');
INSERT INTO `migrations` VALUES ('25', '2018_05_23_145242_edit_body_column_nullable', '5');
INSERT INTO `migrations` VALUES ('26', '2015_04_02_184200_create_widgets_table', '6');
INSERT INTO `migrations` VALUES ('27', '2013_04_09_062329_create_revisions_table', '7');
INSERT INTO `migrations` VALUES ('28', '2015_11_20_184604486385_create_translation_translations_table', '7');
INSERT INTO `migrations` VALUES ('29', '2015_11_20_184604743083_create_translation_translation_translations_table', '7');
INSERT INTO `migrations` VALUES ('30', '2015_12_01_094031_update_translation_translations_table_with_index', '7');
INSERT INTO `migrations` VALUES ('31', '2016_07_12_181155032011_create_tag_tags_table', '8');
INSERT INTO `migrations` VALUES ('32', '2016_07_12_181155289444_create_tag_tag_translations_table', '8');

-- ----------------------------
-- Table structure for page__pages
-- ----------------------------
DROP TABLE IF EXISTS `page__pages`;
CREATE TABLE `page__pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_home` tinyint(1) NOT NULL DEFAULT '0',
  `template` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of page__pages
-- ----------------------------
INSERT INTO `page__pages` VALUES ('1', '1', 'home', '2018-12-03 15:38:46', '2018-12-03 15:38:46');

-- ----------------------------
-- Table structure for page__page_translations
-- ----------------------------
DROP TABLE IF EXISTS `page__page_translations`;
CREATE TABLE `page__page_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '1',
  `body` text COLLATE utf8mb4_unicode_ci,
  `meta_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `og_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `og_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `og_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `og_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `page__page_translations_page_id_locale_unique` (`page_id`,`locale`),
  KEY `page__page_translations_locale_index` (`locale`),
  CONSTRAINT `page__page_translations_page_id_foreign` FOREIGN KEY (`page_id`) REFERENCES `page__pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of page__page_translations
-- ----------------------------
INSERT INTO `page__page_translations` VALUES ('1', '1', 'en', 'Home page', 'home', '1', '<p><strong>You made it!</strong></p>\n<p>You&#39;ve installed AsgardCMS and are ready to proceed to the <a href=\"/en/backend\">administration area</a>.</p>\n<h2>What&#39;s next ?</h2>\n<p>Learn how you can develop modules for AsgardCMS by reading our <a href=\"https://github.com/AsgardCms/Documentation\">documentation</a>.</p>\n', 'Home page', null, null, null, null, null, '2018-12-03 15:38:46', '2018-12-03 15:38:46');

-- ----------------------------
-- Table structure for persistences
-- ----------------------------
DROP TABLE IF EXISTS `persistences`;
CREATE TABLE `persistences` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `persistences_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of persistences
-- ----------------------------
INSERT INTO `persistences` VALUES ('2', '1', 'CzAtBm3slZeseLhSprRSYLM82jhNumO6', '2018-12-03 15:44:20', '2018-12-03 15:44:20');
INSERT INTO `persistences` VALUES ('3', '1', 'MZm6b6RrREILBInriRamZiAHdp3SWL0G', '2018-12-03 17:37:15', '2018-12-03 17:37:15');

-- ----------------------------
-- Table structure for reminders
-- ----------------------------
DROP TABLE IF EXISTS `reminders`;
CREATE TABLE `reminders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of reminders
-- ----------------------------

-- ----------------------------
-- Table structure for revisions
-- ----------------------------
DROP TABLE IF EXISTS `revisions`;
CREATE TABLE `revisions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `revisionable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revisionable_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `old_value` text COLLATE utf8mb4_unicode_ci,
  `new_value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of revisions
-- ----------------------------

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('1', 'admin', 'Admin', '{\"core.sidebar.group\":true,\"dashboard.index\":true,\"dashboard.update\":true,\"dashboard.reset\":true,\"workshop.sidebar.group\":true,\"workshop.modules.index\":true,\"workshop.modules.show\":true,\"workshop.modules.update\":true,\"workshop.modules.disable\":true,\"workshop.modules.enable\":true,\"workshop.modules.publish\":true,\"workshop.themes.index\":true,\"workshop.themes.show\":true,\"workshop.themes.publish\":true,\"user.roles.index\":true,\"user.roles.create\":true,\"user.roles.edit\":true,\"user.roles.destroy\":true,\"user.users.index\":true,\"user.users.create\":true,\"user.users.edit\":true,\"user.users.destroy\":true,\"account.api-keys.index\":true,\"account.api-keys.create\":true,\"account.api-keys.destroy\":true,\"menu.menus.index\":true,\"menu.menus.create\":true,\"menu.menus.edit\":true,\"menu.menus.destroy\":true,\"menu.menuitems.index\":true,\"menu.menuitems.create\":true,\"menu.menuitems.edit\":true,\"menu.menuitems.destroy\":true,\"media.medias.index\":true,\"media.medias.create\":true,\"media.medias.edit\":true,\"media.medias.destroy\":true,\"media.folders.index\":true,\"media.folders.create\":true,\"media.folders.edit\":true,\"media.folders.destroy\":true,\"setting.settings.index\":true,\"setting.settings.edit\":true,\"page.pages.index\":true,\"page.pages.create\":true,\"page.pages.edit\":true,\"page.pages.destroy\":true,\"translation.translations.index\":true,\"translation.translations.edit\":true,\"translation.translations.export\":true,\"translation.translations.import\":true,\"tag.tags.index\":true,\"tag.tags.create\":true,\"tag.tags.edit\":true,\"tag.tags.destroy\":true}', '2018-12-03 15:37:58', '2018-12-03 15:37:58');
INSERT INTO `roles` VALUES ('2', 'user', 'User', null, '2018-12-03 15:37:58', '2018-12-03 15:37:58');

-- ----------------------------
-- Table structure for role_users
-- ----------------------------
DROP TABLE IF EXISTS `role_users`;
CREATE TABLE `role_users` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of role_users
-- ----------------------------
INSERT INTO `role_users` VALUES ('1', '1', '2018-12-03 15:38:42', '2018-12-03 15:38:42');
INSERT INTO `role_users` VALUES ('2', '2', '2018-12-03 16:23:16', '2018-12-03 16:23:16');

-- ----------------------------
-- Table structure for setting__settings
-- ----------------------------
DROP TABLE IF EXISTS `setting__settings`;
CREATE TABLE `setting__settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plainValue` text COLLATE utf8mb4_unicode_ci,
  `isTranslatable` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `setting__settings_name_unique` (`name`),
  KEY `setting__settings_name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of setting__settings
-- ----------------------------
INSERT INTO `setting__settings` VALUES ('1', 'core::template', 'Flatly', '0', '2018-12-03 15:38:46', '2018-12-03 15:38:46');
INSERT INTO `setting__settings` VALUES ('2', 'core::locales', '[\"en\"]', '0', '2018-12-03 15:38:46', '2018-12-03 15:38:46');

-- ----------------------------
-- Table structure for setting__setting_translations
-- ----------------------------
DROP TABLE IF EXISTS `setting__setting_translations`;
CREATE TABLE `setting__setting_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `setting_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `setting__setting_translations_setting_id_locale_unique` (`setting_id`,`locale`),
  KEY `setting__setting_translations_locale_index` (`locale`),
  CONSTRAINT `setting__setting_translations_setting_id_foreign` FOREIGN KEY (`setting_id`) REFERENCES `setting__settings` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of setting__setting_translations
-- ----------------------------

-- ----------------------------
-- Table structure for tag__tagged
-- ----------------------------
DROP TABLE IF EXISTS `tag__tagged`;
CREATE TABLE `tag__tagged` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `taggable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taggable_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tag__tagged_taggable_type_taggable_id_index` (`taggable_type`,`taggable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tag__tagged
-- ----------------------------

-- ----------------------------
-- Table structure for tag__tags
-- ----------------------------
DROP TABLE IF EXISTS `tag__tags`;
CREATE TABLE `tag__tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `namespace` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tag__tags
-- ----------------------------

-- ----------------------------
-- Table structure for tag__tag_translations
-- ----------------------------
DROP TABLE IF EXISTS `tag__tag_translations`;
CREATE TABLE `tag__tag_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tag__tag_translations_tag_id_locale_unique` (`tag_id`,`locale`),
  KEY `tag__tag_translations_locale_index` (`locale`),
  CONSTRAINT `tag__tag_translations_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tag__tags` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tag__tag_translations
-- ----------------------------

-- ----------------------------
-- Table structure for throttle
-- ----------------------------
DROP TABLE IF EXISTS `throttle`;
CREATE TABLE `throttle` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `throttle_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of throttle
-- ----------------------------
INSERT INTO `throttle` VALUES ('1', null, 'global', null, '2018-12-03 16:19:38', '2018-12-03 16:19:38');
INSERT INTO `throttle` VALUES ('2', null, 'ip', '::1', '2018-12-03 16:19:38', '2018-12-03 16:19:38');
INSERT INTO `throttle` VALUES ('3', null, 'global', null, '2018-12-03 16:20:03', '2018-12-03 16:20:03');
INSERT INTO `throttle` VALUES ('4', null, 'ip', '::1', '2018-12-03 16:20:03', '2018-12-03 16:20:03');
INSERT INTO `throttle` VALUES ('5', null, 'global', null, '2018-12-03 16:20:13', '2018-12-03 16:20:13');
INSERT INTO `throttle` VALUES ('6', null, 'ip', '::1', '2018-12-03 16:20:13', '2018-12-03 16:20:13');
INSERT INTO `throttle` VALUES ('7', null, 'global', null, '2018-12-03 16:21:41', '2018-12-03 16:21:41');
INSERT INTO `throttle` VALUES ('8', null, 'ip', '::1', '2018-12-03 16:21:41', '2018-12-03 16:21:41');
INSERT INTO `throttle` VALUES ('9', null, 'global', null, '2018-12-03 16:22:16', '2018-12-03 16:22:16');
INSERT INTO `throttle` VALUES ('10', null, 'ip', '::1', '2018-12-03 16:22:16', '2018-12-03 16:22:16');

-- ----------------------------
-- Table structure for translation__translations
-- ----------------------------
DROP TABLE IF EXISTS `translation__translations`;
CREATE TABLE `translation__translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `translation__translations_key_index` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of translation__translations
-- ----------------------------

-- ----------------------------
-- Table structure for translation__translation_translations
-- ----------------------------
DROP TABLE IF EXISTS `translation__translation_translations`;
CREATE TABLE `translation__translation_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `translation_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_trans_id_locale_unique` (`translation_id`,`locale`),
  KEY `translation__translation_translations_locale_index` (`locale`),
  CONSTRAINT `translation__translation_translations_translation_id_foreign` FOREIGN KEY (`translation_id`) REFERENCES `translation__translations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of translation__translation_translations
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `last_login` timestamp NULL DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'admin@gmail.com', '$2y$10$5cP60WOA0lQJNUdk0NEJ/.xNpHzeFScPBGahHzd5agWW/b5cp5EdW', null, '2018-12-03 17:37:15', 'admin', 'admin', '2018-12-03 15:38:42', '2018-12-03 17:37:15');
INSERT INTO `users` VALUES ('2', 'quangphi4190@gmail.com', '$2y$10$duOxAPGt7RC8Tmugc04wH.XaESW00HNScjhL9aFhAOd59IMfZKkUu', null, null, null, null, '2018-12-03 16:23:16', '2018-12-03 16:23:16');

-- ----------------------------
-- Table structure for user_tokens
-- ----------------------------
DROP TABLE IF EXISTS `user_tokens`;
CREATE TABLE `user_tokens` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `access_token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_tokens_access_token_unique` (`access_token`),
  KEY `user_tokens_user_id_foreign` (`user_id`),
  CONSTRAINT `user_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of user_tokens
-- ----------------------------
INSERT INTO `user_tokens` VALUES ('1', '1', 'c42838e8-d529-42a8-b020-9e3ac2e32021', '2018-12-03 15:38:43', '2018-12-03 15:38:43');
