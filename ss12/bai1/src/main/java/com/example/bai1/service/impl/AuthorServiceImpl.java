package com.example.bai1.service.impl;

import com.example.bai1.model.Author;
import com.example.bai1.repo.IAuthorRepo;
import com.example.bai1.repo.impl.AuthorRepoImpl;
import com.example.bai1.service.IAuthorService;

import java.util.List;

public class AuthorServiceImpl implements IAuthorService {
    private IAuthorRepo iAuthorRepo = new AuthorRepoImpl();
    @Override
    public List<Author> display() {
        return iAuthorRepo.display();
    }
}
