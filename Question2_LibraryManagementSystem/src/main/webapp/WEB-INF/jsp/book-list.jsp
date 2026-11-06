<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Library Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container my-4">
        <div class="card shadow-sm mb-4">
            <div class="card-body bg-success text-white rounded-top">
                <h2 class="card-title mb-0">Library Management System</h2>
                <p class="mb-0">Spring Boot MVC + JPA + JSP + Hibernate + PostgreSQL</p>
            </div>
            <div class="card-body">
                <div class="row g-3 align-items-center mb-3">
                    <div class="col-md-6">
                        <a href="${pageContext.request.contextPath}/books/new" class="btn btn-primary">+ Add New Book</a>
                        <a href="${pageContext.request.contextPath}/books" class="btn btn-secondary">Show All Books</a>
                    </div>
                    <div class="col-md-6">
                        <!-- Search by Book ID -->
                        <form action="${pageContext.request.contextPath}/books/search" method="get" class="d-flex">
                            <input type="number" name="searchId" class="form-control me-2" placeholder="Search by Book ID" required>
                            <button type="submit" class="btn btn-outline-success">Search</button>
                        </form>
                    </div>
                </div>

                <c:if test="${not empty message}">
                    <div class="alert alert-warning">${message}</div>
                </c:if>

                <div class="table-responsive">
                    <table class="table table-bordered table-striped table-hover align-middle">
                        <thead class="table-dark">
                            <tr>
                                <th>Book ID</th>
                                <th>Title</th>
                                <th>Author</th>
                                <th>Publisher</th>
                                <th>ISBN</th>
                                <th>Edition</th>
                                <th>Year</th>
                                <th>Category</th>
                                <th>Copies</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="b" items="${books}">
                                <tr>
                                    <td><strong>${b.bookId}</strong></td>
                                    <td>${b.title}</td>
                                    <td>${b.author}</td>
                                    <td>${b.publisher}</td>
                                    <td>${b.isbn}</td>
                                    <td>${b.edition}</td>
                                    <td>${b.publicationYear}</td>
                                    <td><span class="badge bg-info text-dark">${b.category}</span></td>
                                    <td><span class="badge bg-secondary">${b.availableCopies}</span></td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/books/edit/${b.bookId}" class="btn btn-sm btn-warning">Edit</a>
                                        <a href="${pageContext.request.contextPath}/books/delete/${b.bookId}" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to delete this book?')">Delete</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            <c:if test="${empty books}">
                                <tr>
                                    <td colspan="10" class="text-center text-muted">No books found.</td>
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
