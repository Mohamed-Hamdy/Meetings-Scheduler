-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema meetingscheduler
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema meetingscheduler
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `meetingscheduler` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `meetingscheduler` ;

-- -----------------------------------------------------
-- Table `meetingscheduler`.`admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `meetingscheduler`.`admin` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NULL DEFAULT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `password` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `meetingscheduler`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `meetingscheduler`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(45) NULL DEFAULT NULL,
  `lastname` VARCHAR(45) NULL DEFAULT NULL,
  `username` VARCHAR(45) NULL DEFAULT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `password` VARCHAR(45) NULL DEFAULT NULL,
  `country` VARCHAR(45) NULL DEFAULT NULL,
  `phone` VARCHAR(45) NULL DEFAULT NULL,
  `Address` VARCHAR(100) NULL DEFAULT NULL,
  `type` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 46
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `meetingscheduler`.`meeting`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `meetingscheduler`.`meeting` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Timezone` VARCHAR(45) NULL DEFAULT NULL,
  `meetingdate` VARCHAR(45) NULL DEFAULT NULL,
  `meetingtime` VARCHAR(45) NULL DEFAULT NULL,
  `meetingrepeat` VARCHAR(45) NULL DEFAULT NULL,
  `meetingdescription` VARCHAR(200) NULL DEFAULT NULL,
  `MeetingAvaliablity` INT NULL DEFAULT NULL,
  `Title` VARCHAR(45) NULL DEFAULT NULL,
  `meetingurl` VARCHAR(200) NULL DEFAULT NULL,
  `Duration` VARCHAR(45) NULL DEFAULT NULL,
  `meetingtype` VARCHAR(45) NULL DEFAULT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_meeting_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_meeting_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `meetingscheduler`.`user` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `meetingscheduler`.`attendee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `meetingscheduler`.`attendee` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `type` VARCHAR(45) NULL DEFAULT NULL,
  `Meeting_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Attendee_Meeting1_idx` (`Meeting_id` ASC) VISIBLE,
  CONSTRAINT `fk_Attendee_Meeting1`
    FOREIGN KEY (`Meeting_id`)
    REFERENCES `meetingscheduler`.`meeting` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `meetingscheduler`.`calender`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `meetingscheduler`.`calender` (
  `idCalender` INT NOT NULL,
  `Meeting_id` INT NOT NULL,
  PRIMARY KEY (`idCalender`),
  INDEX `fk_Calender_Meeting1_idx` (`Meeting_id` ASC) VISIBLE,
  CONSTRAINT `fk_Calender_Meeting1`
    FOREIGN KEY (`Meeting_id`)
    REFERENCES `meetingscheduler`.`meeting` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `meetingscheduler`.`meetingroom`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `meetingscheduler`.`meetingroom` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL DEFAULT NULL,
  `Type` VARCHAR(45) NULL DEFAULT NULL,
  `DurationInMinutes` INT NULL DEFAULT NULL,
  `RoomAvalablity` TINYINT NULL DEFAULT NULL,
  `Meeting_id` INT NOT NULL,
  `Attendee_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_MeetingRoom_Meeting_idx` (`Meeting_id` ASC) VISIBLE,
  INDEX `fk_MeetingRoom_Attendee1_idx` (`Attendee_id` ASC) VISIBLE,
  CONSTRAINT `fk_MeetingRoom_Attendee1`
    FOREIGN KEY (`Attendee_id`)
    REFERENCES `meetingscheduler`.`attendee` (`id`),
  CONSTRAINT `fk_MeetingRoom_Meeting`
    FOREIGN KEY (`Meeting_id`)
    REFERENCES `meetingscheduler`.`meeting` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `meetingscheduler`.`setavailabledays`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `meetingscheduler`.`setavailabledays` (
  `idsetAvailableDays` INT NOT NULL AUTO_INCREMENT,
  `profilemeetingsurl` VARCHAR(200) NULL DEFAULT NULL,
  `Saturday` VARCHAR(45) NULL DEFAULT NULL,
  `Sunday` VARCHAR(45) NULL DEFAULT NULL,
  `Monday` VARCHAR(45) NULL DEFAULT NULL,
  `Tuesday` VARCHAR(45) NULL DEFAULT NULL,
  `Wednesday` VARCHAR(45) NULL DEFAULT NULL,
  `Thursday` VARCHAR(45) NULL DEFAULT NULL,
  `Friday` VARCHAR(45) NULL DEFAULT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`idsetAvailableDays`),
  INDEX `fk_setAvailableDays_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_setAvailableDays_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `meetingscheduler`.`user` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
