-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema villagebayanihan
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `villagebayanihan` ;

-- -----------------------------------------------------
-- Schema villagebayanihan
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `villagebayanihan` DEFAULT CHARACTER SET utf8 ;
USE `villagebayanihan` ;

-- -----------------------------------------------------
-- Table `villagebayanihan`.`SYSADMINS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `villagebayanihan`.`SYSADMINS` ;

CREATE TABLE IF NOT EXISTS `villagebayanihan`.`SYSADMINS` (
  `admin_email` VARCHAR(45) NOT NULL,
  `start_date` DATE NOT NULL,
  `end_date` DATE NULL,
  PRIMARY KEY (`admin_email`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `villagebayanihan`.`USERS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `villagebayanihan`.`USERS` ;

CREATE TABLE IF NOT EXISTS `villagebayanihan`.`USERS` (
  `email` VARCHAR(45) NOT NULL,
  `user_type` ENUM('O', 'R') NOT NULL COMMENT 'O = Officer / Staff\nR = Resident',
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `sex` ENUM('M', 'F') NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `birthday` DATE NOT NULL,
  `office_start_date` DATE NULL,
  `office_end_date` VARCHAR(45) NULL,
  PRIMARY KEY (`email`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `villagebayanihan`.`REF_FILETYPES`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `villagebayanihan`.`REF_FILETYPES` ;

CREATE TABLE IF NOT EXISTS `villagebayanihan`.`REF_FILETYPES` (
  `file_type` INT(2) UNSIGNED NOT NULL,
  PRIMARY KEY (`file_type`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `villagebayanihan`.`REF_REQUIREMENTTYPES`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `villagebayanihan`.`REF_REQUIREMENTTYPES` ;

CREATE TABLE IF NOT EXISTS `villagebayanihan`.`REF_REQUIREMENTTYPES` (
  `requirement_type` INT(2) UNSIGNED NOT NULL,
  PRIMARY KEY (`requirement_type`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `villagebayanihan`.`FILES`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `villagebayanihan`.`FILES` ;

CREATE TABLE IF NOT EXISTS `villagebayanihan`.`FILES` (
  `fileID` INT(8) UNSIGNED NOT NULL,
  `file_name` VARCHAR(45) NOT NULL,
  `folder` VARCHAR(45) NOT NULL,
  `link` VARCHAR(45) NOT NULL,
  `file_type` INT(2) UNSIGNED NOT NULL,
  `requirement_type` INT(2) UNSIGNED NOT NULL,
  `date_submitted` DATE NOT NULL,
  `owner_email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`fileID`),
  INDEX `FK0005_idx` (`file_type` ASC) VISIBLE,
  INDEX `FK0006_idx` (`requirement_type` ASC) VISIBLE,
  INDEX `FK0007_idx` (`owner_email` ASC) VISIBLE,
  CONSTRAINT `FK0005`
    FOREIGN KEY (`file_type`)
    REFERENCES `villagebayanihan`.`REF_FILETYPES` (`file_type`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK0006`
    FOREIGN KEY (`requirement_type`)
    REFERENCES `villagebayanihan`.`REF_REQUIREMENTTYPES` (`requirement_type`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK0007`
    FOREIGN KEY (`owner_email`)
    REFERENCES `villagebayanihan`.`USERS` (`email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `villagebayanihan`.`APPROVALS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `villagebayanihan`.`APPROVALS` ;

CREATE TABLE IF NOT EXISTS `villagebayanihan`.`APPROVALS` (
  `approved` ENUM('Y', 'N') NOT NULL,
  `reason` VARCHAR(100) NULL,
  `admin_email` VARCHAR(45) NOT NULL,
  `user_email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`admin_email`, `user_email`),
  INDEX `FK0002_idx` (`user_email` ASC) VISIBLE,
  CONSTRAINT `FK0001`
    FOREIGN KEY (`admin_email`)
    REFERENCES `villagebayanihan`.`SYSADMINS` (`admin_email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK0002`
    FOREIGN KEY (`user_email`)
    REFERENCES `villagebayanihan`.`USERS` (`email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `villagebayanihan`.`HOUSEHOLDS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `villagebayanihan`.`HOUSEHOLDS` ;

CREATE TABLE IF NOT EXISTS `villagebayanihan`.`HOUSEHOLDS` (
  `householdID` INT(4) UNSIGNED NOT NULL,
  `block_no` INT(8) UNSIGNED NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`householdID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `villagebayanihan`.`RESIDENTS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `villagebayanihan`.`RESIDENTS` ;

CREATE TABLE IF NOT EXISTS `villagebayanihan`.`RESIDENTS` (
  `resident_email` VARCHAR(45) NOT NULL,
  `application_status` ENUM('A', 'P') NOT NULL COMMENT 'A = approved\nP = For approval',
  `user_email` VARCHAR(45) NOT NULL,
  `householdID` INT(4) UNSIGNED NOT NULL,
  PRIMARY KEY (`resident_email`),
  INDEX `FK0009_idx` (`user_email` ASC) VISIBLE,
  INDEX `FK0014_idx` (`householdID` ASC) VISIBLE,
  CONSTRAINT `FK0009`
    FOREIGN KEY (`user_email`)
    REFERENCES `villagebayanihan`.`USERS` (`email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK0014`
    FOREIGN KEY (`householdID`)
    REFERENCES `villagebayanihan`.`HOUSEHOLDS` (`householdID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `villagebayanihan`.`RESIDENTGROUPS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `villagebayanihan`.`RESIDENTGROUPS` ;

CREATE TABLE IF NOT EXISTS `villagebayanihan`.`RESIDENTGROUPS` (
  `groupID` INT(4) UNSIGNED NOT NULL,
  `block` VARCHAR(45) NOT NULL,
  `group_name` VARCHAR(45) NOT NULL,
  `active` ENUM('Y', 'N') NOT NULL,
  `rep_email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`groupID`),
  INDEX `FK0012_idx` (`rep_email` ASC) VISIBLE,
  CONSTRAINT `FK0012`
    FOREIGN KEY (`rep_email`)
    REFERENCES `villagebayanihan`.`RESIDENTS` (`resident_email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `villagebayanihan`.`INVITATIONS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `villagebayanihan`.`INVITATIONS` ;

CREATE TABLE IF NOT EXISTS `villagebayanihan`.`INVITATIONS` (
  `accepted` ENUM('Y', 'N') NOT NULL,
  `join_date` DATE NULL,
  `resident_email` VARCHAR(45) NOT NULL,
  `groupID` INT(8) UNSIGNED NOT NULL,
  INDEX `FK0010_idx` (`resident_email` ASC) VISIBLE,
  INDEX `FK0011_idx` (`groupID` ASC) VISIBLE,
  PRIMARY KEY (`resident_email`, `groupID`),
  CONSTRAINT `FK0010`
    FOREIGN KEY (`resident_email`)
    REFERENCES `villagebayanihan`.`RESIDENTS` (`resident_email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK0011`
    FOREIGN KEY (`groupID`)
    REFERENCES `villagebayanihan`.`RESIDENTGROUPS` (`groupID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `villagebayanihan`.`BUSINESSES`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `villagebayanihan`.`BUSINESSES` ;

CREATE TABLE IF NOT EXISTS `villagebayanihan`.`BUSINESSES` (
  `businessID` INT(8) UNSIGNED NOT NULL,
  `company_email` VARCHAR(45) NOT NULL,
  `business_type` VARCHAR(45) NOT NULL,
  `company_name` VARCHAR(45) NOT NULL,
  `blockNo` INT(8) UNSIGNED NULL,
  `company_address_line1` VARCHAR(45) NOT NULL,
  `company_address_line2` VARCHAR(45) NOT NULL,
  `operation_start_time` TIME NOT NULL,
  `operation_end_time` TIME NOT NULL,
  `in_village` ENUM('Y', 'N') NOT NULL,
  `distance_village` DECIMAL(6,2) NOT NULL,
  `business_status` ENUM('O', 'N') NOT NULL COMMENT 'O = operational\nN = non-operational',
  `owner_email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`businessID`),
  INDEX `FK0015_idx` (`owner_email` ASC) INVISIBLE,
  UNIQUE INDEX `company_email_UNIQUE` (`company_email` ASC) VISIBLE,
  CONSTRAINT `FK0015`
    FOREIGN KEY (`owner_email`)
    REFERENCES `villagebayanihan`.`USERS` (`email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `villagebayanihan`.`COMPANY_PHONENUMBERS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `villagebayanihan`.`COMPANY_PHONENUMBERS` ;

CREATE TABLE IF NOT EXISTS `villagebayanihan`.`COMPANY_PHONENUMBERS` (
  `phone_number` INT(11) UNSIGNED NOT NULL,
  `company_email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`phone_number`),
  CONSTRAINT `FK0016`
    FOREIGN KEY (`company_email`)
    REFERENCES `villagebayanihan`.`BUSINESSES` (`company_email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `villagebayanihan`.`DELIVERY_SERVICES`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `villagebayanihan`.`DELIVERY_SERVICES` ;

CREATE TABLE IF NOT EXISTS `villagebayanihan`.`DELIVERY_SERVICES` (
  `distance` INT(4) UNSIGNED NOT NULL,
  `fee` DECIMAL(4,2) NOT NULL,
  `company_email` VARCHAR(45) NOT NULL,
  `deliveryID` INT(4) NOT NULL,
  PRIMARY KEY (`deliveryID`),
  CONSTRAINT `FK0017`
    FOREIGN KEY (`company_email`)
    REFERENCES `villagebayanihan`.`BUSINESSES` (`company_email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `villagebayanihan`.`SUPPLIERUSERS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `villagebayanihan`.`SUPPLIERUSERS` ;

CREATE TABLE IF NOT EXISTS `villagebayanihan`.`SUPPLIERUSERS` (
  `supplier_email` VARCHAR(45) NOT NULL,
  `blockNo` INT(8) UNSIGNED NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `phone` INT(11) UNSIGNED NOT NULL,
  `position` ENUM('M', 'S') NOT NULL COMMENT 'M = Manager\nS = Staff',
  `active` ENUM('Y', 'N') NOT NULL,
  `hire_date` DATE NOT NULL,
  `end_date` DATE NULL,
  `businessID` INT(8) UNSIGNED NOT NULL,
  PRIMARY KEY (`supplier_email`),
  INDEX `FK0018_idx` (`businessID` ASC) VISIBLE,
  CONSTRAINT `FK0018`
    FOREIGN KEY (`businessID`)
    REFERENCES `villagebayanihan`.`BUSINESSES` (`businessID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `villagebayanihan`.`ISSUES`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `villagebayanihan`.`ISSUES` ;

CREATE TABLE IF NOT EXISTS `villagebayanihan`.`ISSUES` (
  `issueNo` INT(4) UNSIGNED NOT NULL,
  `issue_desc` VARCHAR(100) NOT NULL,
  `issue_date` DATE NOT NULL,
  `manager_email` VARCHAR(45) NULL,
  `staff_email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`issueNo`),
  INDEX `FK0020_idx` (`manager_email` ASC) VISIBLE,
  INDEX `FK0021_idx` (`staff_email` ASC) VISIBLE,
  CONSTRAINT `FK0020`
    FOREIGN KEY (`manager_email`)
    REFERENCES `villagebayanihan`.`SUPPLIERUSERS` (`supplier_email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK0021`
    FOREIGN KEY (`staff_email`)
    REFERENCES `villagebayanihan`.`SUPPLIERUSERS` (`supplier_email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `villagebayanihan`.`WORKDAYS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `villagebayanihan`.`WORKDAYS` ;

CREATE TABLE IF NOT EXISTS `villagebayanihan`.`WORKDAYS` (
  `work_days` ENUM('M', 'T', 'W', 'H', 'F', 'S', 'L') NOT NULL,
  `dayID` INT(1) UNSIGNED NOT NULL,
  PRIMARY KEY (`dayID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `villagebayanihan`.`SYSADMINSHIPS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `villagebayanihan`.`SYSADMINSHIPS` ;

CREATE TABLE IF NOT EXISTS `villagebayanihan`.`SYSADMINSHIPS` (
  `admin_email` VARCHAR(45) NOT NULL,
  `user_email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`admin_email`, `user_email`),
  INDEX `FK0002_idx` (`user_email` ASC) VISIBLE,
  CONSTRAINT `FK00002`
    FOREIGN KEY (`user_email`)
    REFERENCES `villagebayanihan`.`USERS` (`email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK0003`
    FOREIGN KEY (`admin_email`)
    REFERENCES `villagebayanihan`.`SYSADMINS` (`admin_email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `villagebayanihan`.`WORKDAY_ASSIGNMENTS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `villagebayanihan`.`WORKDAY_ASSIGNMENTS` ;

CREATE TABLE IF NOT EXISTS `villagebayanihan`.`WORKDAY_ASSIGNMENTS` (
  `supplier_email` VARCHAR(45) NOT NULL,
  `assign_date` DATE NOT NULL,
  `dayID` INT(1) UNSIGNED NOT NULL,
  PRIMARY KEY (`supplier_email`, `dayID`),
  INDEX `FK0029_idx` (`dayID` ASC) VISIBLE,
  CONSTRAINT `FK0028`
    FOREIGN KEY (`supplier_email`)
    REFERENCES `villagebayanihan`.`SUPPLIERUSERS` (`supplier_email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK0029`
    FOREIGN KEY (`dayID`)
    REFERENCES `villagebayanihan`.`WORKDAYS` (`dayID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `villagebayanihan`.`CARTVENDORS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `villagebayanihan`.`CARTVENDORS` ;

CREATE TABLE IF NOT EXISTS `villagebayanihan`.`CARTVENDORS` (
  `vendorID` INT(8) UNSIGNED NOT NULL,
  `businessID` INT(8) UNSIGNED NOT NULL,
  PRIMARY KEY (`vendorID`),
  INDEX `FK0035_idx` (`businessID` ASC) VISIBLE,
  CONSTRAINT `FK0035`
    FOREIGN KEY (`businessID`)
    REFERENCES `villagebayanihan`.`BUSINESSES` (`businessID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `villagebayanihan`.`PARKS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `villagebayanihan`.`PARKS` ;

CREATE TABLE IF NOT EXISTS `villagebayanihan`.`PARKS` (
  `parkID` INT(8) UNSIGNED NOT NULL,
  `location` VARCHAR(45) NOT NULL,
  `park_name` VARCHAR(45) NOT NULL,
  `vendorID` INT(8) UNSIGNED NOT NULL,
  PRIMARY KEY (`parkID`),
  INDEX `FK0036_idx` (`vendorID` ASC) VISIBLE,
  CONSTRAINT `FK0036`
    FOREIGN KEY (`vendorID`)
    REFERENCES `villagebayanihan`.`CARTVENDORS` (`vendorID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `villagebayanihan`.`ROUTES`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `villagebayanihan`.`ROUTES` ;

CREATE TABLE IF NOT EXISTS `villagebayanihan`.`ROUTES` (
  `routeID` INT(8) UNSIGNED NOT NULL,
  `location` VARCHAR(45) NOT NULL,
  `vendorID` INT(8) UNSIGNED NOT NULL,
  PRIMARY KEY (`routeID`),
  INDEX `FK0036_idx` (`vendorID` ASC) VISIBLE,
  CONSTRAINT `FK00360`
    FOREIGN KEY (`vendorID`)
    REFERENCES `villagebayanihan`.`CARTVENDORS` (`vendorID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `villagebayanihan`.`CART_PASSED_DAYS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `villagebayanihan`.`CART_PASSED_DAYS` ;

CREATE TABLE IF NOT EXISTS `villagebayanihan`.`CART_PASSED_DAYS` (
  `days_passed` DATE NOT NULL,
  `vendorID` INT(8) UNSIGNED NOT NULL,
  PRIMARY KEY (`days_passed`),
  INDEX `FK0037_idx` (`vendorID` ASC) VISIBLE,
  CONSTRAINT `FK0037`
    FOREIGN KEY (`vendorID`)
    REFERENCES `villagebayanihan`.`PARKS` (`vendorID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK0049`
    FOREIGN KEY (`vendorID`)
    REFERENCES `villagebayanihan`.`ROUTES` (`vendorID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `villagebayanihan`.`CART_PASSED_TIMES`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `villagebayanihan`.`CART_PASSED_TIMES` ;

CREATE TABLE IF NOT EXISTS `villagebayanihan`.`CART_PASSED_TIMES` (
  `times_passed` TIME NOT NULL,
  `vendorID` INT(8) UNSIGNED NOT NULL,
  PRIMARY KEY (`times_passed`),
  INDEX `FK0037_idx` (`vendorID` ASC) VISIBLE,
  CONSTRAINT `FK0038`
    FOREIGN KEY (`vendorID`)
    REFERENCES `villagebayanihan`.`PARKS` (`vendorID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Fk0039`
    FOREIGN KEY (`vendorID`)
    REFERENCES `villagebayanihan`.`ROUTES` (`vendorID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `villagebayanihan`.`PRODUCTS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `villagebayanihan`.`PRODUCTS` ;

CREATE TABLE IF NOT EXISTS `villagebayanihan`.`PRODUCTS` (
  `productID` INT(8) UNSIGNED NOT NULL,
  `product_name` VARCHAR(45) NOT NULL,
  `price` DECIMAL(6,2) UNSIGNED NOT NULL,
  `quantity_in_stock` INT(3) UNSIGNED NOT NULL,
  `date_added` DATE NOT NULL,
  `date_uploaded` DATE NOT NULL,
  `businessID` INT(8) UNSIGNED NOT NULL,
  PRIMARY KEY (`productID`),
  INDEX `FK0041_idx` (`businessID` ASC) VISIBLE,
  CONSTRAINT `FK0041`
    FOREIGN KEY (`businessID`)
    REFERENCES `villagebayanihan`.`BUSINESSES` (`businessID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `villagebayanihan`.`PRODUCT_PICTURES`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `villagebayanihan`.`PRODUCT_PICTURES` ;

CREATE TABLE IF NOT EXISTS `villagebayanihan`.`PRODUCT_PICTURES` (
  `fileID` INT(8) UNSIGNED NOT NULL,
  `filename` VARCHAR(45) NOT NULL,
  `folder` VARCHAR(45) NOT NULL,
  `link` VARCHAR(45) NOT NULL,
  `file_type` INT(2) UNSIGNED NOT NULL,
  `requirement` INT(2) UNSIGNED NOT NULL,
  `date_submitted` DATE NOT NULL,
  `productID` INT(8) UNSIGNED NOT NULL,
  PRIMARY KEY (`fileID`),
  INDEX `Fk0042_idx` (`productID` ASC) VISIBLE,
  CONSTRAINT `Fk0042`
    FOREIGN KEY (`productID`)
    REFERENCES `villagebayanihan`.`PRODUCTS` (`productID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `villagebayanihan`.`ORDERS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `villagebayanihan`.`ORDERS` ;

CREATE TABLE IF NOT EXISTS `villagebayanihan`.`ORDERS` (
  `orderID` INT(8) UNSIGNED NOT NULL,
  `order_date` DATE NOT NULL,
  `payment_type` ENUM('P', 'D') NOT NULL,
  `status` ENUM('D', 'P', 'C') NOT NULL,
  `cancelled_by` ENUM('U', 'S') NULL,
  `cancel_date` DATE NULL,
  `cancel_reason` VARCHAR(45) NULL,
  `location` VARCHAR(45) NOT NULL,
  `remark` VARCHAR(45) NULL,
  `timeliness` INT(1) UNSIGNED NULL,
  `politeness` INT(1) UNSIGNED NULL,
  `cust_satisfaction` INT(1) UNSIGNED NULL,
  `total_rating` INT(1) UNSIGNED NULL,
  `supplier_email` VARCHAR(45) NOT NULL,
  `resident_email` VARCHAR(45) NULL,
  `resegroup_ID` INT(8) UNSIGNED NULL,
  PRIMARY KEY (`orderID`),
  INDEX `FK0043_idx` (`resident_email` ASC) VISIBLE,
  INDEX `FK0044_idx` (`supplier_email` ASC) VISIBLE,
  INDEX `FK0045_idx` (`resegroup_ID` ASC) VISIBLE,
  CONSTRAINT `FK0043`
    FOREIGN KEY (`resident_email`)
    REFERENCES `villagebayanihan`.`RESIDENTS` (`resident_email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK0044`
    FOREIGN KEY (`supplier_email`)
    REFERENCES `villagebayanihan`.`SUPPLIERUSERS` (`supplier_email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK0045`
    FOREIGN KEY (`resegroup_ID`)
    REFERENCES `villagebayanihan`.`RESIDENTGROUPS` (`groupID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `villagebayanihan`.`ORDER_DETAILS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `villagebayanihan`.`ORDER_DETAILS` ;

CREATE TABLE IF NOT EXISTS `villagebayanihan`.`ORDER_DETAILS` (
  `orderID` INT(8) UNSIGNED NOT NULL,
  `quantity_ordered` INT(3) UNSIGNED NOT NULL,
  `price_each` DECIMAL(6,2) UNSIGNED NOT NULL,
  `product_quality` INT(1) UNSIGNED NOT NULL,
  `prodID` INT(8) UNSIGNED NOT NULL,
  PRIMARY KEY (`orderID`),
  INDEX `Fk0047_idx` (`prodID` ASC) VISIBLE,
  CONSTRAINT `FK0046`
    FOREIGN KEY (`orderID`)
    REFERENCES `villagebayanihan`.`ORDERS` (`orderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Fk0047`
    FOREIGN KEY (`prodID`)
    REFERENCES `villagebayanihan`.`PRODUCTS` (`productID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `villagebayanihan`.`PAYMENT_DETAILS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `villagebayanihan`.`PAYMENT_DETAILS` ;

CREATE TABLE IF NOT EXISTS `villagebayanihan`.`PAYMENT_DETAILS` (
  `payment_no` INT(8) UNSIGNED NOT NULL,
  `payment_date` DATE NOT NULL,
  `payment_time` TIME NOT NULL,
  `amount_paid` DECIMAL(6,2) UNSIGNED NOT NULL,
  `penalty` DECIMAL(6,2) UNSIGNED NULL,
  `orderID` INT(8) UNSIGNED NULL,
  PRIMARY KEY (`payment_no`),
  INDEX `FK0048_idx` (`orderID` ASC) VISIBLE,
  CONSTRAINT `FK0048`
    FOREIGN KEY (`orderID`)
    REFERENCES `villagebayanihan`.`ORDERS` (`orderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
