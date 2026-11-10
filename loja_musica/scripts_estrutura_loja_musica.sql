-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema loja_musica
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema loja_musica
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `loja_musica` DEFAULT CHARACTER SET utf8 ;
USE `loja_musica` ;

-- -----------------------------------------------------
-- Table `loja_musica`.`genero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja_musica`.`genero` (
  `id_genero` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NULL,
  PRIMARY KEY (`id_genero`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `loja_musica`.`album`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja_musica`.`album` (
  `id_album` INT NOT NULL AUTO_INCREMENT,
  `artista` VARCHAR(45) NULL,
  `duracao` INT NULL,
  `quantas_musicas` INT NULL,
  `id_genero` INT NOT NULL,
  PRIMARY KEY (`id_album`),
  INDEX `fk_album_genero1_idx` (`id_genero` ASC) VISIBLE,
  CONSTRAINT `fk_album_genero1`
    FOREIGN KEY (`id_genero`)
    REFERENCES `loja_musica`.`genero` (`id_genero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `loja_musica`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja_musica`.`cliente` (
  `id_cliente` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `telefone` VARCHAR(45) NULL,
  `cpf` VARCHAR(45) NULL,
  PRIMARY KEY (`id_cliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `loja_musica`.`venda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja_musica`.`venda` (
  `id_venda` INT NOT NULL AUTO_INCREMENT,
  `valor` DECIMAL(4,2) NULL,
  `data_compra` DATE NULL,
  `id_cliente` INT NOT NULL,
  PRIMARY KEY (`id_venda`),
  INDEX `fk_pagamento_cliente1_idx` (`id_cliente` ASC) VISIBLE,
  CONSTRAINT `fk_pagamento_cliente1`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `loja_musica`.`cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `loja_musica`.`album_venda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja_musica`.`album_venda` (
  `id_album` INT NOT NULL,
  `id_venda` INT NOT NULL,
  PRIMARY KEY (`id_album`, `id_venda`),
  INDEX `fk_album_has_pagamento_pagamento1_idx` (`id_venda` ASC) VISIBLE,
  INDEX `fk_album_has_pagamento_album1_idx` (`id_album` ASC) VISIBLE,
  CONSTRAINT `fk_album_has_pagamento_album1`
    FOREIGN KEY (`id_album`)
    REFERENCES `loja_musica`.`album` (`id_album`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_album_has_pagamento_pagamento1`
    FOREIGN KEY (`id_venda`)
    REFERENCES `loja_musica`.`venda` (`id_venda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
