<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Blood Donor Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container my-4">
        <div class="card shadow-sm mb-4">
            <div class="card-body bg-danger text-white rounded-top">
                <h2 class="card-title mb-0">Blood Donor Management System</h2>
                <p class="mb-0">Spring Boot MVC + JPA + JSP + Hibernate + PostgreSQL</p>
            </div>
            <div class="card-body">
                <div class="row g-3 align-items-center mb-3">
                    <div class="col-md-6">
                        <a href="${pageContext.request.contextPath}/donors/new" class="btn btn-danger">+ Register New Donor</a>
                        <a href="${pageContext.request.contextPath}/donors" class="btn btn-secondary">Show All Donors</a>
                    </div>
                    <div class="col-md-6">
                        <!-- Search based on Blood Group -->
                        <form action="${pageContext.request.contextPath}/donors/search" method="get" class="d-flex">
                            <select name="bloodGroup" class="form-select me-2" required>
                                <option value="">-- Search by Blood Group --</option>
                                <option value="A+" ${searchedGroup == 'A+' ? 'selected' : ''}>A+</option>
                                <option value="A-" ${searchedGroup == 'A-' ? 'selected' : ''}>A-</option>
                                <option value="B+" ${searchedGroup == 'B+' ? 'selected' : ''}>B+</option>
                                <option value="B-" ${searchedGroup == 'B-' ? 'selected' : ''}>B-</option>
                                <option value="AB+" ${searchedGroup == 'AB+' ? 'selected' : ''}>AB+</option>
                                <option value="AB-" ${searchedGroup == 'AB-' ? 'selected' : ''}>AB-</option>
                                <option value="O+" ${searchedGroup == 'O+' ? 'selected' : ''}>O+</option>
                                <option value="O-" ${searchedGroup == 'O-' ? 'selected' : ''}>O-</option>
                            </select>
                            <button type="submit" class="btn btn-outline-danger">Filter</button>
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
                                <th>Donor ID</th>
                                <th>Name</th>
                                <th>Age</th>
                                <th>Gender</th>
                                <th>Blood Group</th>
                                <th>Contact</th>
                                <th>Email</th>
                                <th>Last Donation Date</th>
                                <th>Health Status</th>
                                <th>Eligibility</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="d" items="${donors}">
                                <tr>
                                    <td><strong>${d.donorId}</strong></td>
                                    <td>${d.name}</td>
                                    <td>${d.age}</td>
                                    <td>${d.gender}</td>
                                    <td><span class="badge bg-danger fs-6">${d.bloodGroup}</span></td>
                                    <td>${d.contactNumber}</td>
                                    <td>${d.email}</td>
                                    <td>${d.lastDonationDate != null && d.lastDonationDate != '' ? d.lastDonationDate : 'N/A'}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${d.healthStatus == 'Fit'}">
                                                <span class="badge bg-success">Fit</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge bg-secondary">${d.healthStatus}</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${d.isEligible()}">
                                                <span class="badge bg-success">Eligible to Donate</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge bg-warning text-dark">Ineligible (Resting/Unfit)</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/donors/edit/${d.donorId}" class="btn btn-sm btn-warning">Edit</a>
                                        <a href="${pageContext.request.contextPath}/donors/delete/${d.donorId}" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to delete this donor?')">Delete</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            <c:if test="${empty donors}">
                                <tr>
                                    <td colspan="11" class="text-center text-muted">No donor records found.</td>
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
