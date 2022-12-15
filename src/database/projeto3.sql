-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema projeto3
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema projeto3
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `projeto3` DEFAULT CHARACTER SET utf8 ;
USE `projeto3` ;

-- -----------------------------------------------------
-- Table `projeto3`.`Pacientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto3`.`Pacientes` (
  `id_pacientes` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `idade` DATE NOT NULL,
  `atendimento_paciente` INT NOT NULL,
  PRIMARY KEY (`id_pacientes`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `projeto3`.`psicologos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto3`.`psicologos` (
  `id_psicologos` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `senha` VARCHAR(20) NOT NULL,
  `apresentacao` TEXT NULL,
  `atendimento_paciente` INT NOT NULL,
  PRIMARY KEY (`id_psicologos`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `projeto3`.`atendimento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto3`.`atendimento` (
  `data_atendimento` DATE NOT NULL,
  `observacao` TEXT NOT NULL,
  `Pacientes_id_pacientes` INT NOT NULL,
  `psicologos_id_psicologos` INT NOT NULL,
  `id_atendimento` INT NOT NULL,
  UNIQUE INDEX `data_atendimento_UNIQUE` (`data_atendimento` ASC) VISIBLE,
  PRIMARY KEY (`Pacientes_id_pacientes`, `psicologos_id_psicologos`, `id_atendimento`),
  INDEX `fk_atendimento_psicologos1_idx` (`psicologos_id_psicologos` ASC) VISIBLE,
  CONSTRAINT `fk_atendimento_Pacientes`
    FOREIGN KEY (`Pacientes_id_pacientes`)
    REFERENCES `projeto3`.`Pacientes` (`id_pacientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_atendimento_psicologos1`
    FOREIGN KEY (`psicologos_id_psicologos`)
    REFERENCES `projeto3`.`psicologos` (`id_psicologos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
