package com.hardware.store.services;

import com.hardware.store.entities.Product;
import com.hardware.store.entities.Role;
import com.hardware.store.entities.User;
import com.hardware.store.repositories.ProductRepository;
import com.hardware.store.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;
import java.util.Objects;

@Service
public class ProductService {

    @Autowired
    ProductRepository productRepository;

    public boolean saveProduct(Product product) {
        Product productFromDB = productRepository.findByNameAndUser(product.getName(),product.getUser());

        if (Objects.nonNull(productFromDB)) {
            return false;
        }

        productRepository.save(product);
        return true;
    }

    public void deleteProduct(Long id) {
        productRepository.deleteById(id);
    }

    public List<Product> findAll() {
        return productRepository.findAll();
    }

    public List<Product> findAllByCompanyName(String name) {
        return productRepository.findProductsByUser_CompanyNameLike(name);
    }

    public List<Product> findAllByName(String name) {
        return productRepository.findProductsByNameLike(name);
    }
}
