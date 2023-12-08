package com.example.bai1.service.impl;

import com.example.bai1.model.Author;
import com.example.bai1.model.Category;
import com.example.bai1.repo.ICategoryRepo;
import com.example.bai1.repo.impl.CategoryRepoImpl;
import com.example.bai1.service.ICategoryService;

import java.util.List;

public class CategoryServiceImpl implements ICategoryService {
    private ICategoryRepo iCategoryRepo = new CategoryRepoImpl();
    @Override
    public List<Category> display() {
        return iCategoryRepo.display();
    }
}
