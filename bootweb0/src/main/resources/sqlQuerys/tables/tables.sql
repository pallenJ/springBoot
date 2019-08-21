CREATE TABLE `tbl_board` (
	`bno` INT(11) NOT NULL AUTO_INCREMENT,
	`title` VARCHAR(50) NULL DEFAULT '0' COLLATE 'utf8_bin',
	`writer` VARCHAR(50) NOT NULL DEFAULT '0' COLLATE 'utf8_bin',
	`content` VARCHAR(2000) NOT NULL DEFAULT '0' COLLATE 'utf8_bin',
	`regDate` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updateDate` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (`bno`)
)
COLLATE='utf8_bin'
ENGINE=InnoDB
AUTO_INCREMENT=0
;