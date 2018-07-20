-- Database/Schema Creation --
CREATE DATABASE cateringservices;
-- User Management Module Tables --
CREATE TABLE `Users` (
	`userId` INT(16) NOT NULL AUTO_INCREMENT,
	`firstName` varchar(20) NOT NULL,
	`lastName` varchar(20),
	`username` varchar(30) NOT NULL UNIQUE,
	`password` varchar(30) NOT NULL,
	`role` varchar(20) NOT NULL,
	`email` varchar(50) NOT NULL UNIQUE,
	`phone` varchar(15) NOT NULL UNIQUE,
	`status` varchar(10) NOT NULL,
	`createDate` DATE,
	`lastModifiedDate` DATE,
	PRIMARY KEY (`userId`)
);

CREATE TABLE `feedback` (
    `feedbackId` INT(10) NOT NULL AUTO_INCREMENT UNIQUE,	
    `name` Varchar(30) NOT NULL,
	`email` VARCHAR(50) NOT NULL,
	`subject` VARCHAR(100) NOT NULL,
	`message` varchar(1000),
	`submittedDate` DATE NOT NULL
);

CREATE TABLE `cateringservices`.`pwdQuestionaries` (
	`pwdQuestionarieId` INT(10) NOT NULL AUTO_INCREMENT UNIQUE,
	`userId` INT(10) NOT NULL,
	`username` varchar(30) NOT NULL UNIQUE,l
	`email` varchar(50) NOT NULL UNIQUE,
	`question1` varchar(100) NOT NULL,
	`answer1` varchar(50) NOT NULL,
	`question2` varchar(100) NOT NULL,
	`answer2` varchar(50) NOT NULL,
	`createdDate` DATE,
	`lastUpdatedDate` DATE
);
ALTER TABLE `cateringservices`.`pwdQuestionaries` ADD CONSTRAINT `pwdQuestionaries_fk0` FOREIGN KEY (`userId`) REFERENCES cateringservices.users(userId);

CREATE TABLE `orderRegister` (
	`orderRegisterId` INT(10) NOT NULL AUTO_INCREMENT UNIQUE,
	`userId` INT(10) NOT NULL,
	`comingForLunch` varchar(5) NOT NULL DEFAULT 'No',
	`lunchDate` DATE NOT NULL
);

ALTER TABLE `orderRegister` ADD CONSTRAINT `orderRegister_fk0` FOREIGN KEY (`userId`) REFERENCES `Users`(`userId`);

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
