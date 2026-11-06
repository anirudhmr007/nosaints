<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Online Banking System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container my-4">
        <div class="card shadow-sm mb-4">
            <div class="card-body bg-primary text-white rounded-top">
                <h2 class="card-title mb-0">Online Banking System</h2>
                <p class="mb-0">Spring Boot MVC + JPA + JSP + Hibernate + PostgreSQL</p>
            </div>
            <div class="card-body">
                <div class="row g-3 align-items-center mb-3">
                    <div class="col-md-6">
                        <a href="${pageContext.request.contextPath}/accounts/new" class="btn btn-success">+ Register New Customer</a>
                        <a href="${pageContext.request.contextPath}/accounts" class="btn btn-secondary">Show All Accounts</a>
                    </div>
                    <div class="col-md-6">
                        <!-- Search by Account Number -->
                        <form action="${pageContext.request.contextPath}/accounts/search" method="get" class="d-flex">
                            <input type="text" name="accountNumber" class="form-control me-2" placeholder="Search by Account Number" required>
                            <button type="submit" class="btn btn-outline-primary">Search</button>
                        </form>
                    </div>
                </div>

                <!-- Alert Messages -->
                <c:if test="${not empty successMessage}">
                    <div class="alert alert-success">${successMessage}</div>
                </c:if>
                <c:if test="${not empty errorMessage}">
                    <div class="alert alert-danger">${errorMessage}</div>
                </c:if>

                <!-- Current Balance & Transaction Panel for Selected Account -->
                <c:if test="${not empty selectedAccount}">
                    <div class="card border-primary mb-4">
                        <div class="card-header bg-primary-subtle text-primary fw-bold">
                            Account Overview & Transactions: ${selectedAccount.accountNumber}
                        </div>
                        <div class="card-body">
                            <div class="row align-items-center">
                                <div class="col-md-4">
                                    <h5>${selectedAccount.customerName}</h5>
                                    <p class="mb-1 text-muted">Type: <strong>${selectedAccount.accountType}</strong></p>
                                    <p class="mb-0 text-muted">Contact: ${selectedAccount.contactNumber}</p>
                                </div>
                                <div class="col-md-4 text-center">
                                    <span class="text-muted d-block">Current Account Balance</span>
                                    <h2 class="text-success fw-bold mb-0">$${selectedAccount.accountBalance}</h2>
                                </div>
                                <div class="col-md-4">
                                    <!-- Deposit Form -->
                                    <form action="${pageContext.request.contextPath}/accounts/deposit" method="post" class="mb-2 d-flex">
                                        <input type="hidden" name="accountNumber" value="${selectedAccount.accountNumber}">
                                        <input type="number" step="0.01" min="1" name="amount" class="form-control form-control-sm me-2" placeholder="Deposit Amount" required>
                                        <button type="submit" class="btn btn-sm btn-success text-nowrap">Deposit</button>
                                    </form>
                                    <!-- Withdraw Form -->
                                    <form action="${pageContext.request.contextPath}/accounts/withdraw" method="post" class="d-flex">
                                        <input type="hidden" name="accountNumber" value="${selectedAccount.accountNumber}">
                                        <input type="number" step="0.01" min="1" name="amount" class="form-control form-control-sm me-2" placeholder="Withdraw Amount" required>
                                        <button type="submit" class="btn btn-sm btn-warning text-nowrap">Withdraw</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:if>

                <!-- Accounts Table -->
                <div class="table-responsive">
                    <table class="table table-bordered table-striped table-hover align-middle">
                        <thead class="table-dark">
                            <tr>
                                <th>Account ID</th>
                                <th>Account Number</th>
                                <th>Customer Name</th>
                                <th>Age</th>
                                <th>Gender</th>
                                <th>Contact</th>
                                <th>Email</th>
                                <th>Type</th>
                                <th>Balance ($)</th>
                                <th>Quick Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="a" items="${accounts}">
                                <tr>
                                    <td>${a.accountId}</td>
                                    <td><strong>${a.accountNumber}</strong></td>
                                    <td>${a.customerName}</td>
                                    <td>${a.age}</td>
                                    <td>${a.gender}</td>
                                    <td>${a.contactNumber}</td>
                                    <td>${a.email}</td>
                                    <td><span class="badge bg-info text-dark">${a.accountType}</span></td>
                                    <td><span class="fw-bold text-success">$${a.accountBalance}</span></td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/accounts/search?accountNumber=${a.accountNumber}" class="btn btn-sm btn-outline-primary">Manage</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            <c:if test="${empty accounts}">
                                <tr>
                                    <td colspan="10" class="text-center text-muted">No accounts registered yet.</td>
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
