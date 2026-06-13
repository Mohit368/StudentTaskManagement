# Student Task Management System

## Overview

The Student Task Management System is a web-based application developed to help students efficiently manage their academic tasks and assignments. The system allows students to register, log in securely, create tasks, monitor pending and completed tasks, and manage their daily academic activities through an interactive dashboard.

This project demonstrates the implementation of Java Web Technologies, including JSP, Servlets, JDBC, MySQL, Bootstrap, and Apache Tomcat.

---

## Features

### User Management

* Student Registration
* Secure Login Authentication
* Session Management
* Logout Functionality

### Task Management

* Add New Tasks
* View All Tasks
* Mark Tasks as Completed
* Delete Tasks
* Task Priority Management (High, Medium, Low)

### Dashboard Analytics

* Total Tasks Count
* Pending Tasks Count
* Completed Tasks Count
* High Priority Tasks Count

### Database Integration

* MySQL Database Connectivity
* JDBC-based Data Access
* CRUD Operations

---

## Technologies Used

### Frontend

* HTML5
* CSS3
* Bootstrap 5
* JavaScript
* JSP (Java Server Pages)

### Backend

* Java
* Java Servlets
* JDBC

### Database

* MySQL

### Server

* Apache Tomcat 10

### Development Tools

* Visual Studio Code
* MySQL Workbench
* Git & GitHub

---

## System Architecture

The application follows the MVC (Model-View-Controller) architecture.

### Model Layer

* Student.java
* Task.java

### Controller Layer

* RegisterServlet
* LoginServlet
* AddTaskServlet
* ViewTaskServlet
* CompleteTaskServlet
* DeleteTaskServlet
* LogoutServlet

### Data Access Layer

* StudentDAO
* TaskDAO
* DBConnection

### View Layer

* register.jsp
* login.jsp
* dashboard.jsp
* add-task.jsp
* view-tasks.jsp

---

## Project Modules

### Module 1: Student Registration

Allows new students to create an account using their name, email, and password.

### Module 2: Student Login

Authenticates registered users and creates a secure session.

### Module 3: Dashboard

Displays task statistics and quick action buttons.

### Module 4: Add Task

Allows students to create and store academic tasks.

### Module 5: View Tasks

Displays all tasks associated with the logged-in student.

### Module 6: Complete Task

Updates task status from Pending to Completed.

### Module 7: Delete Task

Removes unwanted tasks from the system.

### Module 8: Logout

Terminates the active session securely.

---

## Database Schema

### Database Name

```sql
student_task_db
```

### Students Table

```sql
CREATE TABLE students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(100)
);
```

### Tasks Table

```sql
CREATE TABLE tasks (
    id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    title VARCHAR(100),
    description TEXT,
    due_date DATE,
    priority VARCHAR(20),
    status VARCHAR(20) DEFAULT 'Pending',
    FOREIGN KEY (student_id) REFERENCES students(id)
);
```

---

## Screenshots

### Registration Page

<img width="813" height="649" alt="image" src="https://github.com/user-attachments/assets/83167de7-2731-4278-b49a-42126c38129a" />


### Login Page

<img width="750" height="533" alt="image" src="https://github.com/user-attachments/assets/e41d4169-0529-4beb-b084-c8927391c031" />


### Dashboard

<img width="1882" height="611" alt="image" src="https://github.com/user-attachments/assets/79cdd5aa-82a1-4eb8-a4c5-a66f0c7479f8" />


### Add Task Page

<img width="939" height="728" alt="image" src="https://github.com/user-attachments/assets/04197754-7931-43fd-b791-cabfaea2fa28" />


### View Tasks Page

<img width="1848" height="383" alt="image" src="https://github.com/user-attachments/assets/f065aa52-548c-444b-afe5-308a1715292d" />


---

## How to Run the Project

### Step 1: Clone Repository

```bash
git clone https://github.com/Mohit368/StudentTaskManagement.git
```

### Step 2: Configure Database

Create a MySQL database:

```sql
CREATE DATABASE student_task_db;
```

Execute the Students and Tasks table scripts.

### Step 3: Configure Database Connection

Update database credentials in:

```text
DBConnection.java
```

Example:

```java
String url = "jdbc:mysql://localhost:3306/student_task_db";
String username = "root";
String password = "your_password";
```

### Step 4: Deploy on Apache Tomcat

Copy the project into the Tomcat webapps directory and start Apache Tomcat.

### Step 5: Open Browser

```text
http://localhost:8080/StudentTaskManagement/login.jsp
```

---

## Project Outcomes

* Improved academic task organization
* Efficient task tracking
* Secure user authentication
* Database-driven task management
* Practical implementation of Java Web Technologies

---

## Future Enhancements

* Email Notifications
* Password Encryption
* Task Categories
* Calendar Integration
* Mobile Application Support
* Cloud Deployment
* Team Collaboration Features

---

## Author

**Mohit**

B.Tech Computer Science and Engineering

Galgotias University

## License

This project is developed for educational and academic purposes.
