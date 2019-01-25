-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Gene`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Gene` (
  `Gene_id` INT NOT NULL,
  `gene_name` VARCHAR(45) NULL,
  `description` VARCHAR(200) NULL,
  `chromosome` VARCHAR(2) NULL,
  `start_position` INT NULL,
  `stop_position` VARCHAR(45) NULL,
  PRIMARY KEY (`Gene_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Syndrome`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Syndrome` (
  `Syndrome_id` INT NOT NULL,
  `syndrome` VARCHAR(50) NULL,
  `description` VARCHAR(200) NULL,
  `gene` INT NULL,
  PRIMARY KEY (`Syndrome_id`),
  INDEX `fk_Syndrome_1_idx` (`gene` ASC) VISIBLE,
  CONSTRAINT `fk_Syndrome_1`
    FOREIGN KEY (`gene`)
    REFERENCES `mydb`.`Gene` (`Gene_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Patients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Patients` (
  `Patients_id` INT NOT NULL,
  `name` VARCHAR(100) NULL,
  `age` INT NULL,
  `syndrome` INT NULL,
  PRIMARY KEY (`Patients_id`),
  INDEX `fk_Patients_1_idx` (`syndrome` ASC) VISIBLE,
  CONSTRAINT `fk_Patients_1`
    FOREIGN KEY (`syndrome`)
    REFERENCES `mydb`.`Syndrome` (`Syndrome_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
