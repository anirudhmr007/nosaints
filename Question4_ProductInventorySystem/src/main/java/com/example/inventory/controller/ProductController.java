package com.example.inventory.controller;

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

import com.example.inventory.entity.Product;
import com.example.inventory.service.ProductService;

@Controller
public class ProductController {

    @Autowired
    private ProductService productService;

    // 1. Display all registered products in a JSP table
    @GetMapping({"/", "/products"})
    public String viewProductsPage(Model model) {
        model.addAttribute("products", productService.getAllProducts());
        return "product-list";
    }

    // 2. Show form to add new product
    @GetMapping("/products/new")
    public String showNewProductForm(Model model) {
        model.addAttribute("product", new Product());
        model.addAttribute("actionTitle", "Add New Product");
        return "product-form";
    }

    // 3. Save product details (Add & Update)
    @PostMapping("/products/save")
    public String saveProduct(@ModelAttribute("product") Product product) {
        productService.saveProduct(product);
        return "redirect:/products";
    }

    // 4. Show form to update product details
    @GetMapping("/products/edit/{id}")
    public String showEditProductForm(@PathVariable("id") Long id, Model model) {
        Product product = productService.getProductById(id);
        if (product != null) {
            model.addAttribute("product", product);
            model.addAttribute("actionTitle", "Update Product Details");
            return "product-form";
        }
        return "redirect:/products";
    }

    // 5. Delete a product record using Product ID
    @GetMapping("/products/delete/{id}")
    public String deleteProduct(@PathVariable("id") Long id) {
        productService.deleteProduct(id);
        return "redirect:/products";
    }

    // 6. Search for a product using Product ID
    @GetMapping("/products/search")
    public String searchProduct(@RequestParam(value = "searchId", required = false) Long searchId, Model model) {
        if (searchId == null) {
            return "redirect:/products";
        }
        Product product = productService.getProductById(searchId);
        List<Product> list = new ArrayList<>();
        if (product != null) {
            list.add(product);
        } else {
            model.addAttribute("message", "No product found with Product ID: " + searchId);
        }
        model.addAttribute("products", list);
        return "product-list";
    }
}
