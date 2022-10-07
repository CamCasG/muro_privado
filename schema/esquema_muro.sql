-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema esquema_muro
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `esquema_muro` ;

-- -----------------------------------------------------
-- Schema esquema_muro
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `esquema_muro` DEFAULT CHARACTER SET utf8 ;
USE `esquema_muro` ;

-- -----------------------------------------------------
-- Table `esquema_muro`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `esquema_muro`.`usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `apellido` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `password` VARCHAR(255) NULL,
  `nacimiento` DATE NULL,
  `genero` VARCHAR(45) NULL,
  `created_at` VARCHAR(45) NULL DEFAULT 'NOW()',
  `updated_at` VARCHAR(45) NULL DEFAULT 'NOW()',
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `esquema_muro`.`mensajes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `esquema_muro`.`mensajes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `mensajes` TEXT NULL,
  `created_at` VARCHAR(45) NULL DEFAULT 'NOW()',
  `updated_at` VARCHAR(45) NULL DEFAULT 'NOW()',
  `enviado_id` INT NOT NULL,
  `recibido_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_mensajes_usuarios_idx` (`enviado_id` ASC) VISIBLE,
  INDEX `fk_mensajes_usuarios1_idx` (`recibido_id` ASC) VISIBLE,
  CONSTRAINT `fk_mensajes_usuarios`
    FOREIGN KEY (`enviado_id`)
    REFERENCES `esquema_muro`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_mensajes_usuarios1`
    FOREIGN KEY (`recibido_id`)
    REFERENCES `esquema_muro`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
