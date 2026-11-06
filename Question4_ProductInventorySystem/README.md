# Question 4: Product Inventory Management System

A simple, beginner-friendly Spring Boot MVC application for Product Inventory Management using Spring Boot MVC, JPA, JSP, Hibernate, and PostgreSQL.

## Features Supported:
- Add a new product and save details in PostgreSQL
- Display all registered products in a JSP table
- Search for a product using Product ID
- Update product details
- Delete a product record using Product ID

## Entity Attributes:
- `productId`: Unique ID (Primary Key, Auto-increment)
- `productName`: Product Name
- `category`: Category
- `brand`: Brand Name
- `description`: Product Description
- `price`: Unit Price
- `quantity`: Available Stock Quantity
- `supplierName`: Supplier Name
- `manufacturingDate`: Manufacturing Date
- `expiryDate`: Expiry Date

## Architecture:
- **Entity**: `com.example.inventory.entity.Product`
- **Repository**: `com.example.inventory.repository.ProductRepository`
- **Service**: `com.example.inventory.service.ProductService`
- **Controller**: `com.example.inventory.controller.ProductController`
- **Views (JSP)**: `src/main/webapp/WEB-INF/jsp/product-list.jsp`, `product-form.jsp`

## How to Run:
1. Ensure PostgreSQL is running and credentials in `src/main/resources/application.properties` match your pgAdmin settings.
2. In Spring Tools for Eclipse (STS):
   - Click `File -> Import... -> Maven -> Existing Maven Projects`.
   - Select this folder.
   - Right click the project -> `Run As -> Spring Boot App`.
3. Open your browser and visit: `http://localhost:8084/products`
