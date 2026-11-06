package com.example.course.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.course.entity.Course;
import com.example.course.entity.StudentCourseRegistration;
import com.example.course.repository.CourseRepository;
import com.example.course.repository.RegistrationRepository;

@Service
public class CourseService {

    @Autowired
    private CourseRepository courseRepository;

    @Autowired
    private RegistrationRepository registrationRepository;

    public List<Course> getAllCourses() {
        return courseRepository.findAll();
    }

    public Course getCourseById(Long id) {
        Optional<Course> optional = courseRepository.findById(id);
        return optional.orElse(null);
    }

    public Course saveCourse(Course course) {
        if (course.getEnrolledStudents() == null) {
            course.setEnrolledStudents(0);
        }
        return courseRepository.save(course);
    }

    public void deleteCourse(Long id) {
        courseRepository.deleteById(id);
    }

    // Register student with duplicate check & capacity validation
    public String registerStudentToCourse(Long courseId, String rollNumber, String studentName) {
        Course course = getCourseById(courseId);
        if (course == null) {
            return "Registration Error: Course not found!";
        }

        // Validation 1: Prevent duplicate student registrations for the same course
        if (registrationRepository.existsByCourseIdAndStudentRollNumber(courseId, rollNumber)) {
            return "Validation Error: Student (" + rollNumber + ") is ALREADY registered for " + course.getCourseName() + "!";
        }

        // Validation 2: Prevent registrations when course capacity is full
        long currentCount = registrationRepository.countByCourseId(courseId);
        if (currentCount >= course.getCourseCapacity()) {
            return "Validation Error: Cannot register! Course capacity is FULL (" + course.getCourseCapacity() + "/" + course.getCourseCapacity() + ").";
        }

        // Save registration and update count
        StudentCourseRegistration registration = new StudentCourseRegistration(courseId, rollNumber, studentName);
        registrationRepository.save(registration);

        course.setEnrolledStudents((int) (currentCount + 1));
        courseRepository.save(course);

        return "SUCCESS: Successfully registered " + studentName + " (" + rollNumber + ") to " + course.getCourseName() + "!";
    }
}
