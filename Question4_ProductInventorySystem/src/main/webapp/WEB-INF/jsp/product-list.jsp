<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product Inventory Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container my-4">
        <div class="card shadow-sm mb-4">
            <div class="card-body bg-warning text-dark rounded-top">
                <h2 class="card-title mb-0">Product Inventory Management System</h2>
                <p class="mb-0">Spring Boot MVC + JPA + JSP + Hibernate + PostgreSQL</p>
            </div>
            <div class="card-body">
                <div class="row g-3 align-items-center mb-3">
                    <div class="col-md-6">
                        <a href="${pageContext.request.contextPath}/products/new" class="btn btn-primary">+ Add New Product</a>
                        <a href="${pageContext.request.contextPath}/products" class="btn btn-secondary">Show All Products</a>
                    </div>
                    <div class="col-md-6">
                        <!-- Search by Product ID -->
                        <form action="${pageContext.request.contextPath}/products/search" method="get" class="d-flex">
                            <input type="number" name="searchId" class="form-control me-2" placeholder="Search by Product ID" required>
                            <button type="submit" class="btn btn-outline-dark">Search</button>
                        </form>
                    </div>
                </div>

                <c:if test="${not empty message}">
                    <div class="alert alert-warning">${message}</div>
                </c:if>

                <div class="table-responsive">
                    <table class="table table-bordered table-striped table-hover align-middle">
                        <thead class="table-dark">
                            <tr>
                                <th>Product ID</th>
                                <th>Name</th>
                                <th>Category</th>
                                <th>Brand</th>
                                <th>Description</th>
                                <th>Price ($)</th>
                                <th>Quantity</th>
                                <th>Supplier</th>
                                <th>Mfg Date</th>
                                <th>Exp Date</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="p" items="${products}">
                                <tr>
                                    <td><strong>${p.productId}</strong></td>
                                    <td>${p.productName}</td>
                                    <td><span class="badge bg-info text-dark">${p.category}</span></td>
                                    <td>${p.brand}</td>
                                    <td>${p.description}</td>
                                    <td>$${p.price}</td>
                                    <td><span class="badge bg-primary">${p.quantity}</span></td>
                                    <td>${p.supplierName}</td>
                                    <td>${p.manufacturingDate}</td>
                                    <td>${p.expiryDate}</td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/products/edit/${p.productId}" class="btn btn-sm btn-warning">Edit</a>
                                        <a href="${pageContext.request.contextPath}/products/delete/${p.productId}" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to delete this product?')">Delete</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            <c:if test="${empty products}">
                                <tr>
                                    <td colspan="11" class="text-center text-muted">No products found.</td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
