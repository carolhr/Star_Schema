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
-- Table `mydb`.`Dim_Professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Dim_Professor` (
  `sk_professor` INT NOT NULL AUTO_INCREMENT,
  `idProfessor` INT NOT NULL,
  `Nome_Professor` VARCHAR(100) NOT NULL,
  `Titulacao` VARCHAR(45) NULL,
  PRIMARY KEY (`sk_professor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Dim_Departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Dim_Departamento` (
  `sk_departamento` INT NOT NULL AUTO_INCREMENT,
  `idDepartamento` INT NOT NULL,
  `Nome_Departamento` VARCHAR(45) NOT NULL,
  `Campus` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`sk_departamento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Dim_Disciplina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Dim_Disciplina` (
  `sk_disciplina` INT NOT NULL AUTO_INCREMENT,
  `idDisciplina` INT NOT NULL,
  `Nome_Disciplina` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`sk_disciplina`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Dim_Curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Dim_Curso` (
  `sk_curso` INT NOT NULL AUTO_INCREMENT,
  `idCurso` INT NOT NULL,
  `Nome_Curso` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`sk_curso`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Dim_Tempo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Dim_Tempo` (
  `sk_data` INT NOT NULL,
  `Data_Completa` DATE NOT NULL,
  `Ano` INT NOT NULL,
  `Semestre` INT NOT NULL,
  `Mes` INT NOT NULL,
  `Nome_Mes` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`sk_data`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Fato_Lecionada`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Fato_Lecionada` (
  `Carga_Horaria_Ministrada` INT NOT NULL,
  `Quantidade_Turmas` INT NOT NULL,
  `sk_professor` INT NOT NULL,
  `sk_departamento` INT NOT NULL,
  `sk_disciplina` INT NOT NULL,
  `sk_curso` INT NOT NULL,
  `sk_data` INT NOT NULL,
  PRIMARY KEY (`sk_professor`, `sk_departamento`, `sk_disciplina`, `sk_curso`, `sk_data`),
  INDEX `fk_Fato_Lecionada_Dim_Departamento1_idx` (`sk_departamento` ASC) VISIBLE,
  INDEX `fk_Fato_Lecionada_Dim_Disciplina1_idx` (`sk_disciplina` ASC) VISIBLE,
  INDEX `fk_Fato_Lecionada_Dim_Curso1_idx` (`sk_curso` ASC) VISIBLE,
  INDEX `fk_Fato_Lecionada_Dim_Tempo1_idx` (`sk_data` ASC) VISIBLE,
  CONSTRAINT `fk_Fato_Lecionada_Dim_Professor`
    FOREIGN KEY (`sk_professor`)
    REFERENCES `mydb`.`Dim_Professor` (`sk_professor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Fato_Lecionada_Dim_Departamento1`
    FOREIGN KEY (`sk_departamento`)
    REFERENCES `mydb`.`Dim_Departamento` (`sk_departamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Fato_Lecionada_Dim_Disciplina1`
    FOREIGN KEY (`sk_disciplina`)
    REFERENCES `mydb`.`Dim_Disciplina` (`sk_disciplina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Fato_Lecionada_Dim_Curso1`
    FOREIGN KEY (`sk_curso`)
    REFERENCES `mydb`.`Dim_Curso` (`sk_curso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Fato_Lecionada_Dim_Tempo1`
    FOREIGN KEY (`sk_data`)
    REFERENCES `mydb`.`Dim_Tempo` (`sk_data`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
