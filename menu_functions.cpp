#include <iostream>
#include "menu_functions.h"
#include <mysql/jdbc.h>
#include <unordered_map>
#include <memory>
#include <regex>
#include <string>
#include <sstream>
#include <conio.h>

bool isLeapYear(int year) {
	return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);

}
bool isValidDate(const std::string& dateString) {
	// Create the DATE pattern needed for MySQL "date_of_birth" column.
	std::regex datePattern(R"(^(\d{4})-(\d{2})-(\d{2})$)");
	std::smatch match;

	if (!std::regex_match(dateString, match, datePattern)) {
		return false;
	}

	// Use stoi function to convert the string matches into integers for valid date comparison.
	int year = stoi(match[1].str());
	int month = stoi(match[2].str());
	int day = stoi(match[3].str());

	// Conditions for a valid date:
	if (month < 1 || month > 12) return false;
	if (day < 1 || day > 31) return false;

	if (month == 4 && day > 30 || month == 6 && day > 30 || month == 9 && day > 30 || month == 11 && day > 30) {
		return false;
	}

	if (month == 2) {
		if (isLeapYear(year)) {
			if (day > 29) return false;
		}
		else {
			if (day > 28) return false;
		}
	}

	return true;
}
// Ensure the 'admin' role is enabled.
bool checkRole(std::shared_ptr<sql::Connection> con) {
	std::unique_ptr<sql::PreparedStatement> pstmt(con->prepareStatement("SELECT CURRENT_ROLE()"));

	if (std::unique_ptr<sql::ResultSet> res(pstmt->executeQuery()); res->next()) {
		std::string currentRole = res->getString(1);

		if (currentRole.find("admin") != std::string::npos) { // Account for the role name and hostname.
			std::cout << "Access granted. " << std::endl;
			std::cout << "======================================= \n";
			return true;
			}
	}
			std::cout << "Insufficient privileges. Please use 'Change Permissions' to access this operation. " << std::endl;
			std::cout << "======================================= \n";
			return false;
};

