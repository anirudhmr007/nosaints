# Question 8: Pharmacy Management System

A simple, beginner-friendly Spring Boot MVC application for Pharmacy Management using Spring Boot MVC, JPA, JSP, Hibernate, and PostgreSQL.

## Features Supported:
- Add New Medicine and save details in PostgreSQL
- View All Medicines in a JSP table
- Search Medicines: Find medicines using Medicine ID or Medicine Name
- Update Medicine Details
- Delete Medicine using Medicine ID
- **Validation**:
  - Prevents negative stock quantities and prices.
  - Automatically identifies expired medicines and highlights them with an `EXPIRED` badge.

## Entity Attributes:
- `medicineId`: Unique ID (Primary Key, Auto-increment)
- `medicineName`: Medicine Name (e.g., Paracetamol)
- `category`: Category (e.g., Antibiotic, Analgesic)
- `manufacturer`: Manufacturer Name
- `batchNumber`: Batch Number
- `price`: Price per unit
- `quantity`: Available Stock Quantity (must be >= 0)
- `manufacturingDate`: Manufacturing Date
- `expiryDate`: Expiry Date
- `supplierName`: Supplier Name

## Architecture:
- **Entity**: `com.example.pharmacy.entity.Medicine`
- **Repository**: `com.example.pharmacy.repository.MedicineRepository`
- **Service**: `com.example.pharmacy.service.MedicineService`
- **Controller**: `com.example.pharmacy.controller.MedicineController`
- **Views (JSP)**: `src/main/webapp/WEB-INF/jsp/medicine-list.jsp`, `medicine-form.jsp`

## How to Run:
1. Ensure PostgreSQL is running and credentials in `src/main/resources/application.properties` match your pgAdmin settings.
2. In Spring Tools for Eclipse (STS):
   - Click `File -> Import... -> Maven -> Existing Maven Projects`.
   - Select this folder.
   - Right click the project -> `Run As -> Spring Boot App`.
3. Open your browser and visit: `http://localhost:8088/medicines`
