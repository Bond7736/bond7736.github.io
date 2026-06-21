#pragma once
#include <iostream>
#include <mysql/jdbc.h>
#include <unordered_map>
#include <memory>
#include <regex>
#include <string>
#include <sstream>

// The studentRecord struct stores attributes that correspond
// to the MySQL student_data table columns. The struct is used 
// in conjunction with the unordered_map "studentRecordsTable".
struct studentRecord {
	int id;
	std::string first_name;
	std::string last_name;
	std::string date_of_birth;
	std::string enrollment_status;
	float grade_point_average;
};

// The isLeapYear function is used in conjunction with the isValidDate function 
// to first calculate if the user's entered birth year is a leap year. The isValidDate
// function uses isLeapYear to validate the user's string based on the boolean returned.
bool isLeapYear(int year);
bool isValidDate(const std::string& dateString);

// The displayMenu function holds a loop housing a switch statement of cases 1-5.
// Each case corresponds to a call to CRUD functions that update the hash table 
// cache and MySQL "students" database.
int displayMenu(std::unordered_map<int, studentRecord>& studentRecordsTable, std::shared_ptr<sql::Connection> con);

// The checkRole function ensures the user has the needed privileges to perform CRUD operations.
bool checkRole(std::shared_ptr<sql::Connection> con);

// The createStudentRecord function corresponds to case 1 of displayMenu.
// It uses a shared connection pointer to ensure memory is handled automatically.
void createStudentRecord(std::shared_ptr<sql::Connection> con);

// The retrieveStudentRecord function corresponds to case 2 of displayMenu.
// It uses a shared connection pointer to ensure memory is handled automatically.
void retrieveStudentRecord(std::unordered_map<int, studentRecord>& studentRecordsTable);

// The alterStudentRecord function corresponds to case 3 of displayMenu.
// It uses a shared connection pointer to ensure memory is handled automatically.
void alterStudentRecord(const std::unordered_map<int, studentRecord>& studentRecordsTable, std::shared_ptr<sql::Connection> con);

// The deleteStudentRecord function corresponds to case 4 of displayMenu.
// It uses a shared connection pointer to ensure memory is handled automatically.
void deleteStudentRecord(std::unordered_map<int, studentRecord>& studentRecordsTable, std::shared_ptr<sql::Connection> con);

// The changePermissions function corresponds to case 5 of displayMenu.
// It uses a shared connection pointer to switch the active MySQL role to admin after authentication.
void changePermissions(std::shared_ptr<sql::Connection> con);