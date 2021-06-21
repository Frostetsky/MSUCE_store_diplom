package com.hardware.store.repositories;

import com.hardware.store.entities.Product;
import com.hardware.store.entities.Role;
import com.hardware.store.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ProductRepository extends JpaRepository<Product, Long> {

    Product findByNameAndUser(String name, User user);

    List<Product> findProductsByUser_CompanyNameLike(String name);

    List<Product> findProductsByNameLike(String name);
}
