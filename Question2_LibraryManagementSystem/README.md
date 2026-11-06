# Question 2: Library Management System

A simple, beginner-friendly Spring Boot MVC application for Library Management using Spring Boot MVC, JPA, JSP, Hibernate, and PostgreSQL.

## Features Supported:
- Add a new book and save details in PostgreSQL
- Display all available books in a JSP table
- Search for a book using Book ID
- Update book details
- Delete a book record using Book ID

## Entity Attributes:
- `bookId`: Unique ID (Primary Key, Auto-increment)
- `title`: Book Title
- `author`: Author Name
- `publisher`: Publisher Name
- `isbn`: ISBN Number
- `edition`: Edition
- `publicationYear`: Year of Publication
- `category`: Category / Genre
- `availableCopies`: Number of Available Copies

## Architecture:
- **Entity**: `com.example.library.entity.Book`
- **Repository**: `com.example.library.repository.BookRepository`
- **Service**: `com.example.library.service.BookService`
- **Controller**: `com.example.library.controller.BookController`
- **Views (JSP)**: `src/main/webapp/WEB-INF/jsp/book-list.jsp`, `book-form.jsp`

## How to Run:
1. Ensure PostgreSQL is running and credentials in `src/main/resources/application.properties` match your pgAdmin settings.
2. In Spring Tools for Eclipse (STS):
   - Click `File -> Import... -> Maven -> Existing Maven Projects`.
   - Select this folder.
   - Right click the project -> `Run As -> Spring Boot App`.
3. Open your browser and visit: `http://localhost:8082/books`
