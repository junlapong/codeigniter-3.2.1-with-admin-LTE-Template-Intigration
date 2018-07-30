CREATE TABLE `ci_sessions` (
	`id`	varchar ( 128 ) NOT NULL,
	`ip_address`	varchar ( 45 ) NOT NULL,
	`timestamp`	int ( 10 ) NOT NULL,
	`data`	blob NOT NULL,
	PRIMARY KEY(`timestamp`)
);

DROP TABLE IF EXISTS `tbl_items`;
CREATE TABLE `tbl_items` (
	`itemId`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`itemHeader`	varchar ( 512 ) NOT NULL,
	`itemSub`	varchar ( 1021 ) NOT NULL,
	`itemDesc`	text,
	`itemImage`	varchar ( 80 ) DEFAULT NULL,
	`isDeleted`	tinyint ( 4 ) NOT NULL DEFAULT '0',
	`createdBy`	int ( 11 ) NOT NULL,
	`createdDtm`	datetime NOT NULL,
	`updatedDtm`	datetime DEFAULT NULL,
	`updatedBy`	int ( 11 ) DEFAULT NULL
);


REPLACE INTO `tbl_items` (`itemId`, `itemHeader`, `itemSub`, `itemDesc`, `itemImage`, `isDeleted`, `createdBy`, `createdDtm`, `updatedDtm`, `updatedBy`) VALUES
	(1, 'jquery.validation.js', 'Contribution towards jquery.validation.js', 'jquery.validation.js is the client side javascript validation library authored by Jörn Zaefferer hosted on github for us and we are trying to contribute to it. Working on localization now', 'validation.png', 0, 1, '2015-09-02 00:00:00', NULL, NULL),
	(2, 'CodeIgniter User Management', 'Demo for user management system', 'This the demo of User Management System (Admin Panel) using CodeIgniter PHP MVC Framework and AdminLTE bootstrap theme. You can download the code from the repository or forked it to contribute. Usage and installation instructions are provided in ReadMe.MD', 'cias.png', 0, 1, '2015-09-02 00:00:00', NULL, NULL);


DROP TABLE IF EXISTS `tbl_reset_password`;
CREATE TABLE `tbl_reset_password` (
	`id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`email`	varchar ( 128 ) NOT NULL,
	`activation_id`	varchar ( 32 ) NOT NULL,
	`agent`	varchar ( 512 ) NOT NULL,
	`client_ip`	varchar ( 32 ) NOT NULL,
	`isDeleted`	tinyint ( 4 ) NOT NULL DEFAULT '0',
	`createdBy`	bigint ( 20 ) NOT NULL DEFAULT '1',
	`createdDtm`	datetime NOT NULL,
	`updatedBy`	bigint ( 20 ) DEFAULT NULL,
	`updatedDtm`	datetime DEFAULT NULL
);


DROP TABLE IF EXISTS `tbl_roles`;
CREATE TABLE `tbl_roles` (
	`roleId`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`role`	varchar ( 50 ) NOT NULL
);


REPLACE INTO `tbl_roles` (`roleId`, `role`) VALUES
	(1, 'System Administrator'),
	(2, 'Manager'),
	(3, 'Employee');


DROP TABLE IF EXISTS `tbl_users`;
CREATE TABLE `tbl_users` (
	`userId`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`email`	varchar ( 128 ) NOT NULL,
	`password`	varchar ( 128 ) NOT NULL,
	`name`	varchar ( 128 ) DEFAULT NULL,
	`mobile`	varchar ( 20 ) DEFAULT NULL,
	`roleId`	tinyint ( 4 ) NOT NULL,
	`isDeleted`	tinyint ( 4 ) NOT NULL DEFAULT '0',
	`createdBy`	int ( 11 ) NOT NULL,
	`createdDtm`	datetime NOT NULL,
	`updatedBy`	int ( 11 ) DEFAULT NULL,
	`updatedDtm`	datetime DEFAULT NULL
);


REPLACE INTO `tbl_users` (`userId`, `email`, `password`, `name`, `mobile`, `roleId`, `isDeleted`, `createdBy`, `createdDtm`, `updatedBy`, `updatedDtm`) VALUES
	(1, 'admin@bewithdhanu.in', '$2y$10$SAvFim22ptA9gHVORtIaru1dn9rhgerJlJCPxRNA02MjQaJnkxawq', 'System Administrator', '9890098900', 1, 0, 0, '2015-07-01 18:56:49', 1, '2017-06-19 09:22:53'),
	(2, 'manager@bewithdhanu.in', '$2y$10$Gkl9ILEdGNoTIV9w/xpf3.mSKs0LB1jkvvPKK7K0PSYDsQY7GE9JK', 'Manager', '9890098900', 2, 0, 1, '2016-12-09 17:49:56', 1, '2017-06-19 09:22:29'),
	(3, 'employee@bewithdhanu.in', '$2y$10$MB5NIu8i28XtMCnuExyFB.Ao1OXSteNpCiZSiaMSRPQx1F1WLRId2', 'Employee', '9890098900', 3, 0, 1, '2016-12-09 17:50:22', 1, '2017-06-19 09:23:21');
