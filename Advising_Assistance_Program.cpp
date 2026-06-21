#include <iostream> 
#include "menu_functions.h"
#include <mysql/jdbc.h>
#include <unordered_map>
#include <memory>
#include <regex>
#include <string>
#include <sstream>
#include <cstdlib>
#include <conio.h>

int main() {
	// Establish the MySQL connection using environment variables.
	const char* host = std::getenv("DB_HOST");
	const char* user = std::getenv("DB_USER");
	const char* pass = std::getenv("DB_PASS");
	const char* db = std::getenv("DB_NAME");

	if (!host || !user || !pass || !db) {
		std::cerr << "ERROR: Environment variables not found." << std::endl;
		return 1;
	}

	std::string connection_url = "tcp://";
	connection_url += host;
	connection_url += ":3306/";
	connection_url += db;

	sql::Driver* driver = nullptr;
	std::shared_ptr<sql::Connection> con = nullptr;

	// Attempt to connect to "students" database.
	try {
		driver = sql::mysql::get_driver_instance();

		con.reset(driver->connect(connection_url, user, pass));
		con->setSchema("students");
	}
	catch (sql::SQLException& e) {
		std::cerr << "ERROR: " << e.what() << std::endl;
	}
	// Create the needed hashtable to store studentRecord structs for querying.
	std::unordered_map<int, studentRecord> studentRecordsTable;

	// Enforce RBAC by setting role to SELECT only priviledges (default_advisor).
	std::unique_ptr<sql::Statement> stmt(con->createStatement());
	stmt->execute("SET ROLE 'default_advisor';");

	// DisplayMenu call handles program loop.
	displayMenu(studentRecordsTable, con);

}
