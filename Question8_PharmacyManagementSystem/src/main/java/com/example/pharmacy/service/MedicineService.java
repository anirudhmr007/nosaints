package com.example.pharmacy.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.pharmacy.entity.Medicine;
import com.example.pharmacy.repository.MedicineRepository;

@Service
public class MedicineService {

    @Autowired
    private MedicineRepository medicineRepository;

    public List<Medicine> getAllMedicines() {
        return medicineRepository.findAll();
    }

    public Medicine getMedicineById(Long id) {
        Optional<Medicine> optional = medicineRepository.findById(id);
        return optional.orElse(null);
    }

    // Search by ID or Name
    public List<Medicine> searchMedicines(String keyword) {
        List<Medicine> results = new ArrayList<>();
        if (keyword == null || keyword.trim().isEmpty()) {
            return results;
        }

        // Try parsing keyword as Long ID
        try {
            Long id = Long.parseLong(keyword.trim());
            Medicine med = getMedicineById(id);
            if (med != null) {
                results.add(med);
                return results;
            }
        } catch (NumberFormatException ignored) {
            // Not a numeric ID, search by Name
        }

        // Search by medicine name
        return medicineRepository.findByMedicineNameContainingIgnoreCase(keyword.trim());
    }

    // Validation: prevent negative stock quantities
    public String validateMedicine(Medicine medicine) {
        if (medicine.getQuantity() == null || medicine.getQuantity() < 0) {
            return "Validation Error: Stock quantity cannot be negative!";
        }
        if (medicine.getPrice() == null || medicine.getPrice() < 0) {
            return "Validation Error: Price cannot be negative!";
        }
        return "VALID";
    }

    public Medicine saveMedicine(Medicine medicine) {
        return medicineRepository.save(medicine);
    }

    public void deleteMedicine(Long id) {
        medicineRepository.deleteById(id);
    }
}
