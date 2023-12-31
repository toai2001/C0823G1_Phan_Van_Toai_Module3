package com.example.bai1.controller;

import com.example.bai1.model.Book;
import com.example.bai1.service.IBookService;
import com.example.bai1.service.impl.BookServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "BookServlet", value = "/book")

public class BookServlet extends HttpServlet {
    private IBookService iBookService = new BookServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "showformcreate":
                showformcreate(request,response);
                break;
            case "delete":
                remove(request,response);
                break;
            case "findById":
                findById(request,response);
                break;
            default:
                display(request, response);
        }


    }

    private void findById(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Book book = iBookService.findById(id);
        request.setAttribute("book",book);
        try{
            request.getRequestDispatcher("update.jsp").forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }

    private void remove(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        iBookService.removeBook(id);
        try {
            response.sendRedirect("/book");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showformcreate(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/create.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void display(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Book> bookList = iBookService.display();
        request.setAttribute("bookList", bookList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/display.jsp");
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                create(request, response);
                break;
            case "update":
                update(request,response);
//            case "search":
//                search(request,response);

        }
    }

//    private void search(HttpServletRequest request, HttpServletResponse response) {
//        String tile = request.getParameter("tile");
//        List<Book> bookList = iBookService.searchBook(tile);
//        try {
//            request.setAttribute("bookList", bookList);
//            request.getRequestDispatcher("search.jsp").forward(request, response);
//        } catch (ServletException | IOException e) {
//            throw new RuntimeException(e);
//        }
//    }

    private void update(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("tile");
        int price = Integer.parseInt(request.getParameter("pageSize"));
        String description = request.getParameter("author");
        String supplier = request.getParameter("category");
        iBookService.updateBook(id,name,price,description,supplier);
        try {
            response.sendRedirect("/book");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void create(HttpServletRequest request, HttpServletResponse response) {
        String tile = request.getParameter("tile");
        int pageSize = Integer.parseInt(request.getParameter("pageSize"));
        String author = request.getParameter("author");
        String category = request.getParameter("category");
        iBookService.addBook(new Book(tile, pageSize, author, category));

        try {
            response.sendRedirect("/book");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
