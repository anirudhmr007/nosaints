package com.example.course.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "courses")
public class Course {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long courseId;

    private String courseCode;
    private String courseName;
    private String department;
    private String facultyName;
    private Integer credits;
    private String semester;
    private Integer courseCapacity;
    private Integer enrolledStudents = 0;

    public Course() {
    }

    public Course(Long courseId, String courseCode, String courseName, String department, String facultyName, Integer credits, String semester, Integer courseCapacity, Integer enrolledStudents) {
        this.courseId = courseId;
        this.courseCode = courseCode;
        this.courseName = courseName;
        this.department = department;
        this.facultyName = facultyName;
        this.credits = credits;
        this.semester = semester;
        this.courseCapacity = courseCapacity;
        this.enrolledStudents = (enrolledStudents != null) ? enrolledStudents : 0;
    }

    public Long getCourseId() {
        return courseId;
    }

    public void setCourseId(Long courseId) {
        this.courseId = courseId;
    }

    public String getCourseCode() {
        return courseCode;
    }

    public void setCourseCode(String courseCode) {
        this.courseCode = courseCode;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getFacultyName() {
        return facultyName;
    }

    public void setFacultyName(String facultyName) {
        this.facultyName = facultyName;
    }

    public Integer getCredits() {
        return credits;
    }

    public void setCredits(Integer credits) {
        this.credits = credits;
    }

    public String getSemester() {
        return semester;
    }

    public void setSemester(String semester) {
        this.semester = semester;
    }

    public Integer getCourseCapacity() {
        return courseCapacity;
    }

    public void setCourseCapacity(Integer courseCapacity) {
        this.courseCapacity = courseCapacity;
    }

    public Integer getEnrolledStudents() {
        return enrolledStudents != null ? enrolledStudents : 0;
    }

    public void setEnrolledStudents(Integer enrolledStudents) {
        this.enrolledStudents = enrolledStudents;
    }
}
