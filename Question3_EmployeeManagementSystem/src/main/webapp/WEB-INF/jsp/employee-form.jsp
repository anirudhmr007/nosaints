<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${actionTitle}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container my-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card shadow-sm">
                    <div class="card-header bg-dark text-white">
                        <h4 class="mb-0">${actionTitle}</h4>
                    </div>
                    <div class="card-body">
                        <form action="${pageContext.request.contextPath}/employees/save" method="post">
                            <input type="hidden" name="employeeId" value="${employee.employeeId}" />

                            <div class="mb-3">
                                <label class="form-label">Full Name:</label>
                                <input type="text" name="name" class="form-control" value="${employee.name}" required />
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Age:</label>
                                    <input type="number" name="age" class="form-control" value="${employee.age}" required min="18" max="100" />
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Gender:</label>
                                    <select name="gender" class="form-select" required>
                                        <option value="">-- Select Gender --</option>
                                        <option value="Male" ${employee.gender == 'Male' ? 'selected' : ''}>Male</option>
                                        <option value="Female" ${employee.gender == 'Female' ? 'selected' : ''}>Female</option>
                                        <option value="Other" ${employee.gender == 'Other' ? 'selected' : ''}>Other</option>
                                    </select>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Contact Number:</label>
                                    <input type="text" name="contactNumber" class="form-control" value="${employee.contactNumber}" required />
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Email:</label>
                                    <input type="email" name="email" class="form-control" value="${employee.email}" required />
                                </div>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Address:</label>
                                <textarea name="address" class="form-control" rows="2" required>${employee.address}</textarea>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Department:</label>
                                    <input type="text" name="department" class="form-control" value="${employee.department}" placeholder="e.g. IT, HR, Sales" required />
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Designation:</label>
                                    <input type="text" name="designation" class="form-control" value="${employee.designation}" placeholder="e.g. Software Engineer" required />
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Date of Joining:</label>
                                    <input type="date" name="dateOfJoining" class="form-control" value="${employee.dateOfJoining}" required />
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Salary ($):</label>
                                    <input type="number" step="0.01" name="salary" class="form-control" value="${employee.salary}" required min="0" />
                                </div>
                            </div>

                            <div class="d-flex justify-content-between">
                                <a href="${pageContext.request.contextPath}/employees" class="btn btn-secondary">Back to List</a>
                                <button type="submit" class="btn btn-success">Save Employee</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
