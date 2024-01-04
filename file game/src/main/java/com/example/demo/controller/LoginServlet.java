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

@WebServlet(name = "LoginServlet", value = {
        "/login",
        "/logout",
        "/error-access",
})
public class LoginServlet extends HttpServlet {

    private final ITaiKhoanService taiKhoanService = new TaiKhoanService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String url = request.getRequestURI();
        if (url.endsWith("/login")) {
            showLogInForm(request, response);
        } else if (url.endsWith("/logout")) {
            logOut(request, response);
        } else if (url.endsWith("/error-access")) {
            errorAccess(request, response);
        }

    }

    private void errorAccess(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/error-access.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void logOut(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        session.invalidate();
        try {
            response.sendRedirect("/login");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showLogInForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/login.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = request.getRequestURI();
        if (url.endsWith("/signup")) {
            saveInfoSignUp(request, response);
        } else if (url.endsWith("/login")) {
            checkLogIn(request, response);
        }
    }

    private void checkLogIn(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        if (taiKhoanService.findByUsername(username) == null) {
            req.setAttribute("errorUsername", "Không tồn tại tài khoản này trong hệ thống");
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/login.jsp");
            requestDispatcher.forward(req, resp);
        } else {
            TaiKhoan taiKhoan = taiKhoanService.findByUsernameAndPassWord(username, password);
            if (taiKhoan == null) {
                req.setAttribute("errorPassword", "Mật khẩu không chính xác !");
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("/login.jsp");
                requestDispatcher.forward(req, resp);
            } else {
                HttpSession session = req.getSession();
                session.setAttribute("username", username);
                session.setAttribute("loai_tai_khoan", taiKhoan.getLoaiTaiKhoan());
                if (session.getAttribute("loai_tai_khoan").equals("admin")) {
                    resp.sendRedirect("home-servlet");
                } else
                    resp.sendRedirect("home-servlet");
            }
        }

    }

    private void saveInfoSignUp(HttpServletRequest request, HttpServletResponse response) {
    }
}
