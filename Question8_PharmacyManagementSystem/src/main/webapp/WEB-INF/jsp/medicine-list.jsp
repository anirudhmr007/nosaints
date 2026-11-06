<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Pharmacy Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container my-4">
        <div class="card shadow-sm mb-4">
            <div class="card-body bg-teal text-white rounded-top" style="background-color: #0d6efd;">
                <h2 class="card-title mb-0">Pharmacy Management System</h2>
                <p class="mb-0">Spring Boot MVC + JPA + JSP + Hibernate + PostgreSQL</p>
            </div>
            <div class="card-body">
                <div class="row g-3 align-items-center mb-3">
                    <div class="col-md-6">
                        <a href="${pageContext.request.contextPath}/medicines/new" class="btn btn-success">+ Add New Medicine</a>
                        <a href="${pageContext.request.contextPath}/medicines" class="btn btn-secondary">Show All Medicines</a>
                    </div>
                    <div class="col-md-6">
                        <!-- Search by Medicine ID or Medicine Name -->
                        <form action="${pageContext.request.contextPath}/medicines/search" method="get" class="d-flex">
                            <input type="text" name="keyword" class="form-control me-2" placeholder="Search by ID or Medicine Name" value="${searchKeyword}" required>
                            <button type="submit" class="btn btn-outline-primary">Search</button>
                        </form>
                    </div>
                </div>

                <c:if test="${not empty errorMessage}">
                    <div class="alert alert-danger">${errorMessage}</div>
                </c:if>

                <div class="table-responsive">
                    <table class="table table-bordered table-striped table-hover align-middle">
                        <thead class="table-dark">
                            <tr>
                                <th>Medicine ID</th>
                                <th>Medicine Name</th>
                                <th>Category</th>
                                <th>Manufacturer</th>
                                <th>Batch No</th>
                                <th>Price ($)</th>
                                <th>Stock Qty</th>
                                <th>Mfg Date</th>
                                <th>Expiry Date</th>
                                <th>Status</th>
                                <th>Supplier</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="m" items="${medicines}">
                                <tr class="${m.isExpired() ? 'table-danger' : ''}">
                                    <td><strong>${m.medicineId}</strong></td>
                                    <td><strong>${m.medicineName}</strong></td>
                                    <td><span class="badge bg-secondary">${m.category}</span></td>
                                    <td>${m.manufacturer}</td>
                                    <td>${m.batchNumber}</td>
                                    <td>$${m.price}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${m.quantity == 0}">
                                                <span class="badge bg-danger">Out of Stock (0)</span>
                                            </c:when>
                                            <c:when test="${m.quantity < 10}">
                                                <span class="badge bg-warning text-dark">Low (${m.quantity})</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge bg-success">${m.quantity}</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>${m.manufacturingDate}</td>
                                    <td>${m.expiryDate}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${m.isExpired()}">
                                                <span class="badge bg-danger">EXPIRED</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge bg-success">Valid</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>${m.supplierName}</td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/medicines/edit/${m.medicineId}" class="btn btn-sm btn-warning">Edit</a>
                                        <a href="${pageContext.request.contextPath}/medicines/delete/${m.medicineId}" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to delete this medicine?')">Delete</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            <c:if test="${empty medicines}">
                                <tr>
                                    <td colspan="12" class="text-center text-muted">No medicines found.</td>
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