void createStudentRecord(std::shared_ptr<sql::Connection> con) {
	// Check privileges
	if (!(checkRole(con))) {

		return;
	}
	std::string first_name;
	std::string last_name;
	std::string date_of_birth;
	std::string enrollment_status;
	float grade_point_average;

	std::cout << "Please enter the student's first name: " << std::endl;
	std::cout << "======================================= \n";
	while (!(std::cin >> first_name) || first_name.length() > 100) {
		std::cin.clear();
		std::cin.ignore(10000, '\n');
		std::cout << "Invalid first name, please try again." << "\n";
		std::cout << "======================================= \n";
	}
	std::cout << "Please enter the student's last name: " << std::endl;
	std::cout << "======================================= \n";
	while (!(std::cin >> last_name) || last_name.length() > 100) {
		std::cin.clear();
		std::cin.ignore(10000, '\n');
		std::cout << "Invalid last name, please try again." << "\n";
		std::cout << "======================================= \n";
	}
	std::cout << "Please enter the student's date of birth (YYYY-MM-DD): " << std::endl;
	std::cout << "======================================= \n";
	while (!(std::cin >> date_of_birth) || !(isValidDate(date_of_birth))) {
		std::cin.clear();
		std::cin.ignore(10000, '\n');
		std::cout << "Invalid date of birth, please try again." << "\n";
		std::cout << "======================================= \n";
	}
	std::cout << "Please enter the student's enrollment status (full-time, half-time, or less-than-half-time): " << std::endl;
	std::cout << "======================================= \n";
	while (!(std::cin >> enrollment_status) || enrollment_status.length() > 20
		|| enrollment_status != "full-time" && enrollment_status != "half-time" && enrollment_status != "less-than-half-time") {
		std::cin.clear();
		std::cin.ignore(10000, '\n');
		std::cout << "Invalid enrollment status, please try again." << "\n";
		std::cout << "======================================= \n";

	}
	std::cout << "Please enter the student's grade point average: " << std::endl;
	std::cout << "======================================= \n";
	while (!(std::cin >> grade_point_average) || grade_point_average > 4.0) {
		std::cin.clear();
		std::cin.ignore(10000, '\n');
		std::cout << "Invalid grade point average, please try again." << "\n";
		std::cout << "======================================= \n";
	}

	// Try to insert validated data into "student_data" table. If success, update hash, otherwise neither.
	try {
		// Omit the primary key student_id, column set to AUTO INCREMENT.
		std::unique_ptr<sql::PreparedStatement> pstmt(con->prepareStatement(
			"INSERT INTO student_data (first_name, last_name, date_of_birth, enrollment_status, grade_point_average) VALUES (?, ?, ?, ?, ?)"
		));

		// Bind each variable to placeholder positions
		pstmt->setString(1, first_name);
		pstmt->setString(2, last_name);
		pstmt->setString(3, date_of_birth);
		pstmt->setString(4, enrollment_status);
		pstmt->setDouble(5, grade_point_average);

		pstmt->executeUpdate();
		std::cout << "Student entry added sucessfully." << std::endl;
	}

	catch (sql::SQLException& e) {
		std::cerr << "ERROR: " << e.what() << std::endl;

	}
};
void retrieveStudentRecord(std::unordered_map<int, studentRecord>& studentRecordsTable) {
	std::cout << "Please enter the student ID: " << std::endl;
	int studentIdChoice;
	while (!(std::cin >> studentIdChoice) || !studentRecordsTable.contains(studentIdChoice)) {
		std::cin.clear();
		std::cin.ignore(10000, '\n');
		std::cout << "Student ID not found, please try again." << "\n";
		std::cout << "======================================= \n";

	}
	// Fetch and display record
	auto it = studentRecordsTable.find(studentIdChoice);
	if (it != studentRecordsTable.end()) {
		std::cout << "Student Record Data: " << it->second.first_name << " | " << it->second.last_name << " | "
			<< it->second.date_of_birth << " | " << it->second.enrollment_status << " | " << it->second.grade_point_average << std::endl;
	}

};
void alterStudentRecord(const std::unordered_map<int, studentRecord>& studentRecordsTable, std::shared_ptr<sql::Connection> con) {
	// Check privileges
	if (!(checkRole(con))) {

		return;
	}
	int id;
	std::string first_name;
	std::string last_name;
	std::string date_of_birth;
	std::string enrollment_status;
	float grade_point_average;

	std::cout << "Please enter the student ID of the record you'd like to change: " << std::endl;
	std::cout << "======================================= \n";
	// Validate that the requested ID exists
	while (!(std::cin >> id) || !studentRecordsTable.contains(id)) {
		std::cin.clear();
		std::cin.ignore(10000, '\n');
		std::cout << "Student ID not found, please try again." << "\n";
		std::cout << "======================================= \n";
	}
	std::cout << "Student ID retrieval successful. " << std::endl;
	std::cout << "======================================= \n";

	std::cout << "Please enter the student's first name: " << std::endl;
	std::cout << "======================================= \n";
	while (!(std::cin >> first_name) || first_name.length() > 100) {
		std::cin.clear();
		std::cin.ignore(10000, '\n');
		std::cout << "Invalid first name, please try again." << "\n";
		std::cout << "======================================= \n";
	}
	std::cout << "Please enter the student's last name: " << std::endl;
	std::cout << "======================================= \n";
	while (!(std::cin >> last_name) || last_name.length() > 100) {
		std::cin.clear();
		std::cin.ignore(10000, '\n');
		std::cout << "Invalid last name, please try again." << "\n";
		std::cout << "======================================= \n";
	}
	std::cout << "Please enter the student's date of birth (YYYY-MM-DD): " << std::endl;
	std::cout << "======================================= \n";
	while (!(std::cin >> date_of_birth) || !(isValidDate(date_of_birth))) {
		std::cin.clear();
		std::cin.ignore(10000, '\n');
		std::cout << "Invalid date of birth, please try again." << "\n";
		std::cout << "======================================= \n";
	}
	std::cout << "Please enter the student's enrollment status (full-time, half-time, or less-than-half-time): " << std::endl;
	std::cout << "======================================= \n";
	while (!(std::cin >> enrollment_status) || enrollment_status.length() > 20
		|| enrollment_status != "full-time" && enrollment_status != "half-time" && enrollment_status != "less-than-half-time") {
		std::cin.clear();
		std::cin.ignore(10000, '\n');
		std::cout << "Invalid enrollment status, please try again." << "\n";
		std::cout << "======================================= \n";

	}
	std::cout << "Please enter the student's grade point average: " << std::endl;
	std::cout << "======================================= \n";
	while (!(std::cin >> grade_point_average) || grade_point_average > 4.0) {
		std::cin.clear();
		std::cin.ignore(10000, '\n');
		std::cout << "Invalid grade point average, please try again." << "\n";
		std::cout << "======================================= \n";
	}

	try {
		// Try to update validated student record ID into "student_data" table. If success, update hash, otherwise neither.
		std::unique_ptr<sql::PreparedStatement> pstmt(con->prepareStatement(
			"UPDATE student_data SET first_name = ?, last_name = ?, date_of_birth = ?, enrollment_status = ?, grade_point_average = ? WHERE student_id = ?"
		));

		// Bind each variable to placeholder positions
		pstmt->setString(1, first_name);
		pstmt->setString(2, last_name);
		pstmt->setString(3, date_of_birth);
		pstmt->setString(4, enrollment_status);
		pstmt->setDouble(5, grade_point_average);
		pstmt->setInt(6, id);

		pstmt->executeUpdate();
		std::cout << "Student entry updated sucessfully." << std::endl;
	}

	catch (sql::SQLException& e) {
		std::cerr << "ERROR: " << e.what() << std::endl;

	}
};
void deleteStudentRecord(std::unordered_map<int, studentRecord>& studentRecordsTable, std::shared_ptr<sql::Connection> con) {
	// Check privileges
	if (!(checkRole(con))) {

		return;
	}
	int id;
	std::cout << "Please enter the student ID of the record you'd like to delete: " << std::endl;
	std::cout << "======================================= \n";
	// Validate that the student ID exists
	while (!(std::cin >> id) || !studentRecordsTable.contains(id)) {
		std::cin.clear();
		std::cin.ignore(10000, '\n');
		std::cout << "Student ID not found, please try again." << "\n";
		std::cout << "======================================= \n";
	}
	// Try to delete validated student record ID from "student_data" table. If success, update hash, otherwise neither.
	try {
		std::unique_ptr<sql::PreparedStatement> pstmt(con->prepareStatement(
			"DELETE FROM student_data WHERE student_id = ?"
		));
		// Bind the variable to placeholder position
		pstmt->setInt(1, id);
		pstmt->executeUpdate();
		std::cout << "Student record deleted sucessfully." << std::endl;
	}

	catch (sql::SQLException& e) {
		std::cerr << "ERROR: " << e.what() << std::endl;

	}

	studentRecordsTable.erase(id);
};
void changePermissions(std::shared_ptr<sql::Connection> con) {
	std::string accountUsername;
	std::string accountPassword;

	// To mimic role-based access control, only a username of 'admin' is allowed.
	do {
		std::cout << "Please enter the account username: " << std::endl;
		std::cout << "======================================= \n";
		std::cin >> accountUsername;

		if (accountUsername.length() > 50) {
			std::cin.clear();
			std::cin.ignore(10000, '\n');
			std::cout << "Invalid username: Username must be under 50 characters." << "\n";
			std::cout << "======================================= \n";
		}
	} while (accountUsername.length() > 50 );

	do {
		std::cout << "Please enter the account password: " << std::endl;
		std::cout << "======================================= \n";

		// Logic for concealing password input.
		char ch;
		while ((ch = _getch()) != 13) {
			if (ch == '\b') {
				if (!accountPassword.empty()) {
					std::cout << "\b \b";
					accountPassword.pop_back();
				}
			}
			else {
				accountPassword += ch;
				std::cout << '*';
			}
		}
		std::cout << std::endl;
		
		if (accountPassword.length() > 72) {
			std::cin.clear();
			std::cin.ignore(10000, '\n');
			std::cout << "Invalid password: Password must be under 72 characters." << std::endl;
			std::cout << "======================================= \n";
		}


	} while (accountPassword.length() > 72); // Validate password constraint

	try {
		std::unique_ptr<sql::PreparedStatement> pstmt(con->prepareStatement(
			"SELECT COUNT(*) FROM users WHERE username = ? AND password = ?")
		);

		// Bind each variable to placeholder positions
		pstmt->setString(1, accountUsername);
		pstmt->setString(2, accountPassword);

		std::unique_ptr<sql::ResultSet> res(pstmt->executeQuery());
		if (res->next()) {
			int count = res->getInt(1);
			if (count > 0) {
				std::cout << "Authentication complete. Access granted." << std::endl;
				std::unique_ptr<sql::Statement> stmt(con->createStatement());
				stmt->execute("SET ROLE 'admin';");
			}
			else {
				std::cout << "No match found. Access denied." << std::endl;
			}
		}
	}

		catch (sql::SQLException& e) {
			std::cerr << "ERROR: " << e.what() << std::endl;

		}

	};
