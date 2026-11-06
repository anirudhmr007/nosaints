# Question 3: Employee Management System

A simple, beginner-friendly Spring Boot MVC application for Employee Management using Spring Boot MVC, JPA, JSP, Hibernate, and PostgreSQL.

## Features Supported:
- Add a new employee and save details in PostgreSQL
- Display all registered employees in a JSP table
- Search for an employee using Employee ID
- Update employee details
- Delete an employee record using Employee ID

## Entity Attributes:
- `employeeId`: Unique ID (Primary Key, Auto-increment)
- `name`: Employee Name
- `age`: Age
- `gender`: Gender
- `contactNumber`: Contact Number
- `email`: Email Address
- `address`: Address
- `department`: Department (e.g., Engineering, Sales, HR)
- `designation`: Designation (e.g., Software Engineer, Manager)
- `dateOfJoining`: Date of Joining
- `salary`: Monthly/Annual Salary

## Architecture:
- **Entity**: `com.example.employee.entity.Employee`
- **Repository**: `com.example.employee.repository.EmployeeRepository`
- **Service**: `com.example.employee.service.EmployeeService`
- **Controller**: `com.example.employee.controller.EmployeeController`
- **Views (JSP)**: `src/main/webapp/WEB-INF/jsp/employee-list.jsp`, `employee-form.jsp`

## How to Run:
1. Ensure PostgreSQL is running and credentials in `src/main/resources/application.properties` match your pgAdmin settings.
2. In Spring Tools for Eclipse (STS):
   - Click `File -> Import... -> Maven -> Existing Maven Projects`.
   - Select this folder.
   - Right click the project -> `Run As -> Spring Boot App`.
3. Open your browser and visit: `http://localhost:8083/employees`
