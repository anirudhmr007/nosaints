package com.example.employee.controller;

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

import com.example.employee.entity.Employee;
import com.example.employee.service.EmployeeService;

@Controller
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;

    // 1. Display all registered employees in a JSP table
    @GetMapping({"/", "/employees"})
    public String viewEmployeesPage(Model model) {
        model.addAttribute("employees", employeeService.getAllEmployees());
        return "employee-list";
    }

    // 2. Show form to add new employee
    @GetMapping("/employees/new")
    public String showNewEmployeeForm(Model model) {
        model.addAttribute("employee", new Employee());
        model.addAttribute("actionTitle", "Add New Employee");
        return "employee-form";
    }

    // 3. Save employee details (Add & Update)
    @PostMapping("/employees/save")
    public String saveEmployee(@ModelAttribute("employee") Employee employee) {
        employeeService.saveEmployee(employee);
        return "redirect:/employees";
    }

    // 4. Show form to update employee details
    @GetMapping("/employees/edit/{id}")
    public String showEditEmployeeForm(@PathVariable("id") Long id, Model model) {
        Employee employee = employeeService.getEmployeeById(id);
        if (employee != null) {
            model.addAttribute("employee", employee);
            model.addAttribute("actionTitle", "Update Employee Details");
            return "employee-form";
        }
        return "redirect:/employees";
    }

    // 5. Delete an employee record using Employee ID
    @GetMapping("/employees/delete/{id}")
    public String deleteEmployee(@PathVariable("id") Long id) {
        employeeService.deleteEmployee(id);
        return "redirect:/employees";
    }

    // 6. Search for an employee using Employee ID
    @GetMapping("/employees/search")
    public String searchEmployee(@RequestParam(value = "searchId", required = false) Long searchId, Model model) {
        if (searchId == null) {
            return "redirect:/employees";
        }
        Employee employee = employeeService.getEmployeeById(searchId);
        List<Employee> list = new ArrayList<>();
        if (employee != null) {
            list.add(employee);
        } else {
            model.addAttribute("message", "No employee found with Employee ID: " + searchId);
        }
        model.addAttribute("employees", list);
        return "employee-list";
    }
}
