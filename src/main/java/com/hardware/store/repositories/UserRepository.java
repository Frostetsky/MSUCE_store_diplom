package com.hardware.store.repositories;


import com.hardware.store.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;


public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);

    @Query(value = "SELECT company_name FROM users Group by company_name", nativeQuery = true)
    public List<String> findAllCompaniesNames();
}