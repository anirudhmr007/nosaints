package com.example.hospital.controller;

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

import com.example.hospital.entity.Patient;
import com.example.hospital.service.PatientService;

@Controller
public class PatientController {

    @Autowired
    private PatientService patientService;

    // 1. Display all patients
    @GetMapping({"/", "/patients"})
    public String viewPatientsPage(Model model) {
        model.addAttribute("patients", patientService.getAllPatients());
        return "patient-list";
    }

    // 2. Show form to register new patient
    @GetMapping("/patients/new")
    public String showNewPatientForm(Model model) {
        model.addAttribute("patient", new Patient());
        model.addAttribute("actionTitle", "Register New Patient");
        return "patient-form";
    }

    // 3. Save patient (Handles both Register & Update)
    @PostMapping("/patients/save")
    public String savePatient(@ModelAttribute("patient") Patient patient) {
        patientService.savePatient(patient);
        return "redirect:/patients";
    }

    // 4. Show form to update patient
    @GetMapping("/patients/edit/{id}")
    public String showEditPatientForm(@PathVariable("id") Long id, Model model) {
        Patient patient = patientService.getPatientById(id);
        if (patient != null) {
            model.addAttribute("patient", patient);
            model.addAttribute("actionTitle", "Update Patient Details");
            return "patient-form";
        }
        return "redirect:/patients";
    }

    // 5. Delete patient record
    @GetMapping("/patients/delete/{id}")
    public String deletePatient(@PathVariable("id") Long id) {
        patientService.deletePatient(id);
        return "redirect:/patients";
    }

    // 6. Search patient using Patient ID
    @GetMapping("/patients/search")
    public String searchPatient(@RequestParam(value = "searchId", required = false) Long searchId, Model model) {
        if (searchId == null) {
            return "redirect:/patients";
        }
        Patient patient = patientService.getPatientById(searchId);
        List<Patient> list = new ArrayList<>();
        if (patient != null) {
            list.add(patient);
        } else {
            model.addAttribute("message", "No patient found with ID: " + searchId);
        }
        model.addAttribute("patients", list);
        return "patient-list";
    }
}
