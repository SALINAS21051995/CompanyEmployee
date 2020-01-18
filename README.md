# README

yarn version 1.21.1

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

delimiter $$

CREATE TABLE `accounts` (
  `account_id` smallint(3) unsigned NOT NULL AUTO_INCREMENT,
  `account_password` varchar(45) NOT NULL,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$

delimiter $$

CREATE TABLE `branches` (
  `branch_id` smallint(3) unsigned NOT NULL AUTO_INCREMENT,
  `branch_name` varchar(45) NOT NULL,
  `branch_street` varchar(20) NOT NULL,
  `branch_col` varchar(20) NOT NULL,
  `branch_int` varchar(6) DEFAULT NULL,
  `branch_ext` varchar(6) NOT NULL,
  `branch_code` varchar(6) NOT NULL,
  `branch_city` varchar(20) NOT NULL,
  `branch_country` varchar(20) NOT NULL,
  PRIMARY KEY (`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$

delimiter $$

CREATE TABLE `companies` (
  `company_id` smallint(3) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(45) NOT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$

delimiter $$

CREATE TABLE `employees` (
  `employee_id` smallint(3) unsigned NOT NULL AUTO_INCREMENT,
  `employee_name` varchar(20) NOT NULL,
  `employee_surname` varchar(20) NOT NULL,
  `employee_email` varchar(45) NOT NULL,
  `employee_rfc` varchar(13) NOT NULL,
  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$


delimiter $$

CREATE TABLE `managers` (
  `manager_id` smallint(3) unsigned NOT NULL AUTO_INCREMENT,
  `manager_name` varchar(25) NOT NULL,
  `manager_surname` varchar(25) NOT NULL,
  `manager_rfc` varchar(13) NOT NULL,
  `manager_email` varchar(30) NOT NULL,
  PRIMARY KEY (`manager_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$

delimiter $$

CREATE TABLE `branches_has_employees` (
  `Che_id` smallint(3) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` smallint(3) unsigned NOT NULL,
  `branch_id` smallint(3) unsigned NOT NULL,
  PRIMARY KEY (`Che_id`),
  KEY `fk_employee_id_company_has_employee_fk_idx` (`employee_id`),
  KEY `fk_company_id_company_has_employee_fk_idx` (`branch_id`),
  CONSTRAINT `fk_branch_id_branch_has_employee_ifk` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`branch_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_employee_id_company_has_employee_fk` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$

delimiter $$

CREATE TABLE `company_has_branch` (
  `Chb_id` smallint(3) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` smallint(3) NOT NULL,
  `branch_id` smallint(3) unsigned NOT NULL,
  PRIMARY KEY (`Chb_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$

delimiter $$

CREATE TABLE `company_has_manager` (
  `Chm_id` smallint(3) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` smallint(3) NOT NULL,
  `manager_id` smallint(3) unsigned NOT NULL,
  PRIMARY KEY (`Chm_id`),
  KEY `fk_manager_id_company_has_manager_fk_idx` (`manager_id`),
  KEY `fk_company_id_company_has_manager_fk_idx` (`company_id`),
  CONSTRAINT `fk_company_id_company_has_manager_fk` FOREIGN KEY (`company_id`) REFERENCES `companies` (`company_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_manager_id_company_has_manager_fk` FOREIGN KEY (`manager_id`) REFERENCES `managers` (`manager_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$

delimiter $$

CREATE TABLE `manager_has_account` (
  `Mha_id` smallint(3) unsigned NOT NULL AUTO_INCREMENT,
  `manager_id` smallint(3) unsigned NOT NULL,
  `account_id` smallint(3) unsigned NOT NULL,
  PRIMARY KEY (`Mha_id`),
  KEY `fk_manager_id_manager_has_account_fk_idx` (`manager_id`),
  KEY `fk_account_id_manager_has_account_fk_idx` (`account_id`),
  CONSTRAINT `fk_account_id_manager_has_account_fk` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_manager_id_manager_has_account_fk` FOREIGN KEY (`manager_id`) REFERENCES `managers` (`manager_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$




drop querys
DELETE from docdigit.branches_has_employees;
DELETE FROM docdigit.company_has_branch;
DELETE from docdigit.company_has_manager;
DELETE from docdigit.manager_has_account
DELETE from docdigit.accounts;
DELETE from docdigit.branches;
DELETE from docdigit.companies;
DELETE from docdigit.employees;
DELETE from docdigit.managers;