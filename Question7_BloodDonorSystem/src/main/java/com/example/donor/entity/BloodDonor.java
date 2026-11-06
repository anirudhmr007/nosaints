package com.example.donor.entity;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "blood_donors")
public class BloodDonor {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long donorId;

    private String name;
    private Integer age;
    private String gender;
    private String bloodGroup;
    private String contactNumber;
    private String email;
    private String address;
    private String lastDonationDate; // format: YYYY-MM-DD or empty
    private String healthStatus;    // "Fit" or "Unfit"

    public BloodDonor() {
    }

    public BloodDonor(Long donorId, String name, Integer age, String gender, String bloodGroup, String contactNumber, String email, String address, String lastDonationDate, String healthStatus) {
        this.donorId = donorId;
        this.name = name;
        this.age = age;
        this.gender = gender;
        this.bloodGroup = bloodGroup;
        this.contactNumber = contactNumber;
        this.email = email;
        this.address = address;
        this.lastDonationDate = lastDonationDate;
        this.healthStatus = healthStatus;
    }

    public Long getDonorId() {
        return donorId;
    }

    public void setDonorId(Long donorId) {
        this.donorId = donorId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getBloodGroup() {
        return bloodGroup;
    }

    public void setBloodGroup(String bloodGroup) {
        this.bloodGroup = bloodGroup;
    }

    public String getContactNumber() {
        return contactNumber;
    }

    public void setContactNumber(String contactNumber) {
        this.contactNumber = contactNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getLastDonationDate() {
        return lastDonationDate;
    }

    public void setLastDonationDate(String lastDonationDate) {
        this.lastDonationDate = lastDonationDate;
    }

    public String getHealthStatus() {
        return healthStatus;
    }

    public void setHealthStatus(String healthStatus) {
        this.healthStatus = healthStatus;
    }

    // Helper for donation eligibility check
    public boolean isEligible() {
        if (age == null || age < 18 || age > 65) {
            return false;
        }
        if (healthStatus == null || !healthStatus.equalsIgnoreCase("Fit")) {
            return false;
        }
        if (lastDonationDate != null && !lastDonationDate.trim().isEmpty()) {
            try {
                LocalDate lastDate = LocalDate.parse(lastDonationDate.trim());
                long days = ChronoUnit.DAYS.between(lastDate, LocalDate.now());
                if (days < 90) {
                    return false;
                }
            } catch (Exception e) {
                // If parse fails, assume eligible or continue
            }
        }
        return true;
    }
}
