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
                    <div class="card-header bg-warning text-dark">
                        <h4 class="mb-0">${actionTitle}</h4>
                    </div>
                    <div class="card-body">
                        <form action="${pageContext.request.contextPath}/products/save" method="post">
                            <input type="hidden" name="productId" value="${product.productId}" />

                            <div class="mb-3">
                                <label class="form-label">Product Name:</label>
                                <input type="text" name="productName" class="form-control" value="${product.productName}" required />
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Category:</label>
                                    <input type="text" name="category" class="form-control" value="${product.category}" placeholder="e.g. Electronics, Grocery" required />
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Brand:</label>
                                    <input type="text" name="brand" class="form-control" value="${product.brand}" required />
                                </div>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Description:</label>
                                <textarea name="description" class="form-control" rows="2">${product.description}</textarea>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Price ($):</label>
                                    <input type="number" step="0.01" name="price" class="form-control" value="${product.price}" required min="0" />
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Quantity:</label>
                                    <input type="number" name="quantity" class="form-control" value="${product.quantity}" required min="0" />
                                </div>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Supplier Name:</label>
                                <input type="text" name="supplierName" class="form-control" value="${product.supplierName}" required />
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Manufacturing Date:</label>
                                    <input type="date" name="manufacturingDate" class="form-control" value="${product.manufacturingDate}" required />
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Expiry Date:</label>
                                    <input type="date" name="expiryDate" class="form-control" value="${product.expiryDate}" required />
                                </div>
                            </div>

                            <div class="d-flex justify-content-between">
                                <a href="${pageContext.request.contextPath}/products" class="btn btn-secondary">Back to List</a>
                                <button type="submit" class="btn btn-success">Save Product</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
