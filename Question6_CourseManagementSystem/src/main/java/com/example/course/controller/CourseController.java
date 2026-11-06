package com.example.course.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.course.entity.Course;
import com.example.course.service.CourseService;

@Controller
public class CourseController {

    @Autowired
    private CourseService courseService;

    // 1. Display all available courses in a JSP table
    @GetMapping({"/", "/courses"})
    public String viewCoursesPage(Model model) {
        model.addAttribute("courses", courseService.getAllCourses());
        return "course-list";
    }

    // 2. Show form to add new course
    @GetMapping("/courses/new")
    public String showNewCourseForm(Model model) {
        model.addAttribute("course", new Course());
        model.addAttribute("actionTitle", "Add New Course");
        return "course-form";
    }

    // 3. Save course details (Add & Update)
    @PostMapping("/courses/save")
    public String saveCourse(@ModelAttribute("course") Course course) {
        courseService.saveCourse(course);
        return "redirect:/courses";
    }

    // 4. Show form to update course details
    @GetMapping("/courses/edit/{id}")
    public String showEditCourseForm(@PathVariable("id") Long id, Model model) {
        Course course = courseService.getCourseById(id);
        if (course != null) {
            model.addAttribute("course", course);
            model.addAttribute("actionTitle", "Update Course Details");
            return "course-form";
        }
        return "redirect:/courses";
    }

    // 5. Delete a course record using Course ID
    @GetMapping("/courses/delete/{id}")
    public String deleteCourse(@PathVariable("id") Long id) {
        courseService.deleteCourse(id);
        return "redirect:/courses";
    }

    // 6. Search for a course using Course ID
    @GetMapping("/courses/search")
    public String searchCourse(@RequestParam(value = "searchId", required = false) Long searchId, Model model) {
        if (searchId == null) {
            return "redirect:/courses";
        }
        Course course = courseService.getCourseById(searchId);
        List<Course> list = new ArrayList<>();
        if (course != null) {
            list.add(course);
        } else {
            model.addAttribute("errorMessage", "No course found with Course ID: " + searchId);
        }
        model.addAttribute("courses", list);
        return "course-list";
    }

    // 7. Register a student for a course with validation (capacity & duplicates)
    @PostMapping("/courses/registerStudent")
    public String registerStudent(@RequestParam("courseId") Long courseId,
                                  @RequestParam("studentRollNumber") String studentRollNumber,
                                  @RequestParam("studentName") String studentName,
                                  Model model) {
        String result = courseService.registerStudentToCourse(courseId, studentRollNumber.trim(), studentName.trim());
        if (result.startsWith("SUCCESS")) {
            model.addAttribute("successMessage", result);
        } else {
            model.addAttribute("errorMessage", result);
        }
        model.addAttribute("courses", courseService.getAllCourses());
        return "course-list";
    }
}
