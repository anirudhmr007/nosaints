# Question 7: Blood Donor Management System

A simple, beginner-friendly Spring Boot MVC application for Blood Donor Management using Spring Boot MVC, JPA, JSP, Hibernate, and PostgreSQL.

## Features Supported:
- Register a new blood donor and save details in PostgreSQL
- Display all registered blood donors in a JSP table
- Search for blood donors based on Blood Group (e.g. A+, O+, etc.)
- Update donor details
- Delete a donor record using Donor ID
- **Validation**:
  - Validates donor age (must be between 18 and 65 years).
  - Validates health status (must be "Fit").
  - Validates donation eligibility (minimum 90 days required between donations).

## Entity Attributes:
- `donorId`: Unique ID (Primary Key, Auto-increment)
- `name`: Donor Name
- `age`: Age (18–65)
- `gender`: Gender
- `bloodGroup`: Blood Group (A+, A-, B+, B-, AB+, AB-, O+, O-)
- `contactNumber`: Phone Number
- `email`: Email Address
- `address`: Address
- `lastDonationDate`: Date of Last Blood Donation
- `healthStatus`: Health Status ("Fit" or "Unfit")

## Architecture:
- **Entity**: `com.example.donor.entity.BloodDonor`
- **Repository**: `com.example.donor.repository.BloodDonorRepository`
- **Service**: `com.example.donor.service.BloodDonorService`
- **Controller**: `com.example.donor.controller.BloodDonorController`
- **Views (JSP)**: `src/main/webapp/WEB-INF/jsp/donor-list.jsp`, `donor-form.jsp`

## How to Run:
1. Ensure PostgreSQL is running and credentials in `src/main/resources/application.properties` match your pgAdmin settings.
2. In Spring Tools for Eclipse (STS):
   - Click `File -> Import... -> Maven -> Existing Maven Projects`.
   - Select this folder.
   - Right click the project -> `Run As -> Spring Boot App`.
3. Open your browser and visit: `http://localhost:8087/donors`
