package com.example.course.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.course.entity.StudentCourseRegistration;

@Repository
public interface RegistrationRepository extends JpaRepository<StudentCourseRegistration, Long> {
    boolean existsByCourseIdAndStudentRollNumber(Long courseId, String studentRollNumber);
    long countByCourseId(Long courseId);
}
