# USER CREATION: 'advisor_user'@'localhost'/'vydbom_@12'
# ROLE CREATION: 'default_advisor', 'admin'

-- Create our session user, password, and permissions
CREATE USER 'advisor_user'@'localhost' IDENTIFIED BY 'vydbom_@12';

-- Create a READ only role, and an all privileges role
CREATE ROLE 'default_advisor', 'admin';

-- Grant READ privileges to default_advisor (only needs to read cache)
-- Grant ALL privileges to admin
GRANT SELECT ON students.* TO 'default_advisor';
GRANT SELECT, INSERT, UPDATE, DELETE ON students.* TO 'admin';

-- Grant the role to the user
GRANT 'default_advisor' TO 'advisor_user'@'localhost';
GRANT 'admin' TO 'advisor_user'@'localhost';
SHOW GRANTS FOR 'advisor_user'@'localhost';

-- Activate the default role permission
SET DEFAULT ROLE 'default_advisor' TO 'advisor_user'@'localhost';

-- Modify the student_id column to auto increment so there are no repeating student IDs
ALTER TABLE student_data
MODIFY COLUMN student_id INT NOT NULL AUTO_INCREMENT;

-- To check that TDE status is Active
SELECT * FROM performance_schema.keyring_component_status;
ALTER TABLE student_data ENCRYPTION='Y';
SHOW CREATE TABLE student_data;

-- To view student_data table
SELECT * FROM student_data;
