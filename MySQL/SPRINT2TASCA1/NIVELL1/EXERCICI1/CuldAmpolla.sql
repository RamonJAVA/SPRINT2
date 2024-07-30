-- MySQL Script generated by MySQL Workbench
-- Tue Jul 30 11:53:11 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema culdampolla
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema culdampolla
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `culdampolla` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `culdampolla` ;

-- -----------------------------------------------------
-- Table `culdampolla`.`adress`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `culdampolla`.`adress` (
  `idAdress` INT NOT NULL,
  `street` VARCHAR(30) NOT NULL,
  `number` VARCHAR(5) NOT NULL,
  `floor` VARCHAR(5) NULL,
  `door` VARCHAR(5) NULL,
  `city` VARCHAR(45) NOT NULL,
  `postal_code` VARCHAR(6) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idAdress`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `culdampolla`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `culdampolla`.`employee` (
  `idEmployee` INT NOT NULL,
  `name` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`idEmployee`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `culdampolla`.`client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `culdampolla`.`client` (
  `idClient` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(20) NOT NULL,
  `adress` INT NOT NULL,
  `phone` VARCHAR(15) NOT NULL,
  `email_adress` VARCHAR(30) NULL DEFAULT NULL,
  `registration_date` VARCHAR(10) NOT NULL,
  `recomended_by` INT NULL DEFAULT NULL,
  `attended_by` INT NOT NULL,
  PRIMARY KEY (`idClient`),
  INDEX `adress_idx` (`adress` ASC) VISIBLE,
  INDEX `recomended_by_idx` (`recomended_by` ASC) VISIBLE,
  INDEX `attended_by_idx` (`attended_by` ASC) VISIBLE,
  CONSTRAINT `adress`
    FOREIGN KEY (`adress`)
    REFERENCES `culdampolla`.`adress` (`idAdress`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `recomended_by`
    FOREIGN KEY (`recomended_by`)
    REFERENCES `culdampolla`.`client` (`idClient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `attended_by`
    FOREIGN KEY (`attended_by`)
    REFERENCES `culdampolla`.`employee` (`idEmployee`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `culdampolla`.`supplier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `culdampolla`.`supplier` (
  `idSupplier` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(60) NOT NULL,
  `adress` VARCHAR(60) NOT NULL,
  `phone` VARCHAR(20) NOT NULL,
  `fax` VARCHAR(20) NULL DEFAULT NULL,
  `nif` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`idSupplier`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `culdampolla`.`brand`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `culdampolla`.`brand` (
  `idBrand` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(20) NOT NULL,
  `boughtFrom` INT NOT NULL,
  PRIMARY KEY (`idBrand`),
  INDEX `boughtFrom_idx` (`boughtFrom` ASC) VISIBLE,
  CONSTRAINT `boughtFrom`
    FOREIGN KEY (`boughtFrom`)
    REFERENCES `culdampolla`.`supplier` (`idSupplier`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `culdampolla`.`glasses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `culdampolla`.`glasses` (
  `idGlasses` INT NOT NULL AUTO_INCREMENT,
  `brand` INT NOT NULL,
  `left_prescription` VARCHAR(10) NOT NULL,
  `right_prescription` VARCHAR(10) NOT NULL,
  `frame_color` VARCHAR(30) NOT NULL,
  `left_lens_color` VARCHAR(30) NOT NULL,
  `right_lens_color` VARCHAR(30) NOT NULL,
  `price` FLOAT NOT NULL,
  PRIMARY KEY (`idGlasses`),
  INDEX `brand_idx` (`brand` ASC) VISIBLE,
  CONSTRAINT `brand`
    FOREIGN KEY (`brand`)
    REFERENCES `culdampolla`.`brand` (`idBrand`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `culdampolla`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `culdampolla`.`order` (
  `idOrder` INT NOT NULL,
  `idClient` INT NOT NULL,
  `idEmployee` INT NOT NULL,
  `idGlasses` INT NOT NULL,
  PRIMARY KEY (`idOrder`),
  INDEX `idClient_idx` (`idClient` ASC) VISIBLE,
  INDEX `idEmployee_idx` (`idEmployee` ASC) VISIBLE,
  INDEX `idGlasses_idx` (`idGlasses` ASC) VISIBLE,
  CONSTRAINT `idClient`
    FOREIGN KEY (`idClient`)
    REFERENCES `culdampolla`.`client` (`idClient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idEmployee`
    FOREIGN KEY (`idEmployee`)
    REFERENCES `culdampolla`.`employee` (`idEmployee`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idGlasses`
    FOREIGN KEY (`idGlasses`)
    REFERENCES `culdampolla`.`glasses` (`idGlasses`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
