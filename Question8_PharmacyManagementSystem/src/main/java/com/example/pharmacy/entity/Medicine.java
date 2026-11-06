package com.example.pharmacy.entity;

import java.time.LocalDate;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "medicines")
public class Medicine {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long medicineId;

    private String medicineName;
    private String category;
    private String manufacturer;
    private String batchNumber;
    private Double price;
    private Integer quantity;
    private String manufacturingDate;
    private String expiryDate;
    private String supplierName;

    public Medicine() {
    }

    public Medicine(Long medicineId, String medicineName, String category, String manufacturer, String batchNumber, Double price, Integer quantity, String manufacturingDate, String expiryDate, String supplierName) {
        this.medicineId = medicineId;
        this.medicineName = medicineName;
        this.category = category;
        this.manufacturer = manufacturer;
        this.batchNumber = batchNumber;
        this.price = price;
        this.quantity = quantity;
        this.manufacturingDate = manufacturingDate;
        this.expiryDate = expiryDate;
        this.supplierName = supplierName;
    }

    public Long getMedicineId() {
        return medicineId;
    }

    public void setMedicineId(Long medicineId) {
        this.medicineId = medicineId;
    }

    public String getMedicineName() {
        return medicineName;
    }

    public void setMedicineName(String medicineName) {
        this.medicineName = medicineName;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }

    public String getBatchNumber() {
        return batchNumber;
    }

    public void setBatchNumber(String batchNumber) {
        this.batchNumber = batchNumber;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public String getManufacturingDate() {
        return manufacturingDate;
    }

    public void setManufacturingDate(String manufacturingDate) {
        this.manufacturingDate = manufacturingDate;
    }

    public String getExpiryDate() {
        return expiryDate;
    }

    public void setExpiryDate(String expiryDate) {
        this.expiryDate = expiryDate;
    }

    public String getSupplierName() {
        return supplierName;
    }

    public void setSupplierName(String supplierName) {
        this.supplierName = supplierName;
    }

    // Helper method to identify expired medicines
    public boolean isExpired() {
        if (expiryDate == null || expiryDate.trim().isEmpty()) {
            return false;
        }
        try {
            LocalDate exp = LocalDate.parse(expiryDate.trim());
            return exp.isBefore(LocalDate.now());
        } catch (Exception e) {
            return false;
        }
    }
}