int displayMenu(std::unordered_map<int, studentRecord>& studentRecordsTable, std::shared_ptr<sql::Connection> con) {
	while (true) {

		// Verify the hashtable was initialized
		if (studentRecordsTable.empty()) {
			std::cout << "Student records initialized successfully." << std::endl;
		}

		try {
			// Create statement to read user data, then populate the hashtable with records.
			std::unique_ptr <sql::Statement> stmt(con->createStatement());
			std::unique_ptr<sql::ResultSet> res(stmt->executeQuery("SELECT student_id, first_name, last_name, date_of_birth, enrollment_status, grade_point_average FROM student_data"));

			while (res->next()) {
				studentRecord record;
				record.id = res->getInt("student_id");
				record.first_name = res->getString("first_name").asStdString();
				record.last_name = res->getString("last_name").asStdString();;
				record.date_of_birth = res->getString("date_of_birth").asStdString();;
				record.enrollment_status = res->getString("enrollment_status").asStdString();;
				record.grade_point_average = res->getDouble("grade_point_average");

				studentRecordsTable[record.id] = record;
			}
		}
		catch (sql::SQLException& e) {
			std::cerr << "ERROR: " << e.what() << std::endl;

		}

		std::cout << "Welcome to the Advising Assistance Program." << std::endl;
		std::cout << "What would you like to do?" << std::endl;
		std::cout << "======================================= \n";
		std::cout << "1. Create student record \n";
		std::cout << "2. Retrieve student record \n";
		std::cout << "3. Alter student record \n";
		std::cout << "4. Delete student record \n";
		std::cout << "5. Change account permissions \n";
		std::cout << "6. Exit application \n";
		std::cout << "======================================= \n";

		// Loop the menu until user enters case 8.
		int choice;
		while (!(std::cin >> choice) || choice < 1 || choice > 6) {
			std::cin.clear();
			std::cin.ignore(10000, '\n');
			std::cout << "Invalid option, please try again." << "\n";
			std::cout << "======================================= \n";

		}

		switch (choice) {
		case 1: {
			createStudentRecord(con);
			std::cout << "=======================================" << "\n";
			break;

		}
		case 2: {
			retrieveStudentRecord(studentRecordsTable);
			std::cout << "=======================================" << "\n";
			break;

		}
		case 3: {
			alterStudentRecord(studentRecordsTable, con);
			std::cout << "=======================================" << "\n";
			break;

		}
		case 4: {
			deleteStudentRecord(studentRecordsTable, con);
			std::cout << "=======================================" << "\n";
			break;

		}
		case 5: {
			changePermissions(con);
			std::cout << "=======================================" << "\n";
			break;


		}
		case 6: {
			std::cout << "Thank you for using the Advising Assistance Program, Goodbye." << std::endl;
			return 0;

		}
		default: {
			std::cout << "Invalid option, please try again." << "\n" << std::endl;
			std::cout << "=======================================" << "\n";
		}
		}
	}

}
