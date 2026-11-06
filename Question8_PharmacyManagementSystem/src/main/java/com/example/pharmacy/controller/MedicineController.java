package com.example.pharmacy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.pharmacy.entity.Medicine;
import com.example.pharmacy.service.MedicineService;

@Controller
public class MedicineController {

    @Autowired
    private MedicineService medicineService;

    // 1. View All Medicines in a JSP table
    @GetMapping({"/", "/medicines"})
    public String viewMedicinesPage(Model model) {
        model.addAttribute("medicines", medicineService.getAllMedicines());
        return "medicine-list";
    }

    // 2. Show form to add new medicine
    @GetMapping("/medicines/new")
    public String showNewMedicineForm(Model model) {
        model.addAttribute("medicine", new Medicine());
        model.addAttribute("actionTitle", "Add New Medicine");
        return "medicine-form";
    }

    // 3. Add / Save medicine details with validation (prevent negative stock)
    @PostMapping("/medicines/save")
    public String saveMedicine(@ModelAttribute("medicine") Medicine medicine, Model model) {
        String validation = medicineService.validateMedicine(medicine);
        if (!validation.equals("VALID")) {
            model.addAttribute("errorMessage", validation);
            model.addAttribute("medicine", medicine);
            model.addAttribute("actionTitle", medicine.getMedicineId() != null ? "Update Medicine Details" : "Add New Medicine");
            return "medicine-form";
        }

        medicineService.saveMedicine(medicine);
        return "redirect:/medicines";
    }

    // 4. Update medicine details (show edit form)
    @GetMapping("/medicines/edit/{id}")
    public String showEditMedicineForm(@PathVariable("id") Long id, Model model) {
        Medicine medicine = medicineService.getMedicineById(id);
        if (medicine != null) {
            model.addAttribute("medicine", medicine);
            model.addAttribute("actionTitle", "Update Medicine Details");
            return "medicine-form";
        }
        return "redirect:/medicines";
    }

    // 5. Delete medicine using Medicine ID
    @GetMapping("/medicines/delete/{id}")
    public String deleteMedicine(@PathVariable("id") Long id) {
        medicineService.deleteMedicine(id);
        return "redirect:/medicines";
    }

    // 6. Search Medicines: Find medicines using Medicine ID or Medicine Name
    @GetMapping("/medicines/search")
    public String searchMedicines(@RequestParam(value = "keyword", required = false) String keyword, Model model) {
        if (keyword == null || keyword.trim().isEmpty()) {
            return "redirect:/medicines";
        }
        List<Medicine> list = medicineService.searchMedicines(keyword.trim());
        if (list.isEmpty()) {
            model.addAttribute("errorMessage", "No medicines found matching: " + keyword);
        }
        model.addAttribute("medicines", list);
        model.addAttribute("searchKeyword", keyword);
        return "medicine-list";
    }
}
