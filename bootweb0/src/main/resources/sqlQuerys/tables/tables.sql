CREATE TABLE `tbl_board` (
	`bno` INT(11) NOT NULL AUTO_INCREMENT,
	`title` VARCHAR(50) NULL DEFAULT '0' COLLATE 'utf8_bin',
	`writer` VARCHAR(50) NOT NULL DEFAULT '0' COLLATE 'utf8_bin',
	`content` VARCHAR(2000) NOT NULL DEFAULT '0' COLLATE 'utf8_bin',
	`regDate` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updateDate` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`ip_address` VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8_bin',
	`state` VARCHAR(10) NOT NULL DEFAULT 'NORMAL' COLLATE 'utf8_bin',
	PRIMARY KEY (`bno`)
)
COLLATE='utf8_bin'
ENGINE=InnoDB
AUTO_INCREMENT=0
;




CREATE TABLE `tbl_board_history` (
	`hbno` INT(11) NOT NULL AUTO_INCREMENT,
	`bno` INT(11) NOT NULL DEFAULT '0',
	`title` VARCHAR(50) NULL DEFAULT '0' COLLATE 'utf8_bin',
	`writer` VARCHAR(50) NOT NULL DEFAULT '0' COLLATE 'utf8_bin',
	`content` VARCHAR(2000) NOT NULL DEFAULT '0' COLLATE 'utf8_bin',
	`regDate` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updateDate` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`ip_address` VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8_bin',
	PRIMARY KEY (`hbno`),
	INDEX `FK_tbl_board_edit_tbl_board` (`bno`),
	CONSTRAINT `FK_tbl_board_edit_tbl_board` FOREIGN KEY (`bno`) REFERENCES `tbl_board` (`bno`)
)
COLLATE='utf8_bin'
ENGINE=InnoDB
;
