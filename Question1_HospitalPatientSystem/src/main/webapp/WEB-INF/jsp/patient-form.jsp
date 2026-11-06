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
                    <div class="card-header bg-primary text-white">
                        <h4 class="mb-0">${actionTitle}</h4>
                    </div>
                    <div class="card-body">
                        <form action="${pageContext.request.contextPath}/patients/save" method="post">
                            <!-- Hidden ID field for update -->
                            <input type="hidden" name="patientId" value="${patient.patientId}" />

                            <div class="mb-3">
                                <label class="form-label">Full Name:</label>
                                <input type="text" name="name" class="form-control" value="${patient.name}" required />
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Age:</label>
                                    <input type="number" name="age" class="form-control" value="${patient.age}" required min="0" max="130" />
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Gender:</label>
                                    <select name="gender" class="form-select" required>
                                        <option value="">-- Select Gender --</option>
                                        <option value="Male" ${patient.gender == 'Male' ? 'selected' : ''}>Male</option>
                                        <option value="Female" ${patient.gender == 'Female' ? 'selected' : ''}>Female</option>
                                        <option value="Other" ${patient.gender == 'Other' ? 'selected' : ''}>Other</option>
                                    </select>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Contact Number:</label>
                                    <input type="text" name="contactNumber" class="form-control" value="${patient.contactNumber}" required />
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Email:</label>
                                    <input type="email" name="email" class="form-control" value="${patient.email}" required />
                                </div>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Address:</label>
                                <textarea name="address" class="form-control" rows="2" required>${patient.address}</textarea>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Blood Group:</label>
                                <select name="bloodGroup" class="form-select" required>
                                    <option value="">-- Select Blood Group --</option>
                                    <option value="A+" ${patient.bloodGroup == 'A+' ? 'selected' : ''}>A+</option>
                                    <option value="A-" ${patient.bloodGroup == 'A-' ? 'selected' : ''}>A-</option>
                                    <option value="B+" ${patient.bloodGroup == 'B+' ? 'selected' : ''}>B+</option>
                                    <option value="B-" ${patient.bloodGroup == 'B-' ? 'selected' : ''}>B-</option>
                                    <option value="AB+" ${patient.bloodGroup == 'AB+' ? 'selected' : ''}>AB+</option>
                                    <option value="AB-" ${patient.bloodGroup == 'AB-' ? 'selected' : ''}>AB-</option>
                                    <option value="O+" ${patient.bloodGroup == 'O+' ? 'selected' : ''}>O+</option>
                                    <option value="O-" ${patient.bloodGroup == 'O-' ? 'selected' : ''}>O-</option>
                                </select>
                            </div>

                            <div class="d-flex justify-content-between">
                                <a href="${pageContext.request.contextPath}/patients" class="btn btn-secondary">Back to List</a>
                                <button type="submit" class="btn btn-success">Save Patient</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
