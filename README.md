# README

This README would normally document whatever steps are necessary to get the
application up and running.

Database
CREATE SCHEMA `docdigit` ;

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `docdigit` DEFAULT CHARACTER SET utf8 ;
USE `docdigit` ;

-- -----------------------------------------------------
-- Table `docdigit`.`employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `docdigit`.`employees` (
  `employee_id` SMALLINT(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `employee_name` VARCHAR(20) NOT NULL,
  `employee_surname` VARCHAR(20) NOT NULL,
  `employee_email` VARCHAR(45) NOT NULL,
  `employee_rfc` VARCHAR(13) NOT NULL,
  PRIMARY KEY (`employee_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `docdigit`.`companies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `docdigit`.`companies` (
  `company_id` SMALLINT(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_name` VARCHAR(45) NOT NULL,
  `company_street` VARCHAR(20) NOT NULL,
  `company_col` VARCHAR(20) NOT NULL,
  `company_int` VARCHAR(6) NULL,
  `company_ext` VARCHAR(6) NOT NULL,
  `company_code` VARCHAR(6) NOT NULL,
  `company_city` VARCHAR(20) NOT NULL,
  `company_country` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`company_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `docdigit`.`companies_has_employees`
-- -----------------------------------------------------
CREATE TABLE `companies_has_employees` (
  `Che_id` smallint(3) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` smallint(3) unsigned NOT NULL,
  `company_id` smallint(3) unsigned NOT NULL,
  PRIMARY KEY (`Che_id`),
  KEY `fk_employee_id_company_has_employee_fk_idx` (`employee_id`),
  KEY `fk_company_id_company_has_employee_fk_idx` (`company_id`),
  CONSTRAINT `fk_company_id_company_has_employee_fk` FOREIGN KEY (`company_id`) REFERENCES `companies` (`company_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_employee_id_company_has_employee_fk` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1$$



-- -----------------------------------------------------
-- Table `docdigit`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `docdigit`.`user` (
  `user_id` SMALLINT(3) NOT NULL AUTO_INCREMENT,
  `user_password` VARCHAR(45) NOT NULL,
  `employee_id` SMALLINT(3) UNSIGNED NOT NULL,
  PRIMARY KEY (`user_id`),
  INDEX `fx_employee_id_user_fk_idx` (`employee_id` ASC),
  CONSTRAINT `fx_employee_id_user_fk`
    FOREIGN KEY (`employee_id`)
    REFERENCES `docdigit`.`employees` (`employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
