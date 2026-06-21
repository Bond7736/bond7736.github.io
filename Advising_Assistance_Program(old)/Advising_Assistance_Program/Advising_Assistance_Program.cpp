#include <iostream> //for input/output
#include <fstream> //for reading data from our files
#include <string>
#include <vector> //ds of choice
#include <algorithm> //for sorting
#include <sstream> //for reading file data into strings

using namespace std;

//Course class definition
class Course {
public:
    string courseNumber;
    string courseTitle;
    vector<string> prerequisites; //declare vector to hold prerequisites if any

    Course(string number, string title, vector<string> prereqs) {
        courseNumber = number;
        courseTitle = title;
        prerequisites = prereqs;
    }
};

vector<Course> courseData; //declare a vector to hold Courses

//Function for menu option 1 (Load file into data structure)
void loadDataStructure(string filename) {
    
    ifstream file;
    string line;
    file.open(filename); 
    if (file.fail()) { //check if opened successfully
        cout << "File failed to open" << endl;
        
    }
    else if (file.is_open()) { //validate if opened successfully
        cout << "Data loaded successfully" << endl;
        cout << "=======================================" << "\n";

    while (getline(file, line)) { //use string stream to read CSV file 
        stringstream ss(line);
        string courseNumber, courseTitle, prereq;
        
        getline(ss, courseNumber, ',');
        getline(ss, courseTitle, ',');

        vector<string> prereqs;
        while (getline(ss, prereq, ',')) {
            prereqs.push_back(prereq);
        }

        Course newCourse(courseNumber, courseTitle, prereqs); //create new Course object taking in the strings read from CSV file
        courseData.push_back(newCourse);
        
    }
    file.close(); //rememeber to close file
    
    }
   
}

//Function for menu option 2 (Alphanumeric printing)
void printCourseList() {
    //uses a sorting algorithm
    sort(courseData.begin(), courseData.end(), [](const Course& a, const Course& b) {
        return a.courseNumber < b.courseNumber;
        });

    cout << "Alphanumeric Course List:" << endl;
    for (const Course& course : courseData) {
        cout << course.courseNumber << ": " << course.courseTitle << endl;
    }
}

//Function for menu option 3 (Print specified course data)
void printCourseInfo(string courseNumber) {
    auto it = find_if(courseData.begin(), courseData.end(), [&](const Course& course) {
        return course.courseNumber == courseNumber;
        });

    if (it != courseData.end()) {
        cout << "Course Details for " << courseNumber << ":" << endl;
        cout << "Title: " << it->courseTitle << endl;
        cout << "Prerequisites: ";

        if (it->prerequisites.empty()) { //if there are no prereqs, print "None"
            cout << "None";
        }
        else {
            for (const string& prereq : it->prerequisites) { //otherwise print prereqs
                cout << prereq << " ";
            }
        }
        cout << endl;
    }
    else {
        cout << "Course not found." << endl; //in the case of an invalid course number
    }
}


int main() {
    while (true) { //Menu display infinitely loops until case 9
        cout << "Advising Assistance Program" << endl;
        cout << "======================================= \n";
        cout << "1. Load File Data \n";
        cout << "2. Print Courses alphanumerically \n";
        cout << "3. Print Course Title and Prerequisites \n";
        cout << "9. Exit application \n";
        cout << "======================================= \n";

        cout << "Enter choice: ";
        int choice = 0;
        cin >> choice;

        switch (choice) {
        case 1: {
            cout << "Enter file name: ";
            string filename;
            cin >> filename;
            loadDataStructure(filename); //pass in the user's input to the function
            break;

        }
        case 2: 
            printCourseList();
            cout << "=======================================" << "\n";
            break;

        
        case 3: {
            cout << "Enter the course number:  ";
            string courseNumber;
            cin >> courseNumber;
            printCourseInfo(courseNumber); //pass in the user's input to the function
            cout << "=======================================" << "\n";
            break;

        }
        case 9: 
            cout << "Thank you for using the Advising Assistance Program, Goodbye." << endl; //exit program
            return 0;

        default: 
            cout << "Invalid option, please try again." << endl; //invalid int
            cout << "=======================================" << "\n";
        
        }
    }
    return 0;
}
