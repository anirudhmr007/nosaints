package com.example.donor.service;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.donor.entity.BloodDonor;
import com.example.donor.repository.BloodDonorRepository;

@Service
public class BloodDonorService {

    @Autowired
    private BloodDonorRepository donorRepository;

    public List<BloodDonor> getAllDonors() {
        return donorRepository.findAll();
    }

    public BloodDonor getDonorById(Long id) {
        Optional<BloodDonor> optional = donorRepository.findById(id);
        return optional.orElse(null);
    }

    public List<BloodDonor> searchByBloodGroup(String bloodGroup) {
        return donorRepository.findByBloodGroupIgnoreCase(bloodGroup.trim());
    }

    // Validation for age, health status, and donation eligibility
    public String validateDonor(BloodDonor donor) {
        // 1. Age validation: must be between 18 and 65
        if (donor.getAge() == null || donor.getAge() < 18 || donor.getAge() > 65) {
            return "Validation Error: Donor age must be between 18 and 65 years to donate blood.";
        }

        // 2. Health status validation: must be "Fit"
        if (donor.getHealthStatus() == null || !donor.getHealthStatus().equalsIgnoreCase("Fit")) {
            return "Validation Error: Donor health status must be 'Fit' for blood donation.";
        }

        // 3. Donation eligibility validation: at least 90 days must have passed since last donation
        if (donor.getLastDonationDate() != null && !donor.getLastDonationDate().trim().isEmpty()) {
            try {
                LocalDate lastDate = LocalDate.parse(donor.getLastDonationDate().trim());
                long daysSinceLastDonation = ChronoUnit.DAYS.between(lastDate, LocalDate.now());
                if (daysSinceLastDonation < 90) {
                    return "Validation Error: Donor is not currently eligible. At least 90 days are required between blood donations (Only " + daysSinceLastDonation + " days elapsed).";
                }
            } catch (Exception e) {
                // If invalid date format
            }
        }

        return "VALID";
    }

    public BloodDonor saveDonor(BloodDonor donor) {
        return donorRepository.save(donor);
    }

    public void deleteDonor(Long id) {
        donorRepository.deleteById(id);
    }
}
