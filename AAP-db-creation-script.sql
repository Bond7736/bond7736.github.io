# DATABASE CREATION FOR: students
# TABLE STRUCTURE FOR: student_data, users
 
-- Remove Safe Update Mode so we can run mass UPDATE on the enrollment_status column
SET SQL_SAFE_UPDATES = 0;

 -- Create the students database
CREATE DATABASE IF NOT EXISTS students;
USE students;

-- Create the users table for the admin account username/password retrieval
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(72)
);
-- To simulate RBAC, we insert a higher privileged account that initiates a role change.
-- Normally, password would be hashed.
INSERT INTO users (username, password) VALUES ('admin', 'password');
-- SELECT * FROM users;

-- Create the student_data table
CREATE TABLE IF NOT EXISTS `student_data` (
  `student_id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `date_of_birth` date NOT NULL,
  `enrollment_status` varchar(20) NOT NULL,
  `grade_point_average` float NOT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (1, 'Frederick', 'Brekke', '1984-08-16', 'Ipsam et dolor.', '2.6');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (2, 'Carson', 'Wunsch', '1999-09-30', 'Blanditiis.', '3.5');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (3, 'Jermain', 'Cummerata', '2000-07-07', 'Est id veniam dicta.', '3.1');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (4, 'Mack', 'Dicki', '2001-04-16', 'Qui recusandae.', '2.8');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (5, 'Eulalia', 'Hane', '1973-08-06', 'Aspernatur quisquam.', '2.1');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (6, 'Sylvan', 'Bartoletti', '2005-03-14', 'Quo magnam modi.', '2.4');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (7, 'Davon', 'Kutch', '1989-04-23', 'Eos amet neque cum.', '3.3');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (8, 'Karen', 'Ullrich', '2003-09-27', 'Quia cupiditate.', '2.1');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (9, 'Lelah', 'Schinner', '1986-05-29', 'Quia non totam.', '1.7');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (10, 'Nyah', 'Koepp', '1977-05-03', 'Voluptatum iusto.', '2.5');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (11, 'Ari', 'Waelchi', '2003-12-28', 'Minima id optio.', '2.3');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (12, 'Gwendolyn', 'Dietrich', '1980-02-23', 'Harum eligendi.', '2.5');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (13, 'Ulices', 'Pfeffer', '2007-09-15', 'Dolor omnis eum.', '2.4');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (14, 'Curt', 'Hagenes', '1996-06-12', 'In voluptas.', '3.1');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (15, 'Helen', 'Wisozk', '1987-10-08', 'Occaecati nisi.', '2.2');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (16, 'Wilford', 'Lubowitz', '1973-10-26', 'Magni consequuntur.', '4');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (17, 'Steve', 'DuBuque', '1983-10-08', 'Aut aut vitae.', '3.6');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (18, 'Bianka', 'Auer', '1979-01-23', 'Possimus minima.', '3.3');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (19, 'Domingo', 'Johns', '1994-10-19', 'Aut amet qui labore.', '2.9');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (20, 'Christophe', 'Homenick', '2006-05-06', 'Aut quaerat.', '2.2');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (21, 'Stanley', 'Huels', '1995-04-21', 'Nemo qui ducimus.', '2.4');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (22, 'Jessy', 'Fisher', '1975-03-15', 'In maiores.', '3.1');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (23, 'Clovis', 'Muller', '1975-01-11', 'Quod eveniet.', '3');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (24, 'Annette', 'Wolf', '1995-04-21', 'Ut quisquam.', '2');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (25, 'Waino', 'Prohaska', '1987-09-12', 'Velit sit enim.', '3.4');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (26, 'Freeman', 'Gleichner', '1986-11-27', 'Delectus et dicta.', '2.2');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (27, 'Orval', 'Effertz', '1982-08-02', 'Necessitatibus.', '3.7');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (28, 'Alexa', 'Homenick', '2007-07-26', 'Quod aliquam ut.', '2.2');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (29, 'Ozella', 'Friesen', '2002-11-24', 'Porro dolor.', '3.3');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (30, 'Mike', 'Schmitt', '1996-06-17', 'Debitis ut fugiat.', '3');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (31, 'Barbara', 'Moore', '1996-02-06', 'Dolores laborum.', '2.7');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (32, 'Dock', 'Feest', '1987-08-07', 'Ad at nesciunt.', '3.1');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (33, 'Araceli', 'Ondricka', '1972-10-20', 'Nemo sint nihil.', '3.6');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (34, 'Rudy', 'Rempel', '1974-02-07', 'Omnis dolor.', '3');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (35, 'Elmer', 'Buckridge', '1996-09-30', 'Molestias labore.', '3.4');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (36, 'Florian', 'Baumbach', '1994-02-22', 'Nam ea soluta ullam.', '2.7');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (37, 'Olen', 'Bahringer', '1981-01-27', 'Consequuntur.', '3.8');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (38, 'Johanna', 'Muller', '1986-02-01', 'Deserunt eos quo.', '1.7');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (39, 'Opal', 'Lindgren', '1973-09-13', 'Sit praesentium.', '2.1');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (40, 'Susan', 'Wehner', '1971-05-08', 'Voluptatem fuga.', '2.5');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (41, 'Abagail', 'Weimann', '2006-11-12', 'Voluptates non et.', '1.7');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (42, 'Lacy', 'Heidenreich', '1983-07-04', 'Perferendis quae.', '1.9');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (43, 'Marquis', 'Purdy', '1990-11-15', 'Officia possimus.', '1.9');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (44, 'Horacio', 'Smith', '1975-01-14', 'Ut non consequatur.', '3.7');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (45, 'Reece', 'Conroy', '1993-10-03', 'Quasi veritatis quo.', '3.3');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (46, 'Duncan', 'Romaguera', '1997-03-08', 'Quo qui est.', '2.9');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (47, 'Leola', 'Stiedemann', '1983-11-22', 'Natus quo assumenda.', '3.5');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (48, 'Jon', 'Boehm', '2004-05-30', 'Adipisci est.', '3.5');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (49, 'Sydnie', 'Ernser', '1970-10-31', 'Eaque in facere in.', '2.6');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (50, 'Juwan', 'Schaefer', '1982-06-20', 'In consequatur.', '2.5');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (51, 'Leopold', 'Purdy', '1980-12-03', 'Officiis quia.', '2.5');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (52, 'June', 'Carroll', '1984-12-16', 'Saepe optio qui.', '3.5');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (53, 'Ena', 'Von', '1989-03-11', 'Ad sed quia ut et.', '1.7');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (54, 'Cristian', 'Mitchell', '2005-02-10', 'Et illum autem.', '2.2');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (55, 'Durward', 'Pacocha', '1978-04-20', 'Sequi reiciendis.', '2.9');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (56, 'Hanna', 'Weber', '1981-01-14', 'Sit molestiae.', '3');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (57, 'Jarrod', 'Raynor', '1996-03-22', 'Aliquid adipisci.', '3.8');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (58, 'Sonya', 'Jakubowski', '1981-06-16', 'Quibusdam natus aut.', '3.6');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (59, 'Kadin', 'Fay', '2006-09-17', 'Natus dolorem qui.', '3.2');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (60, 'Candida', 'Walsh', '2006-01-17', 'Ut sint nihil ex.', '3.8');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (61, 'Robyn', 'Christiansen', '1992-04-28', 'Sed quo omnis.', '2.1');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (62, 'Stefan', 'Corkery', '2005-09-21', 'Repudiandae odit.', '2');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (63, 'Robyn', 'Dach', '1979-10-24', 'Voluptas excepturi.', '2.1');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (64, 'Florida', 'Mayer', '1975-04-23', 'Aut quasi nam aut.', '3.3');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (65, 'Dina', 'Daniel', '2008-04-15', 'Enim omnis amet non.', '3.5');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (66, 'Karianne', 'Wyman', '1980-02-26', 'Optio neque quia.', '2.8');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (67, 'Cora', 'Buckridge', '1997-09-03', 'Qui quisquam quam.', '2.8');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (68, 'Emmanuel', 'Kutch', '2008-04-30', 'Aliquid sit magni.', '3.4');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (69, 'Adelia', 'Yost', '1989-04-16', 'Totam itaque.', '3.3');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (70, 'Dawn', 'Champlin', '1994-02-14', 'Non quo qui rerum.', '1.9');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (71, 'Amina', 'Boyer', '1982-04-27', 'Cupiditate.', '2.3');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (72, 'Jalen', 'Gibson', '1998-03-29', 'Eos asperiores.', '1.8');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (73, 'Patrick', 'Hodkiewicz', '1996-03-10', 'Harum cupiditate.', '2.7');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (74, 'Annabelle', 'Hintz', '1977-05-24', 'Iure aspernatur.', '2.4');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (75, 'Ignatius', 'Will', '1975-12-07', 'Ipsa ut rem ipsa.', '3.4');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (76, 'Jerad', 'Lehner', '1985-05-19', 'Quia numquam aut.', '1.9');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (77, 'Ruth', 'Stanton', '2005-01-23', 'Quod illum adipisci.', '2.1');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (78, 'Kitty', 'O\'Reilly', '2002-03-21', 'Amet esse quidem.', '3.1');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (79, 'Hazel', 'Schaden', '1987-06-19', 'Quo doloribus.', '2.3');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (80, 'Pietro', 'Marquardt', '1970-05-10', 'Distinctio.', '2.4');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (81, 'Simeon', 'Cormier', '1972-11-18', 'Debitis.', '2.5');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (82, 'River', 'Shields', '2004-06-29', 'Consectetur enim.', '1.7');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (83, 'Marlin', 'Leuschke', '1971-04-23', 'Aut voluptatem ea.', '3.4');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (84, 'Asa', 'Bartell', '1997-12-08', 'Quae et dicta nihil.', '1.8');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (85, 'Orland', 'Hyatt', '1995-06-25', 'Voluptatum et harum.', '2.4');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (86, 'Omari', 'Macejkovic', '1988-08-03', 'Et molestiae.', '2.6');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (87, 'Neil', 'Koepp', '1990-03-27', 'Aut eum eum id qui.', '2.9');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (88, 'Cristopher', 'Spencer', '1976-11-06', 'Ipsum perspiciatis.', '3.4');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (89, 'Araceli', 'Spencer', '1986-09-08', 'Nulla tenetur iste.', '3.7');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (90, 'Troy', 'Baumbach', '1981-04-18', 'Veritatis neque qui.', '1.9');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (91, 'Anastasia', 'Quitzon', '2008-03-22', 'Commodi maxime.', '2.2');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (92, 'Herbert', 'Vandervort', '2008-03-20', 'Et quibusdam veniam.', '1.9');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (93, 'Hailie', 'Swaniawski', '1979-07-01', 'Quo sit accusamus.', '2.2');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (94, 'Rachel', 'Cruickshank', '1997-09-04', 'Adipisci ut impedit.', '2.2');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (95, 'Zane', 'Dietrich', '2008-02-18', 'Ullam et quibusdam.', '2.5');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (96, 'Rene', 'Lockman', '1976-04-01', 'Alias accusantium.', '2.3');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (97, 'Deion', 'Hamill', '1994-08-22', 'Sint velit numquam.', '3.1');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (98, 'Alejandra', 'Marks', '1972-04-14', 'Illum et et autem.', '2.8');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (99, 'Roxanne', 'Witting', '1974-05-09', 'Rerum delectus.', '1.8');
INSERT INTO `student_data` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `enrollment_status`, `grade_point_average`) VALUES (100, 'Mathilde', 'Strosin', '1974-12-01', 'Est ad in.', '2');

-- Update the student_data table's enrollment_status column to replace placeholder text
UPDATE student_data 
SET enrollment_status = ELT(FLOOR(1 + RAND() * 3), 'full-time', 'half-time', 'less-than-half-time');
