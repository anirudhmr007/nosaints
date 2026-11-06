<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Course Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container my-4">
        <div class="card shadow-sm mb-4">
            <div class="card-body bg-dark text-white rounded-top">
                <h2 class="card-title mb-0">Course Management System</h2>
                <p class="mb-0">Spring Boot MVC + JPA + JSP + Hibernate + PostgreSQL</p>
            </div>
            <div class="card-body">
                <div class="row g-3 align-items-center mb-3">
                    <div class="col-md-6">
                        <a href="${pageContext.request.contextPath}/courses/new" class="btn btn-primary">+ Add New Course</a>
                        <a href="${pageContext.request.contextPath}/courses" class="btn btn-secondary">Show All Courses</a>
                    </div>
                    <div class="col-md-6">
                        <!-- Search by Course ID -->
                        <form action="${pageContext.request.contextPath}/courses/search" method="get" class="d-flex">
                            <input type="number" name="searchId" class="form-control me-2" placeholder="Search by Course ID" required>
                            <button type="submit" class="btn btn-outline-dark">Search</button>
                        </form>
                    </div>
                </div>

                <!-- Messages -->
                <c:if test="${not empty successMessage}">
                    <div class="alert alert-success">${successMessage}</div>
                </c:if>
                <c:if test="${not empty errorMessage}">
                    <div class="alert alert-danger">${errorMessage}</div>
                </c:if>

                <!-- Student Registration Form (Demonstrating Capacity & Duplicate Validations) -->
                <div class="card border-info mb-4">
                    <div class="card-header bg-info-subtle fw-bold">
                        Student Course Enrollment (Enforces Capacity Limit &amp; Duplicate Check)
                    </div>
                    <div class="card-body">
                        <form action="${pageContext.request.contextPath}/courses/registerStudent" method="post" class="row g-2 align-items-center">
                            <div class="col-md-4">
                                <select name="courseId" class="form-select" required>
                                    <option value="">-- Choose Course to Enroll --</option>
                                    <c:forEach var="c" items="${courses}">
                                        <option value="${c.courseId}">${c.courseCode} - ${c.courseName} (Cap: ${c.enrolledStudents}/${c.courseCapacity})</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-md-3">
                                <input type="text" name="studentRollNumber" class="form-control" placeholder="Student Roll No (e.g. S101)" required />
                            </div>
                            <div class="col-md-3">
                                <input type="text" name="studentName" class="form-control" placeholder="Student Name" required />
                            </div>
                            <div class="col-md-2">
                                <button type="submit" class="btn btn-info w-100 text-white">Enroll Student</button>
                            </div>
                        </form>
                    </div>
                </div>

                <!-- Courses Table -->
                <div class="table-responsive">
                    <table class="table table-bordered table-striped table-hover align-middle">
                        <thead class="table-dark">
                            <tr>
                                <th>Course ID</th>
                                <th>Course Code</th>
                                <th>Course Name</th>
                                <th>Department</th>
                                <th>Faculty</th>
                                <th>Credits</th>
                                <th>Semester</th>
                                <th>Capacity Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="c" items="${courses}">
                                <tr>
                                    <td><strong>${c.courseId}</strong></td>
                                    <td><span class="badge bg-secondary">${c.courseCode}</span></td>
                                    <td>${c.courseName}</td>
                                    <td>${c.department}</td>
                                    <td>${c.facultyName}</td>
                                    <td>${c.credits}</td>
                                    <td>${c.semester}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${c.enrolledStudents >= c.courseCapacity}">
                                                <span class="badge bg-danger">FULL (${c.enrolledStudents}/${c.courseCapacity})</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge bg-success">${c.enrolledStudents} / ${c.courseCapacity} Available</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/courses/edit/${c.courseId}" class="btn btn-sm btn-warning">Edit</a>
                                        <a href="${pageContext.request.contextPath}/courses/delete/${c.courseId}" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to delete this course?')">Delete</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            <c:if test="${empty courses}">
                                <tr>
                                    <td colspan="9" class="text-center text-muted">No courses found.</td>
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
