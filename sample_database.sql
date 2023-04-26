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
-- Table `mydb`.`defense`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`defense` ;

CREATE TABLE IF NOT EXISTS `mydb`.`defense` (
  `PLAYID` INT NOT NULL,
  `GAMEID` VARCHAR(45) NULL,
  `GSISGAMEKEY` VARCHAR(45) NULL,
  `GSISPLAYID` INT NULL,
  `BOXPLAYERS` VARCHAR(100) NULL,
  `FIRSTCONTACT` VARCHAR(45) NULL,
  `FORCEDFUMBLE` VARCHAR(45) NULL,
  `FUMBLERECOVERY` VARCHAR(45) NULL,
  `HIT` VARCHAR(45) NULL,
  `HURRY` VARCHAR(45) NULL,
  `INJURED` VARCHAR(45) NULL,
  `INTERCEPTION` VARCHAR(45) NULL,
  `MISSEDTACKLE` VARCHAR(45) NULL,
  `NEGATIVEPFFGRADE` VARCHAR(100) NULL,
  `PASSBREAKUP` VARCHAR(45) NULL,
  `PENALTY` VARCHAR(45) NULL,
  `POSITIVEPFFGRADE` VARCHAR(100) NULL,
  `PRESS` VARCHAR(100) NULL,
  `PRESSUREDETAIL` VARCHAR(45) NULL,
  `PURSUIT` VARCHAR(45) NULL,
  `SACK` VARCHAR(45) NULL,
  `STOP` VARCHAR(45) NULL,
  `TACKLE` VARCHAR(45) NULL,
  `TACKLEASSIST` VARCHAR(45) NULL,
  `TOUCHDOWN` VARCHAR(45) NULL,
  `QUARTER` INT NULL,
  `DOWN` INT NULL,
  `CLOCK` VARCHAR(45) NULL,
  PRIMARY KEY (`PLAYID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`feed`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`feed` ;

CREATE TABLE IF NOT EXISTS `mydb`.`feed` (
  `PLAYID` INT NOT NULL,
  `GAMEID` VARCHAR(45) NULL,
  `GAMEDATE` VARCHAR(45) NULL,
  `GAMESEASON` VARCHAR(45) NULL,
  `WEEK` VARCHAR(45) NULL,
  `defense_PLAYID` INT NOT NULL,
  `DOWN` INT NULL,
  `QUARTER` INT NULL,
  `CLOCK` VARCHAR(45) NULL,
  PRIMARY KEY (`PLAYID`, `defense_PLAYID`),
  INDEX `fk_feed_defense1_idx` (`defense_PLAYID` ASC) VISIBLE,
  CONSTRAINT `fk_feed_defense1`
    FOREIGN KEY (`defense_PLAYID`)
    REFERENCES `mydb`.`defense` (`PLAYID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`offense`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`offense` ;

CREATE TABLE IF NOT EXISTS `mydb`.`offense` (
  `PLAYID` INT NOT NULL,
  `GAMEID` VARCHAR(45) NULL,
  `GSISGAMEKEY` VARCHAR(45) NULL,
  `GSISPLAYID` INT NULL,
  `YARDSAFTERCATCH` INT NULL,
  `YARDSAFTERCONTACT` INT NULL,
  `BALLCARRIER` VARCHAR(45) NULL,
  `BUNCHED` VARCHAR(45) NULL,
  `DROPBACKDEPTH` INT NULL,
  `DROPBACKTYPE` VARCHAR(45) NULL,
  `FORCEDFUMBLE` VARCHAR(45) NULL,
  `FUMBLE` VARCHAR(45) NULL,
  `FUMBLERECOVERY` VARCHAR(45) NULL,
  `INCOMPLETIONTYPE` VARCHAR(45) NULL,
  `INJURED` VARCHAR(45) NULL,
  `INTERCEPTION` VARCHAR(45) NULL,
  `ONLOS` VARCHAR(45) NULL,
  `PASSDEPTH` INT NULL,
  `PASSDIRECTION` VARCHAR(45) NULL,
  `PASSER` VARCHAR(45) NULL,
  `PASSRESULT` VARCHAR(45) NULL,
  `PASSROUTETARDETGROUP` VARCHAR(45) NULL,
  `PASSZONE` VARCHAR(45) NULL,
  `PENALTY` VARCHAR(45) NULL,
  `PUMPFAKE` INT NULL,
  `QB` VARCHAR(45) NULL,
  `QBPRESSUREALLOWED` VARCHAR(45) NULL,
  `RBDIRECTION` VARCHAR(45) NULL,
  `TOUCHDOWN` VARCHAR(45) NULL,
  `NEGATIVEPFFGRADE` VARCHAR(100) NULL,
  `QUARTER` INT NULL,
  `DOWN` INT NULL,
  `CLOCK` VARCHAR(45) NULL,
  `feed_PLAYID` INT NOT NULL,
  PRIMARY KEY (`PLAYID`, `feed_PLAYID`),
  INDEX `fk_offense_feed1_idx` (`feed_PLAYID` ASC) VISIBLE,
  CONSTRAINT `fk_offense_feed1`
    FOREIGN KEY (`feed_PLAYID`)
    REFERENCES `mydb`.`feed` (`PLAYID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`specialteams`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`specialteams` ;

CREATE TABLE IF NOT EXISTS `mydb`.`specialteams` (
  `PLAYID` INT NOT NULL,
  `GAMEID` VARCHAR(45) NULL,
  `GSISGAMEKEY` VARCHAR(45) NULL,
  `GSISPLAYID` INT NULL,
  `KICKYARDS` INT NULL,
  `RETURNYARDS` INT NULL,
  `DOUBLETEAM` VARCHAR(100) NULL,
  `FORCEDFUMBLE` VARCHAR(45) NULL,
  `FUMBLE` VARCHAR(45) NULL,
  `FUMBLERECOVERY` VARCHAR(45) NULL,
  `HANGTIME` DECIMAL(5) NULL,
  `INJURED` VARCHAR(45) NULL,
  `KICKDEPTH` INT NULL,
  `KICKER` VARCHAR(45) NULL,
  `KICKRESULT` VARCHAR(45) NULL,
  `KICKTYPE` VARCHAR(45) NULL,
  `KICKWIDTH` INT NULL,
  `MISSEDTACKLE` VARCHAR(45) NULL,
  `NEGATIVEPFFGRADE` VARCHAR(100) NULL,
  `PENALTY` VARCHAR(45) NULL,
  `POSITIVEPFFGRADE` VARCHAR(100) NULL,
  `RETURNER` VARCHAR(45) NULL,
  `SPECIALTEAMSTYPE` VARCHAR(45) NULL,
  `TACKLE` VARCHAR(45) NULL,
  `TACKLEASSIST` VARCHAR(45) NULL,
  `TOUCHDOWN` VARCHAR(45) NULL,
  `QUARTER` INT NULL,
  `DOWN` INT NULL,
  `CLOCK` VARCHAR(45) NULL,
  `feed_PLAYID` INT NOT NULL,
  `feed_defense_PLAYID` INT NOT NULL,
  PRIMARY KEY (`PLAYID`, `feed_PLAYID`, `feed_defense_PLAYID`),
  INDEX `fk_specialteams_feed1_idx` (`feed_PLAYID` ASC, `feed_defense_PLAYID` ASC) VISIBLE,
  CONSTRAINT `fk_specialteams_feed1`
    FOREIGN KEY (`feed_PLAYID`)
    REFERENCES `mydb`.`feed` (`PLAYID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
