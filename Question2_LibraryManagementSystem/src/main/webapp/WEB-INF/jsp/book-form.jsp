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
                    <div class="card-header bg-success text-white">
                        <h4 class="mb-0">${actionTitle}</h4>
                    </div>
                    <div class="card-body">
                        <form action="${pageContext.request.contextPath}/books/save" method="post">
                            <input type="hidden" name="bookId" value="${book.bookId}" />

                            <div class="mb-3">
                                <label class="form-label">Book Title:</label>
                                <input type="text" name="title" class="form-control" value="${book.title}" required />
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Author:</label>
                                    <input type="text" name="author" class="form-control" value="${book.author}" required />
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Publisher:</label>
                                    <input type="text" name="publisher" class="form-control" value="${book.publisher}" required />
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">ISBN:</label>
                                    <input type="text" name="isbn" class="form-control" value="${book.isbn}" required />
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Edition:</label>
                                    <input type="text" name="edition" class="form-control" value="${book.edition}" placeholder="e.g. 3rd Edition" required />
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-4 mb-3">
                                    <label class="form-label">Publication Year:</label>
                                    <input type="number" name="publicationYear" class="form-control" value="${book.publicationYear}" required min="1800" max="2100" />
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label class="form-label">Category:</label>
                                    <input type="text" name="category" class="form-control" value="${book.category}" placeholder="e.g. Computer Science" required />
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label class="form-label">Available Copies:</label>
                                    <input type="number" name="availableCopies" class="form-control" value="${book.availableCopies}" required min="0" />
                                </div>
                            </div>

                            <div class="d-flex justify-content-between">
                                <a href="${pageContext.request.contextPath}/books" class="btn btn-secondary">Back to List</a>
                                <button type="submit" class="btn btn-success">Save Book</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
