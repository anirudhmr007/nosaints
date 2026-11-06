# Question 1: Hospital Patient Registration System

A simple, beginner-friendly Spring Boot MVC application for Hospital Patient Registration using Spring Boot MVC, JPA, JSP, Hibernate, and PostgreSQL.

## Features Supported:
- Register a new patient and save details in PostgreSQL
- Display all registered patients in a JSP table
- Search for a patient using Patient ID
- Update patient details
- Delete a patient record using Patient ID

## Entity Attributes:
- `patientId`: Unique ID (Primary Key, Auto-increment)
- `name`: Patient Full Name
- `age`: Patient Age
- `gender`: Male / Female / Other
- `contactNumber`: Contact Number
- `email`: Email Address
- `address`: Address
- `bloodGroup`: Blood Group (A+, B+, O+, etc.)

## Architecture:
- **Entity**: `com.example.hospital.entity.Patient`
- **Repository**: `com.example.hospital.repository.PatientRepository`
- **Service**: `com.example.hospital.service.PatientService`
- **Controller**: `com.example.hospital.controller.PatientController`
- **Views (JSP)**: `src/main/webapp/WEB-INF/jsp/patient-list.jsp`, `patient-form.jsp`

## How to Run:
1. Ensure PostgreSQL is running and credentials in `src/main/resources/application.properties` match your pgAdmin settings.
2. In Spring Tools for Eclipse (STS):
   - Click `File -> Import... -> Maven -> Existing Maven Projects`.
   - Select this folder.
   - Right click the project -> `Run As -> Spring Boot App`.
3. Open your browser and visit: `http://localhost:8081/patients`
