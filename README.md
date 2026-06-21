# Enhanced Advising_Assistance_Program Description

This project is a CRUD application that connects to a local database using given MySQL scripts. It allows for creating student records, retrieving records by ID, updating by ID, and deleting by ID. It demonstrates role-based access control between default/admin roles and Transparent Data Encryption. Additionally it uses a hash-table to enact write-through caching with the local database.

---

## Requirements and Setup

---

### Requirements:
- Windows 11 OS
- MySQL Server 8.0 or later
- MySQL Workbench 8.0 or later
- MySQL Connector C++ 9.7 or later

### Setup:

1. Open and run 'AAP-db-creation-script' in MySQL Workbench
2. Begin configuring the TDE files. Create a 'Keyring' directory in the 'ProgramData/MySQL' path.
3. Restrict permissions to grant full control to 'NETWORK SERVICES'
4. Place the 'mysqld.my' manifest file in the 'ProgramFiles/MySQL/MySQL Server 8.0/bin' path; Restrict permissions to 'Read' and 'Read & Execute' to 'NETWORK SERVICES'
5. Place the 'component_keyring_file.cnf' file in the 'ProgramFiles/MySQL/MySQL Server 8.0/lib/plugin' path; Restrict permissions to 'Read' and 'Read & Execute' to 'NETWORK SERVICES'
6. Open MySQL Workbench and run 'studentScript' to initialize roles and enable TDE
7. Open 'SystemPropertiesAdvanced' and add the following to either 'User variables' or 'System variables': DB_HOST, localhost / DB_NAME, students / DB_PASS, vydbom_@12 / DB_USER, advisor_user
8. Run Advising_Assistance_Program.exe from 'Advising_Assistance_Program/x64/Release/Advising_Assistance_Program.exe' path
