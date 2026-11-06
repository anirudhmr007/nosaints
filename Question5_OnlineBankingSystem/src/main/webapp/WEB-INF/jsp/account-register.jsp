<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register Customer Bank Account</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container my-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card shadow-sm">
                    <div class="card-header bg-primary text-white">
                        <h4 class="mb-0">Register New Customer Bank Account</h4>
                    </div>
                    <div class="card-body">
                        <c:if test="${not empty errorMessage}">
                            <div class="alert alert-danger">${errorMessage}</div>
                        </c:if>

                        <form action="${pageContext.request.contextPath}/accounts/register" method="post">
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Account Number:</label>
                                    <input type="text" name="accountNumber" class="form-control" value="${account.accountNumber}" placeholder="e.g. ACC1001" required />
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Customer Name:</label>
                                    <input type="text" name="customerName" class="form-control" value="${account.customerName}" required />
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Age:</label>
                                    <input type="number" name="age" class="form-control" value="${account.age}" required min="18" max="120" />
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Gender:</label>
                                    <select name="gender" class="form-select" required>
                                        <option value="">-- Select Gender --</option>
                                        <option value="Male" ${account.gender == 'Male' ? 'selected' : ''}>Male</option>
                                        <option value="Female" ${account.gender == 'Female' ? 'selected' : ''}>Female</option>
                                        <option value="Other" ${account.gender == 'Other' ? 'selected' : ''}>Other</option>
                                    </select>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Contact Number:</label>
                                    <input type="text" name="contactNumber" class="form-control" value="${account.contactNumber}" required />
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Email:</label>
                                    <input type="email" name="email" class="form-control" value="${account.email}" required />
                                </div>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Address:</label>
                                <textarea name="address" class="form-control" rows="2" required>${account.address}</textarea>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Account Type:</label>
                                    <select name="accountType" class="form-select" required>
                                        <option value="">-- Select Account Type --</option>
                                        <option value="Savings Account" ${account.accountType == 'Savings Account' ? 'selected' : ''}>Savings Account</option>
                                        <option value="Current Account" ${account.accountType == 'Current Account' ? 'selected' : ''}>Current Account</option>
                                        <option value="Salary Account" ${account.accountType == 'Salary Account' ? 'selected' : ''}>Salary Account</option>
                                    </select>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Opening Account Balance ($):</label>
                                    <input type="number" step="0.01" min="0" name="accountBalance" class="form-control" value="${account.accountBalance != null ? account.accountBalance : 500.0}" required />
                                </div>
                            </div>

                            <div class="d-flex justify-content-between">
                                <a href="${pageContext.request.contextPath}/accounts" class="btn btn-secondary">Back to List</a>
                                <button type="submit" class="btn btn-success">Create Account</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
