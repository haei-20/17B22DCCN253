-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema cinemamanagement
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cinemamanagement
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cinemamanagement` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;
USE `cinemamanagement` ;

-- -----------------------------------------------------
-- Table `cinemamanagement`.`tblmember`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cinemamanagement`.`tblmember` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fullname` VARCHAR(255) NOT NULL,
  `username` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `dateofbirth` DATE NOT NULL,
  `address` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `phonenumber` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `cinemamanagement`.`tblemployee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cinemamanagement`.`tblemployee` (
  `tblmember_id` INT NOT NULL,
  `position` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`tblmember_id`),
  INDEX `fk_tblemployee_tblmember1_idx` (`tblmember_id` ASC) VISIBLE,
  CONSTRAINT `fk_tblemployee_tblmember1`
    FOREIGN KEY (`tblmember_id`)
    REFERENCES `cinemamanagement`.`tblmember` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `cinemamanagement`.`tblcashier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cinemamanagement`.`tblcashier` (
  `tblemployee_tblmember_id` INT NOT NULL,
  PRIMARY KEY (`tblemployee_tblmember_id`),
  INDEX `fk_tblcashier_tblemployee1_idx` (`tblemployee_tblmember_id` ASC) VISIBLE,
  CONSTRAINT `fk_tblcashier_tblemployee1`
    FOREIGN KEY (`tblemployee_tblmember_id`)
    REFERENCES `cinemamanagement`.`tblemployee` (`tblmember_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `cinemamanagement`.`tblcustomer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cinemamanagement`.`tblcustomer` (
  `tblmember_id` INT NOT NULL,
  PRIMARY KEY (`tblmember_id`),
  CONSTRAINT `fk_tblcustomer_tblmember1`
    FOREIGN KEY (`tblmember_id`)
    REFERENCES `cinemamanagement`.`tblmember` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `cinemamanagement`.`tblinvoice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cinemamanagement`.`tblinvoice` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `issuedate` DATE NOT NULL,
  `amount` DECIMAL(10,2) NOT NULL,
  `transactionamount` DECIMAL(10,2) NOT NULL,
  `paymentmethod` VARCHAR(255) NOT NULL,
  `tblcustomer_tblmember_id` INT NOT NULL,
  `tblcashier_tblemployee_tblmember_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tblinvoice_tblcustomer1_idx` (`tblcustomer_tblmember_id` ASC) VISIBLE,
  INDEX `fk_tblinvoice_tblcashier1_idx` (`tblcashier_tblemployee_tblmember_id` ASC) VISIBLE,
  CONSTRAINT `fk_tblinvoice_tblcashier1`
    FOREIGN KEY (`tblcashier_tblemployee_tblmember_id`)
    REFERENCES `cinemamanagement`.`tblcashier` (`tblemployee_tblmember_id`),
  CONSTRAINT `fk_tblinvoice_tblcustomer1`
    FOREIGN KEY (`tblcustomer_tblmember_id`)
    REFERENCES `cinemamanagement`.`tblcustomer` (`tblmember_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `cinemamanagement`.`tblmanager`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cinemamanagement`.`tblmanager` (
  `tblemployee_tblmember_id` INT NOT NULL,
  PRIMARY KEY (`tblemployee_tblmember_id`),
  INDEX `fk_tblmanager_tblemployee1_idx` (`tblemployee_tblmember_id` ASC) VISIBLE,
  CONSTRAINT `fk_tblmanager_tblemployee1`
    FOREIGN KEY (`tblemployee_tblmember_id`)
    REFERENCES `cinemamanagement`.`tblemployee` (`tblmember_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `cinemamanagement`.`tblmembershipcard`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cinemamanagement`.`tblmembershipcard` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cardtype` VARCHAR(255) NOT NULL,
  `issuedate` DATE NOT NULL,
  `tblcustomer_tblmember_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tblmembershipcard_tblcustomer1_idx` (`tblcustomer_tblmember_id` ASC) VISIBLE,
  CONSTRAINT `fk_tblmembershipcard_tblcustomer1`
    FOREIGN KEY (`tblcustomer_tblmember_id`)
    REFERENCES `cinemamanagement`.`tblcustomer` (`tblmember_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `cinemamanagement`.`tblmovie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cinemamanagement`.`tblmovie` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `movieTitle` VARCHAR(255) NOT NULL,
  `genre` VARCHAR(100) NOT NULL,
  `duration` INT NOT NULL,
  `countryoforigin` VARCHAR(100) NOT NULL,
  `language` VARCHAR(50) NOT NULL,
  `format` VARCHAR(50) NOT NULL,
  `agerestriction` VARCHAR(50) NOT NULL,
  `synopsis` VARCHAR(50) NOT NULL,
  `director` VARCHAR(100) NOT NULL,
  `cast` VARCHAR(255) NOT NULL,
  `poster` VARCHAR(255) NOT NULL,
  `trailer` VARCHAR(255) NOT NULL,
  `releasedate` DATE NOT NULL,
  `enddate` DATE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `cinemamanagement`.`tblscreeningroom`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cinemamanagement`.`tblscreeningroom` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `roomName` VARCHAR(255) NOT NULL,
  `capacity` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `cinemamanagement`.`tblseat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cinemamanagement`.`tblseat` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `seatname` VARCHAR(10) NOT NULL,
  `rowname` VARCHAR(10) NOT NULL,
  `columnn` VARCHAR(10) NOT NULL,
  `tblScreeningRoomid` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `tblScreeningRoomid` (`tblScreeningRoomid` ASC) VISIBLE,
  CONSTRAINT `tblseat_ibfk_1`
    FOREIGN KEY (`tblScreeningRoomid`)
    REFERENCES `cinemamanagement`.`tblscreeningroom` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `cinemamanagement`.`tblshowtime`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cinemamanagement`.`tblshowtime` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date` DATE NOT NULL,
  `starttime` TIME NOT NULL,
  `endtime` TIME NOT NULL,
  `tblMovieid` INT NOT NULL,
  `tblScreeningRoomid` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `tblMovieid` (`tblMovieid` ASC) VISIBLE,
  INDEX `tblScreeningRoomid` (`tblScreeningRoomid` ASC) VISIBLE,
  CONSTRAINT `tblshowtime_ibfk_1`
    FOREIGN KEY (`tblMovieid`)
    REFERENCES `cinemamanagement`.`tblmovie` (`id`),
  CONSTRAINT `tblshowtime_ibfk_2`
    FOREIGN KEY (`tblScreeningRoomid`)
    REFERENCES `cinemamanagement`.`tblscreeningroom` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `cinemamanagement`.`tblticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cinemamanagement`.`tblticket` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `ticketprice` DECIMAL(10,2) NOT NULL,
  `status` VARCHAR(50) NOT NULL,
  `tblshowtime_id` INT NOT NULL,
  `tblseat_id` INT NOT NULL,
  `tblinvoice_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tblticket_tblshowtime1_idx` (`tblshowtime_id` ASC) VISIBLE,
  INDEX `fk_tblticket_tblseat1_idx` (`tblseat_id` ASC) VISIBLE,
  INDEX `fk_tblticket_tblinvoice1_idx` (`tblinvoice_id` ASC) VISIBLE,
  CONSTRAINT `fk_tblticket_tblinvoice1`
    FOREIGN KEY (`tblinvoice_id`)
    REFERENCES `cinemamanagement`.`tblinvoice` (`id`),
  CONSTRAINT `fk_tblticket_tblseat1`
    FOREIGN KEY (`tblseat_id`)
    REFERENCES `cinemamanagement`.`tblseat` (`id`),
  CONSTRAINT `fk_tblticket_tblshowtime1`
    FOREIGN KEY (`tblshowtime_id`)
    REFERENCES `cinemamanagement`.`tblshowtime` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


-- ==============================
-- 1. tblmember
-- ==============================
INSERT INTO tblmember (fullname, username, password, dateofbirth, address, email, phonenumber) VALUES
('Nguyen Van A', 'vana', '123456', '1999-05-10', 'Ha Noi', 'vana@gmail.com', '0905000001'),
('Tran Thi B', 'thib', '123456', '2000-07-15', 'Da Nang', 'thib@gmail.com', '0905000002'),
('Le Van C', 'vanc', '123456', '1998-12-20', 'HCM City', 'vanc@gmail.com', '0905000003'),
('Pham Thi D', 'thid', '123456', '1999-03-30', 'Hai Phong', 'thid@gmail.com', '0905000004'),
('Do Van E', 'vane', '123456', '1997-09-22', 'Can Tho', 'vane@gmail.com', '0905000005');

-- ==============================
-- 2. tblemployee (member id 1,2,3)
-- ==============================
INSERT INTO tblemployee (tblmember_id, position) VALUES
(1, 'Manager'),
(2, 'Cashier'),
(3, 'Cashier');

-- ==============================
-- 3. tblmanager (employee id 1)
-- ==============================
INSERT INTO tblmanager (tblemployee_tblmember_id) VALUES
(1);

-- ==============================
-- 4. tblcashier (employee id 2,3)
-- ==============================
INSERT INTO tblcashier (tblemployee_tblmember_id) VALUES
(2),
(3);

-- ==============================
-- 5. tblcustomer (member id 3,4,5)
-- ==============================
INSERT INTO tblcustomer (tblmember_id) VALUES
(3),
(4),
(5);

-- ==============================
-- 6. tblmembershipcard
-- ==============================
INSERT INTO tblmembershipcard (cardtype, issuedate, tblcustomer_tblmember_id) VALUES
('Gold', '2024-01-01', 3),
('Silver', '2024-02-10', 4),
('Bronze', '2024-03-05', 5);

-- ==============================
-- 7. tblmovie
-- ==============================
INSERT INTO tblmovie (movieTitle, genre, duration, countryoforigin, language, format, agerestriction, synopsis, director, cast, poster, trailer, releasedate, enddate) VALUES
('Avengers: Endgame', 'Action', 180, 'USA', 'English', '2D', '13+', 'Superhero final battle', 'Russo Brothers', 'Robert Downey Jr, Chris Evans', 'avengers.jpg', 'avengers.mp4', '2024-05-01', '2024-06-15'),
('Dune: Part Two', 'Sci-Fi', 165, 'USA', 'English', '3D', '13+', 'War for Arrakis', 'Denis Villeneuve', 'Timothée Chalamet, Zendaya', 'dune.jpg', 'dune.mp4', '2024-03-01', '2024-04-20'),
('Inside Out 2', 'Animation', 110, 'USA', 'English', '2D', 'P', 'Emotions return', 'Kelsey Mann', 'Amy Poehler, Phyllis Smith', 'insideout2.jpg', 'insideout2.mp4', '2024-06-01', '2024-07-10'),
('Detective Conan: The Million-dollar Pentagram', 'Mystery', 110, 'Japan', 'Japanese', '2D', 'P', 'Conan investigates a secret heist', 'Yuzuru Tachikawa', 'Minami Takayama, Kappei Yamaguchi', 'conan.jpg', 'conan.mp4', '2024-04-15', '2024-05-30'),
('Spirited Away', 'Fantasy', 125, 'Japan', 'Japanese', '2D', 'P', 'A girl trapped in a spirit world', 'Hayao Miyazaki', 'Rumi Hiiragi, Miyu Irino', 'spiritedaway.jpg', 'spiritedaway.mp4', '2001-07-20', '2001-12-31');

-- ==============================
-- 8. tblscreeningroom
-- ==============================
INSERT INTO tblscreeningroom (roomName, capacity) VALUES
('Room A', 50),
('Room B', 60),
('Room C', 40),
('Room D', 70),
('Room E', 80);

-- ==============================
-- 9. tblseat
-- ==============================
INSERT INTO tblseat (seatname, rowname, columnn, tblScreeningRoomid) VALUES
('A1', 'A', '1', 1),
('A2', 'A', '2', 1),
('B1', 'B', '1', 2),
('C1', 'C', '1', 3),
('D1', 'D', '1', 4);

-- ==============================
-- 10. tblshowtime
-- ==============================
INSERT INTO tblshowtime (date, starttime, endtime, tblMovieid, tblScreeningRoomid) VALUES
('2024-05-10', '18:00:00', '20:30:00', 1, 1),
('2024-05-11', '19:00:00', '21:45:00', 2, 2),
('2024-05-12', '16:00:00', '18:00:00', 3, 3),
('2024-05-13', '20:00:00', '22:00:00', 4, 4),
('2024-05-14', '14:00:00', '16:00:00', 5, 5);

-- ==============================
-- 11. tblinvoice
-- ==============================
INSERT INTO tblinvoice (issuedate, amount, transactionamount, paymentmethod, tblcustomer_tblmember_id, tblcashier_tblemployee_tblmember_id) VALUES
('2024-05-10', 200000, 200000, 'Cash', 3, 2),
('2024-05-11', 150000, 150000, 'Card', 4, 2),
('2024-05-12', 180000, 180000, 'Cash', 5, 3),
('2024-05-13', 120000, 120000, 'Online', 4, 2),
('2024-05-14', 160000, 160000, 'Cash', 3, 3);

-- ==============================
-- 12. tblticket
-- ==============================
INSERT INTO tblticket (ticketprice, status, tblshowtime_id, tblseat_id, tblinvoice_id) VALUES
(100000, 'Booked', 1, 1, 1),
(100000, 'Booked', 1, 2, 1),
(75000, 'Booked', 2, 3, 2),
(90000, 'Booked', 3, 4, 3),
(80000, 'Booked', 4, 5, 4);



SET SQL_SAFE_UPDATES = 0;
USE cinemamanagement;

-- Cập nhật tên file poster cho khớp với tên file trong thư mục /images/
UPDATE tblmovie SET poster = 'Avengers_Endgame_poster.jpg' 
WHERE movieTitle = 'Avengers: Endgame';

UPDATE tblmovie SET poster = 'Dune_Part_Two_poster.jpeg' 
WHERE movieTitle = 'Dune: Part Two';

UPDATE tblmovie SET poster = 'Inside_Out_2_poster.jpg' 
WHERE movieTitle = 'Inside Out 2';

UPDATE tblmovie SET poster = 'Detective_Conan_The_Million_Dollar_Pentagram_Poster.jpg' 
WHERE movieTitle = 'Detective Conan: The Million-dollar Pentagram';

UPDATE tblmovie SET poster = 'Spirited_Away_Japanese_poster.png' 
WHERE movieTitle = 'Spirited Away';

-- Ghi chú: Cột 'trailer' có vẻ đang dùng tên file rút gọn (.mp4), 
-- bạn nên kiểm tra lại xem link trailer có phải là file local hay URL YouTube.
-- Nếu là link YouTube, giá trị nên là URL (ví dụ: 'https://youtu.be/...');
-- Nếu là file local, tên file hiện tại (ví dụ: 'avengers.mp4') là hợp lệ.
USE cinemamanagement;

-- 1. Avengers: Endgame
UPDATE tblmovie SET trailer = 'https://www.youtube.com/watch?v=TcMBFSGVi1c'
WHERE movieTitle = 'Avengers: Endgame';

-- 2. Dune: Part Two
UPDATE tblmovie SET trailer = 'https://www.youtube.com/watch?v=Way9Dexny3w'
WHERE movieTitle = 'Dune: Part Two';

-- 3. Inside Out 2
UPDATE tblmovie SET trailer = 'https://www.youtube.com/watch?v=LEjhY15eCx0'
WHERE movieTitle = 'Inside Out 2';

-- 4. Detective Conan: The Million-dollar Pentagram
UPDATE tblmovie SET trailer = 'https://www.youtube.com/watch?v=53bmmVls3Fg'
WHERE movieTitle = 'Detective Conan: The Million-dollar Pentagram';

-- 5. Spirited Away
UPDATE tblmovie SET trailer = 'https://www.youtube.com/watch?v=ByXuk9QqQkk'
WHERE movieTitle = 'Spirited Away';
SET SQL_SAFE_UPDATES = 1;
