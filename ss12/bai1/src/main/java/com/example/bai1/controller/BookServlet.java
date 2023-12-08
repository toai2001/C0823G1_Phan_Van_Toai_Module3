package com.example.bai1.controller;

import com.example.bai1.model.Author;
import com.example.bai1.model.Book;
import com.example.bai1.model.Category;
import com.example.bai1.repo.IBook;
import com.example.bai1.service.IAuthorService;
import com.example.bai1.service.IBookService;
import com.example.bai1.service.ICategoryService;
import com.example.bai1.service.impl.AuthorServiceImpl;
import com.example.bai1.service.impl.BookServiceImpl;
import com.example.bai1.service.impl.CategoryServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "BookServlet", value = "/book")
public class BookServlet extends HttpServlet {
    private IBookService iBookService = new BookServiceImpl();
    private ICategoryService iCategoryService = new CategoryServiceImpl();
    private IAuthorService iAuthorService = new AuthorServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                fromCreate(request, response);
                break;
            case "update":
                formUpdate(request, response);
                break;
            default:
                display(request, response);
        }
    }

    private void formUpdate(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Book book = iBookService.findById(id);
        request.setAttribute("book", book);
        request.setAttribute("categoryId", iCategoryService.display());
        request.setAttribute("authorId", iAuthorService.display());
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("update.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void fromCreate(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("categoryId", iCategoryService.display());
        request.setAttribute("authorId", iAuthorService.display());
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("create.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void display(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("bookList", iBookService.display());
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("display.jsp");
        try {

            requestDispatcher.forward(request, response);

        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                create(request, response);
                break;
            case "remove":
                remove(request, response);
                break;
            case "update":
                update(request, response);
                break;

        }
    }

    private void update(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("bookTile");
        int pageSize = Integer.parseInt(request.getParameter("bookPageSize"));
        int authorId = Integer.parseInt(request.getParameter("authorId"));
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));

        Book book = new Book(id, title, pageSize, new Author(authorId), new Category(categoryId));
        iBookService.update(book);
        try {
            response.sendRedirect("/book");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }

    private void remove(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        iBookService.remove(id);
        response.sendRedirect("/book");


    }

    private void create(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String bookTile = request.getParameter("bookTile");
        int bookPageSize = Integer.parseInt(request.getParameter("bookPageSize"));
        int authorId = Integer.parseInt(request.getParameter("authorId"));
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        iBookService.addBook(new Book(bookTile, bookPageSize, new Author(authorId), new Category(categoryId)));
        response.sendRedirect("/book");
    }
}
