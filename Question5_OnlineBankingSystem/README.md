# Question 5: Online Banking System

A simple, beginner-friendly Spring Boot MVC application for Online Banking System using Spring Boot MVC, JPA, JSP, Hibernate, and PostgreSQL.

## Features Supported:
- Register a new customer and create a bank account saved in PostgreSQL
- Display all registered customer accounts in a JSP table
- Search for a customer account using Account Number
- Deposit money into an account and update the account balance (with validation for positive amount)
- Withdraw money from an account and update the account balance (with validation for positive amount & sufficient balance)
- Display the current account balance for a given Account Number

## Entity Attributes:
- `accountId`: Unique Account ID (Primary Key, Auto-increment)
- `accountNumber`: Unique Account Number (e.g., ACC1001)
- `customerName`: Customer Full Name
- `age`: Customer Age
- `gender`: Gender
- `contactNumber`: Contact Phone Number
- `email`: Email Address
- `address`: Address
- `accountType`: Savings, Current, Salary, etc.
- `accountBalance`: Current Balance in Dollars

## Validations Implemented:
1. **Deposit Validation**: Deposit amount must be positive and non-zero.
2. **Withdrawal Validation**: Withdrawal amount must be positive and non-zero; withdrawal cannot exceed the available balance.

## Architecture:
- **Entity**: `com.example.banking.entity.BankAccount`
- **Repository**: `com.example.banking.repository.BankAccountRepository`
- **Service**: `com.example.banking.service.BankingService`
- **Controller**: `com.example.banking.controller.BankingController`
- **Views (JSP)**: `src/main/webapp/WEB-INF/jsp/account-list.jsp`, `account-register.jsp`

## How to Run:
1. Ensure PostgreSQL is running and credentials in `src/main/resources/application.properties` match your pgAdmin settings.
2. In Spring Tools for Eclipse (STS):
   - Click `File -> Import... -> Maven -> Existing Maven Projects`.
   - Select this folder.
   - Right click the project -> `Run As -> Spring Boot App`.
3. Open your browser and visit: `http://localhost:8085/accounts`
