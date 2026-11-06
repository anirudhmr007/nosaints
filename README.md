# Spring Boot MVC Lab Examination Solutions (Questions 1 - 8)

This repository contains clean, beginner-friendly, and modular solutions for all 8 questions. Each solution is built using **Spring Boot MVC**, **Spring Data JPA (Hibernate)**, **JSP**, and **PostgreSQL**, organized with clean MVC layering (`controller`, `service`, `repository`, and `entity`).

---

## Project Index & Port Mapping

| Folder | System Name | Entity Attributes | Operations & Validations | Default URL |
| :--- | :--- | :--- | :--- | :--- |
| **`Question1_HospitalPatientSystem`** | Hospital Patient Registration | `patientId`, `name`, `age`, `gender`, `contactNumber`, `email`, `address`, `bloodGroup` | Register, View all, Search by Patient ID, Update, Delete | `http://localhost:8081/patients` |
| **`Question2_LibraryManagementSystem`** | Library Management | `bookId`, `title`, `author`, `publisher`, `isbn`, `edition`, `publicationYear`, `category`, `availableCopies` | Add, View all, Search by Book ID, Update, Delete | `http://localhost:8082/books` |
| **`Question3_EmployeeManagementSystem`** | Employee Management | `employeeId`, `name`, `age`, `gender`, `contactNumber`, `email`, `address`, `department`, `designation`, `dateOfJoining`, `salary` | Add, View all, Search by Employee ID, Update, Delete | `http://localhost:8083/employees` |
| **`Question4_ProductInventorySystem`** | Product Inventory Management | `productId`, `productName`, `category`, `brand`, `description`, `price`, `quantity`, `supplierName`, `manufacturingDate`, `expiryDate` | Add, View all, Search by Product ID, Update, Delete | `http://localhost:8084/products` |
| **`Question5_OnlineBankingSystem`** | Online Banking System | `accountId`, `accountNumber`, `customerName`, `age`, `gender`, `contactNumber`, `email`, `address`, `accountType`, `accountBalance` | Register customer, View all, Search by Account Number, Deposit & Withdraw with balance validation | `http://localhost:8085/accounts` |
| **`Question6_CourseManagementSystem`** | Course Management System | `courseId`, `courseCode`, `courseName`, `department`, `facultyName`, `credits`, `semester`, `courseCapacity`, `enrolledStudents` | Add, View all, Search by Course ID, Update, Delete. Validates capacity limit & duplicate registration | `http://localhost:8086/courses` |
| **`Question7_BloodDonorSystem`** | Blood Donor Management | `donorId`, `name`, `age`, `gender`, `bloodGroup`, `contactNumber`, `email`, `address`, `lastDonationDate`, `healthStatus` | Register, View all, Search by Blood Group, Update, Delete. Validates age (18-65), health status (Fit), & 90-day eligibility | `http://localhost:8087/donors` |
| **`Question8_PharmacyManagementSystem`** | Pharmacy Management | `medicineId`, `medicineName`, `category`, `manufacturer`, `batchNumber`, `price`, `quantity`, `manufacturingDate`, `expiryDate`, `supplierName` | Add, View all, Search by ID or Name, Update, Delete. Validates non-negative stock & identifies expired medicines | `http://localhost:8088/medicines` |

---

## Prerequisites
1. **Java JDK 17+** (JDK 17, 21, or 25)
2. **Spring Tools for Eclipse (STS)**
3. **pgAdmin 4** & **PostgreSQL** installed and running on `localhost:5432`

---

## Database Setup in pgAdmin
By default, all projects connect to PostgreSQL using:
- **Host**: `localhost:5432`
- **Database**: `postgres` (or you can create individual databases if desired)
- **Username**: `postgres`
- **Password**: `postgres`

> **Note:** If your PostgreSQL password in pgAdmin is different (e.g., `admin` or `root`), simply update `spring.datasource.password` in the project's `src/main/resources/application.properties`.

Hibernate is configured with `spring.jpa.hibernate.ddl-auto=update`, which **automatically creates all the required tables** when you launch the application.

Each project also includes an optional `schema.sql` file containing the table definitions and sample data if you want to run it directly inside pgAdmin Query Tool.

---

## How to Import and Run in Spring Tools for Eclipse (STS)

1. Open **Spring Tools for Eclipse (STS)**.
2. Click **File -> Import...**
3. Select **Maven -> Existing Maven Projects** and click **Next**.
4. Click **Browse...** and select any project folder (e.g. `c:\nosaints\Question1_HospitalPatientSystem` or all 8 folders).
5. Click **Finish**. STS will automatically configure the dependencies.
6. To run a project:
   - Expand the project in **Package Explorer**.
   - Right-click the project folder (or the `*Application.java` file) -> **Run As -> Spring Boot App**.
7. Open your web browser and navigate to the project URL (listed in the table above).

---

## Architecture Pattern Followed
Every project follows the standard **MVC Architecture**:
- **Entity (`entity`)**: Represents the PostgreSQL table mapping using JPA `@Entity`, `@Id`, `@GeneratedValue(strategy = GenerationType.IDENTITY)`.
- **Repository (`repository`)**: Spring Data JPA interface extending `JpaRepository` providing ready-to-use CRUD operations without boilerplate code.
- **Service (`service`)**: Contains business logic, validation checks, and data operations.
- **Controller (`controller`)**: Handles HTTP requests (`@GetMapping`, `@PostMapping`), passes data via `Model`, and navigates to JSP views.
- **Views (`webapp/WEB-INF/jsp/`)**: JSP files styled with Bootstrap 5 CDN and JSTL tags (`c:forEach`, `c:if`, `c:choose`) for user interfaces.
