<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container my-4">
        <div class="card shadow-sm mb-4">
            <div class="card-body bg-dark text-white rounded-top">
                <h2 class="card-title mb-0">Employee Management System</h2>
                <p class="mb-0">Spring Boot MVC + JPA + JSP + Hibernate + PostgreSQL</p>
            </div>
            <div class="card-body">
                <div class="row g-3 align-items-center mb-3">
                    <div class="col-md-6">
                        <a href="${pageContext.request.contextPath}/employees/new" class="btn btn-primary">+ Add New Employee</a>
                        <a href="${pageContext.request.contextPath}/employees" class="btn btn-secondary">Show All Employees</a>
                    </div>
                    <div class="col-md-6">
                        <!-- Search by Employee ID -->
                        <form action="${pageContext.request.contextPath}/employees/search" method="get" class="d-flex">
                            <input type="number" name="searchId" class="form-control me-2" placeholder="Search by Employee ID" required>
                            <button type="submit" class="btn btn-outline-dark">Search</button>
                        </form>
                    </div>
                </div>

                <c:if test="${not empty message}">
                    <div class="alert alert-warning">${message}</div>
                </c:if>

                <div class="table-responsive">
                    <table class="table table-bordered table-striped table-hover align-middle">
                        <thead class="table-secondary">
                            <tr>
                                <th>Emp ID</th>
                                <th>Name</th>
                                <th>Age</th>
                                <th>Gender</th>
                                <th>Contact</th>
                                <th>Email</th>
                                <th>Department</th>
                                <th>Designation</th>
                                <th>Join Date</th>
                                <th>Salary ($)</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="e" items="${employees}">
                                <tr>
                                    <td><strong>${e.employeeId}</strong></td>
                                    <td>${e.name}</td>
                                    <td>${e.age}</td>
                                    <td>${e.gender}</td>
                                    <td>${e.contactNumber}</td>
                                    <td>${e.email}</td>
                                    <td><span class="badge bg-primary">${e.department}</span></td>
                                    <td>${e.designation}</td>
                                    <td>${e.dateOfJoining}</td>
                                    <td>$${e.salary}</td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/employees/edit/${e.employeeId}" class="btn btn-sm btn-warning">Edit</a>
                                        <a href="${pageContext.request.contextPath}/employees/delete/${e.employeeId}" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to delete this employee?')">Delete</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            <c:if test="${empty employees}">
                                <tr>
                                    <td colspan="11" class="text-center text-muted">No employees found.</td>
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
