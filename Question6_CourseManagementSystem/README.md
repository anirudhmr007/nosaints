# Question 6: Course Management System

A simple, beginner-friendly Spring Boot MVC application for Course Management using Spring Boot MVC, JPA, JSP, Hibernate, and PostgreSQL.

## Features Supported:
- Add a new course and save details in PostgreSQL
- Display all available courses in a JSP table
- Search for a course using Course ID
- Update course details
- Delete a course record using Course ID
- **Validation**:
  - Prevents registrations when course capacity is full.
  - Avoids duplicate student registrations for the same course.

## Entity Attributes:
- `courseId`: Unique ID (Primary Key, Auto-increment)
- `courseCode`: Course Code (e.g. CS201)
- `courseName`: Course Title (e.g. Database Management Systems)
- `department`: Department Name
- `facultyName`: Name of Faculty in charge
- `credits`: Number of Credits
- `semester`: Academic Semester
- `courseCapacity`: Maximum Capacity
- `enrolledStudents`: Count of Currently Enrolled Students

## Architecture:
- **Entity**: `com.example.course.entity.Course`, `StudentCourseRegistration`
- **Repository**: `com.example.course.repository.CourseRepository`, `RegistrationRepository`
- **Service**: `com.example.course.service.CourseService`
- **Controller**: `com.example.course.controller.CourseController`
- **Views (JSP)**: `src/main/webapp/WEB-INF/jsp/course-list.jsp`, `course-form.jsp`

## How to Run:
1. Ensure PostgreSQL is running and credentials in `src/main/resources/application.properties` match your pgAdmin settings.
2. In Spring Tools for Eclipse (STS):
   - Click `File -> Import... -> Maven -> Existing Maven Projects`.
   - Select this folder.
   - Right click the project -> `Run As -> Spring Boot App`.
3. Open your browser and visit: `http://localhost:8086/courses`
