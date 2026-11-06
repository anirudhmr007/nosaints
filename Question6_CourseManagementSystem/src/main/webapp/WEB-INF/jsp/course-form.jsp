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
                        <form action="${pageContext.request.contextPath}/courses/save" method="post">
                            <input type="hidden" name="courseId" value="${course.courseId}" />
                            <input type="hidden" name="enrolledStudents" value="${course.enrolledStudents != null ? course.enrolledStudents : 0}" />

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Course Code:</label>
                                    <input type="text" name="courseCode" class="form-control" value="${course.courseCode}" placeholder="e.g. CS101" required />
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Course Name:</label>
                                    <input type="text" name="courseName" class="form-control" value="${course.courseName}" placeholder="e.g. Data Structures" required />
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Department:</label>
                                    <input type="text" name="department" class="form-control" value="${course.department}" placeholder="e.g. Computer Science" required />
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Faculty Name:</label>
                                    <input type="text" name="facultyName" class="form-control" value="${course.facultyName}" required />
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-4 mb-3">
                                    <label class="form-label">Credits:</label>
                                    <input type="number" name="credits" class="form-control" value="${course.credits}" min="1" max="10" required />
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label class="form-label">Semester:</label>
                                    <input type="text" name="semester" class="form-control" value="${course.semester}" placeholder="e.g. Semester 3" required />
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label class="form-label">Course Capacity:</label>
                                    <input type="number" name="courseCapacity" class="form-control" value="${course.courseCapacity}" min="1" required />
                                </div>
                            </div>

                            <div class="d-flex justify-content-between">
                                <a href="${pageContext.request.contextPath}/courses" class="btn btn-secondary">Back to List</a>
                                <button type="submit" class="btn btn-success">Save Course</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
