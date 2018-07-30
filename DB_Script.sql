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
	

CREATE TABLE `Items` (
	`itemId` INT NOT NULL AUTO_INCREMENT,
	`itemName` varchar(50) NOT NULL UNIQUE,
	`category` varchar(30) NOT NULL,
    `quantity` INT(3) NOT NULL,
	`price` INT(5) NOT NULL,
	`loyalPoints` INT(3) NOT NULL,
	`createDate` DATE NOT NULL,
	PRIMARY KEY (`itemId`)
);

CREATE TABLE `orderItems` (
	`orderItemId` INT(10) NOT NULL UNIQUE AUTO_INCREMENT, 
	`orderId` INT(10) NOT NULL AUTO_INCREMENT,
	`ItemId` INT(10) NOT NULL UNIQUE,
	`itemName` varchar(20) NOT NULL UNIQUE,
	`itemQty` INT(5) NOT NULL,
	`itemPrice` INT(5) NOT NULL,
	`itemPoints` INT(5) NOT NULL,
	`userId` INT(10) NOT NULL,
	`orderDate` DATE NOT NULL, 
	`category` VARCHAR(30) NOT NULL
);

ALTER TABLE `orderItems` ADD CONSTRAINT `orderItems_fk1` FOREIGN KEY (`ItemId`) REFERENCES `Items`(`itemId`);
ALTER TABLE `orderItems` ADD CONSTRAINT `orderItems_fk2` FOREIGN KEY (`userId`) REFERENCES `Users`(`userId`);

CREATE TABLE `userOrders` (
	`userOrderId` INT(10) NOT NULL UNIQUE AUTO_INCREMENT,
	`orderId` INT(10) NOT NULL UNIQUE,
	`userId` INT(10) NOT NULL,
	`quantity` INT(10) NOT NULL,
	`amount` INT(10) NOT NULL,
	`loyalPoints` INT(10) NOT NULL,
	`orderDate` DATE NOT NULL
);

ALTER TABLE `userOrders` ADD CONSTRAINT `userOrders_fk0` FOREIGN KEY (`userId`) REFERENCES `Users`(`userId`);
