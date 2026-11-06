<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hospital Patient Registration System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container my-4">
        <div class="card shadow-sm mb-4">
            <div class="card-body bg-primary text-white rounded-top">
                <h2 class="card-title mb-0">Hospital Patient Registration System</h2>
                <p class="mb-0">Spring Boot MVC + JPA + JSP + Hibernate + PostgreSQL</p>
            </div>
            <div class="card-body">
                <div class="row g-3 align-items-center mb-3">
                    <div class="col-md-6">
                        <a href="${pageContext.request.contextPath}/patients/new" class="btn btn-success">+ Register New Patient</a>
                        <a href="${pageContext.request.contextPath}/patients" class="btn btn-secondary">Show All Patients</a>
                    </div>
                    <div class="col-md-6">
                        <!-- Search by Patient ID -->
                        <form action="${pageContext.request.contextPath}/patients/search" method="get" class="d-flex">
                            <input type="number" name="searchId" class="form-control me-2" placeholder="Search by Patient ID" required>
                            <button type="submit" class="btn btn-outline-primary">Search</button>
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
                                <th>Patient ID</th>
                                <th>Name</th>
                                <th>Age</th>
                                <th>Gender</th>
                                <th>Contact Number</th>
                                <th>Email</th>
                                <th>Address</th>
                                <th>Blood Group</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="p" items="${patients}">
                                <tr>
                                    <td><strong>${p.patientId}</strong></td>
                                    <td>${p.name}</td>
                                    <td>${p.age}</td>
                                    <td>${p.gender}</td>
                                    <td>${p.contactNumber}</td>
                                    <td>${p.email}</td>
                                    <td>${p.address}</td>
                                    <td><span class="badge bg-danger">${p.bloodGroup}</span></td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/patients/edit/${p.patientId}" class="btn btn-sm btn-warning">Edit</a>
                                        <a href="${pageContext.request.contextPath}/patients/delete/${p.patientId}" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to delete this patient?')">Delete</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            <c:if test="${empty patients}">
                                <tr>
                                    <td colspan="9" class="text-center text-muted">No patient records found.</td>
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
