package com.example.donor.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.donor.entity.BloodDonor;

@Repository
public interface BloodDonorRepository extends JpaRepository<BloodDonor, Long> {
    List<BloodDonor> findByBloodGroupIgnoreCase(String bloodGroup);
}
