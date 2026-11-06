package com.example.donor.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.donor.entity.BloodDonor;
import com.example.donor.service.BloodDonorService;

@Controller
public class BloodDonorController {

    @Autowired
    private BloodDonorService donorService;

    // 1. Display all registered blood donors in a JSP table
    @GetMapping({"/", "/donors"})
    public String viewDonorsPage(Model model) {
        model.addAttribute("donors", donorService.getAllDonors());
        return "donor-list";
    }

    // 2. Show form to register new blood donor
    @GetMapping("/donors/new")
    public String showNewDonorForm(Model model) {
        model.addAttribute("donor", new BloodDonor());
        model.addAttribute("actionTitle", "Register New Blood Donor");
        return "donor-form";
    }

    // 3. Register / Save blood donor with validation
    @PostMapping("/donors/save")
    public String saveDonor(@ModelAttribute("donor") BloodDonor donor, Model model) {
        String validationResult = donorService.validateDonor(donor);
        if (!validationResult.equals("VALID")) {
            model.addAttribute("errorMessage", validationResult);
            model.addAttribute("donor", donor);
            model.addAttribute("actionTitle", donor.getDonorId() != null ? "Update Donor Details" : "Register New Blood Donor");
            return "donor-form";
        }

        donorService.saveDonor(donor);
        return "redirect:/donors";
    }

    // 4. Show form to update donor details
    @GetMapping("/donors/edit/{id}")
    public String showEditDonorForm(@PathVariable("id") Long id, Model model) {
        BloodDonor donor = donorService.getDonorById(id);
        if (donor != null) {
            model.addAttribute("donor", donor);
            model.addAttribute("actionTitle", "Update Donor Details");
            return "donor-form";
        }
        return "redirect:/donors";
    }

    // 5. Delete a donor record using Donor ID
    @GetMapping("/donors/delete/{id}")
    public String deleteDonor(@PathVariable("id") Long id) {
        donorService.deleteDonor(id);
        return "redirect:/donors";
    }

    // 6. Search for blood donors based on Blood Group
    @GetMapping("/donors/search")
    public String searchByBloodGroup(@RequestParam(value = "bloodGroup", required = false) String bloodGroup, Model model) {
        if (bloodGroup == null || bloodGroup.trim().isEmpty()) {
            return "redirect:/donors";
        }
        List<BloodDonor> list = donorService.searchByBloodGroup(bloodGroup);
        if (list.isEmpty()) {
            model.addAttribute("errorMessage", "No donors found for Blood Group: " + bloodGroup);
        }
        model.addAttribute("donors", list);
        model.addAttribute("searchedGroup", bloodGroup);
        return "donor-list";
    }
}
