-- Database/Schema Creation --
CREATE DATABASE cateringservices;
-- User Management Module Tables --
CREATE TABLE `cateringservices`.`users` (
  `userId` INT(10) NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(30) NOT NULL,
  `lastname` VARCHAR(30) NULL,
  `username` VARCHAR(30) NOT NULL,
  `password` VARCHAR(30) NOT NULL,
  `role` VARCHAR(15) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `phone` VARCHAR(10) NOT NULL,
  `status` VARCHAR(10) NULL,
  `createDate` DATE NULL,
  `lastModifiedDate` DATE NULL,
  UNIQUE INDEX `userId_UNIQUE` (`userId` ASC) VISIBLE,
  PRIMARY KEY (`username`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `phone_UNIQUE` (`phone` ASC) VISIBLE);

CREATE TABLE `cateringservices`.`feedback` (
  `feedbackInd` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `subject` VARCHAR(100) NOT NULL,
  `message` VARCHAR(1000) NOT NULL,
  `submittedDate` DATE NULL,
  PRIMARY KEY (`feedbackInd`));

CREATE TABLE `cateringservices`.`pwdquestionaries` (
  `pwdQuestionarieId` INT(10) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(30) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `question1` VARCHAR(100) NOT NULL,
  `answer1` VARCHAR(50) NOT NULL,
  `question2` VARCHAR(100) NOT NULL,
  `answer2` VARCHAR(50) NOT NULL,
  `createdDate` DATE NULL,
  `lastUpdatedDate` DATE NULL,
  PRIMARY KEY (`pwdQuestionarieId`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  CONSTRAINT `fk_username`
    FOREIGN KEY (`username`)
    REFERENCES `cateringservices`.`users` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE `cateringservices`.`userlogin` (
  `username` VARCHAR(30) NOT NULL,
  `weekDay` INT(2) NOT NULL,
  `sessionTime` DATETIME NOT NULL,
  INDEX `fk_username_idx` (`username` ASC) VISIBLE,
  CONSTRAINT `fk_loginusername`
    FOREIGN KEY (`username`)
    REFERENCES `cateringservices`.`users` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
	
CREATE TABLE `cateringservices`.`itemsinventory` (
  `itemid` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `quantity` INT(5) NULL,
  `price` INT(5) NOT NULL,
  `loyalpoints` INT(5) NOT NULL,
  `category` VARCHAR(50) NOT NULL,
  `stockavailable` VARCHAR(45) NULL,
  `type` VARCHAR(30) NULL,
  PRIMARY KEY (`itemid`),
  UNIQUE INDEX `itemname_UNIQUE` (`name` ASC) VISIBLE);

CREATE TABLE `orderitems` (
  `orderitemid` int(5) NOT NULL,
  `orderid` int(5) NOT NULL,
  `username` varchar(30) NOT NULL,
  `itemname` varchar(50) NOT NULL,
  `itemqty` int(5) NOT NULL,
  `itemprice` int(5) NOT NULL,
  `itemloyalpoints` int(5) NOT NULL,
  `itemcategory` varchar(30) NOT NULL,
  `createddate` date NOT NULL,
  PRIMARY KEY (`orderitemid`),
  KEY `orderitems_fk_idx` (`orderid`),
  KEY `orderitems_fk1_idx` (`username`),
  CONSTRAINT `orderitems_fk0` FOREIGN KEY (`orderid`) REFERENCES `userorders` (`orderid`),
  CONSTRAINT `orderitems_fk1` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `cateringservices`.`ingredientsinventory` (
  `ingredientid` INT NOT NULL AUTO_INCREMENT,
  `ingredientname` VARCHAR(45) NOT NULL,
  `quantity` INT(10) NOT NULL,
  `type` VARCHAR(45) NULL,
  PRIMARY KEY (`ingredientid`));

CREATE TABLE `cateringservices`.`userorders` (
  `orderid` INT(5) NOT NULL,
  `username` VARCHAR(30) NOT NULL,
  `orderquantity` INT(5) NOT NULL,
  `orderamount` INT(10) NOT NULL,
  `orderloyalpoints` INT(5) NOT NULL,
  `ordercreatedate` DATE NOT NULL,
  PRIMARY KEY (`orderid`),
  INDEX `userorders_fk_idx` (`username` ASC) VISIBLE,
  CONSTRAINT `userorders_fk`
    FOREIGN KEY (`username`)
    REFERENCES `cateringservices`.`users` (`username`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT);

