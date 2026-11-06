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
                    <div class="card-header bg-danger text-white">
                        <h4 class="mb-0">${actionTitle}</h4>
                    </div>
                    <div class="card-body">
                        <c:if test="${not empty errorMessage}">
                            <div class="alert alert-danger">${errorMessage}</div>
                        </c:if>

                        <div class="alert alert-info small py-2 mb-3">
                            <strong>Donation Rules:</strong> Donor age must be 18–65, Health Status must be 'Fit', and Last Donation must be at least 90 days ago.
                        </div>

                        <form action="${pageContext.request.contextPath}/donors/save" method="post">
                            <input type="hidden" name="donorId" value="${donor.donorId}" />

                            <div class="mb-3">
                                <label class="form-label">Donor Name:</label>
                                <input type="text" name="name" class="form-control" value="${donor.name}" required />
                            </div>

                            <div class="row">
                                <div class="col-md-4 mb-3">
                                    <label class="form-label">Age (18 - 65):</label>
                                    <input type="number" name="age" class="form-control" value="${donor.age}" min="1" max="120" required />
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label class="form-label">Gender:</label>
                                    <select name="gender" class="form-select" required>
                                        <option value="">-- Select Gender --</option>
                                        <option value="Male" ${donor.gender == 'Male' ? 'selected' : ''}>Male</option>
                                        <option value="Female" ${donor.gender == 'Female' ? 'selected' : ''}>Female</option>
                                        <option value="Other" ${donor.gender == 'Other' ? 'selected' : ''}>Other</option>
                                    </select>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label class="form-label">Blood Group:</label>
                                    <select name="bloodGroup" class="form-select" required>
                                        <option value="">-- Blood Group --</option>
                                        <option value="A+" ${donor.bloodGroup == 'A+' ? 'selected' : ''}>A+</option>
                                        <option value="A-" ${donor.bloodGroup == 'A-' ? 'selected' : ''}>A-</option>
                                        <option value="B+" ${donor.bloodGroup == 'B+' ? 'selected' : ''}>B+</option>
                                        <option value="B-" ${donor.bloodGroup == 'B-' ? 'selected' : ''}>B-</option>
                                        <option value="AB+" ${donor.bloodGroup == 'AB+' ? 'selected' : ''}>AB+</option>
                                        <option value="AB-" ${donor.bloodGroup == 'AB-' ? 'selected' : ''}>AB-</option>
                                        <option value="O+" ${donor.bloodGroup == 'O+' ? 'selected' : ''}>O+</option>
                                        <option value="O-" ${donor.bloodGroup == 'O-' ? 'selected' : ''}>O-</option>
                                    </select>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Contact Number:</label>
                                    <input type="text" name="contactNumber" class="form-control" value="${donor.contactNumber}" required />
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Email:</label>
                                    <input type="email" name="email" class="form-control" value="${donor.email}" required />
                                </div>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Address:</label>
                                <textarea name="address" class="form-control" rows="2" required>${donor.address}</textarea>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Last Donation Date (leave blank if first time):</label>
                                    <input type="date" name="lastDonationDate" class="form-control" value="${donor.lastDonationDate}" />
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Health Status:</label>
                                    <select name="healthStatus" class="form-select" required>
                                        <option value="">-- Health Status --</option>
                                        <option value="Fit" ${donor.healthStatus == 'Fit' ? 'selected' : ''}>Fit</option>
                                        <option value="Unfit" ${donor.healthStatus == 'Unfit' ? 'selected' : ''}>Unfit</option>
                                    </select>
                                </div>
                            </div>

                            <div class="d-flex justify-content-between">
                                <a href="${pageContext.request.contextPath}/donors" class="btn btn-secondary">Back to List</a>
                                <button type="submit" class="btn btn-danger">Save Donor</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
