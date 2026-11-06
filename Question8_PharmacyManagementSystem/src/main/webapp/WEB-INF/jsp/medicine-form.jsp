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
                        <c:if test="${not empty errorMessage}">
                            <div class="alert alert-danger">${errorMessage}</div>
                        </c:if>

                        <form action="${pageContext.request.contextPath}/medicines/save" method="post">
                            <input type="hidden" name="medicineId" value="${medicine.medicineId}" />

                            <div class="mb-3">
                                <label class="form-label">Medicine Name:</label>
                                <input type="text" name="medicineName" class="form-control" value="${medicine.medicineName}" placeholder="e.g. Paracetamol 500mg" required />
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Category:</label>
                                    <input type="text" name="category" class="form-control" value="${medicine.category}" placeholder="e.g. Analgesic, Antibiotic" required />
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Manufacturer:</label>
                                    <input type="text" name="manufacturer" class="form-control" value="${medicine.manufacturer}" required />
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-4 mb-3">
                                    <label class="form-label">Batch Number:</label>
                                    <input type="text" name="batchNumber" class="form-control" value="${medicine.batchNumber}" placeholder="e.g. BATCH-2024" required />
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label class="form-label">Price ($):</label>
                                    <input type="number" step="0.01" min="0" name="price" class="form-control" value="${medicine.price}" required />
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label class="form-label">Stock Quantity:</label>
                                    <input type="number" min="0" name="quantity" class="form-control" value="${medicine.quantity}" placeholder="Cannot be negative" required />
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Manufacturing Date:</label>
                                    <input type="date" name="manufacturingDate" class="form-control" value="${medicine.manufacturingDate}" required />
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Expiry Date:</label>
                                    <input type="date" name="expiryDate" class="form-control" value="${medicine.expiryDate}" required />
                                </div>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Supplier Name:</label>
                                <input type="text" name="supplierName" class="form-control" value="${medicine.supplierName}" required />
                            </div>

                            <div class="d-flex justify-content-between">
                                <a href="${pageContext.request.contextPath}/medicines" class="btn btn-secondary">Back to List</a>
                                <button type="submit" class="btn btn-primary">Save Medicine</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
