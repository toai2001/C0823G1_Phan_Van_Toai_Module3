package com.example.demo.controller;


import com.example.demo.model.TaiKhoan;
import com.example.demo.service.taikhoanservice.ITaiKhoanService;
import com.example.demo.service.taikhoanservice.TaiKhoanService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "TaiKhoanServlet", value = "/tai-khoan-servlet")
public class TaiKhoanServlet extends HttpServlet {
    private ITaiKhoanService taiKhoanService = new TaiKhoanService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession httpSession = request.getSession(false);
        if (httpSession.getAttribute("loai_tai_khoan").equals("admin")) {
            String action = request.getParameter("action");
            if (action == null) {
                action = "";
            }
            switch (action) {
                default:
                    displayAccount(request, response);

            }
        } else {
            response.sendRedirect("/error-access");
        }
    }

    protected void displayAccount(HttpServletRequest request, HttpServletResponse response) {
        List<TaiKhoan> list = taiKhoanService.findAll();
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/tai_khoan.jsp");
        request.setAttribute("list", list);
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession httpSession = request.getSession(false);
        if (httpSession.getAttribute("loai_tai_khoan").equals("admin")) {
            String action = request.getParameter("action");
            if (action == null) {
                action = "";
            }
            switch (action) {
                case "add":
                    addAccount(request, response);
                    break;
            }
        } else {
            response.sendRedirect("/error-access");
        }
    }

    protected void addAccount(HttpServletRequest request, HttpServletResponse response) {
        String tk = request.getParameter("taikhoan");
        String password = request.getParameter("pass");
        String ltk = "Nhân viên";
        taiKhoanService.createAccount(new TaiKhoan(tk, password, ltk));
        try {
            response.sendRedirect("/tai-khoan-servlet");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }


}
