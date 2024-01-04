package com.example.demo.controller;


import com.example.demo.model.NhanVien;
import com.example.demo.model.TaiKhoan;
import com.example.demo.service.nhanvienservice.INhanVienService;
import com.example.demo.service.nhanvienservice.NhanVienService;
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
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebServlet(name = "NhanVienServlet", value = "/nhan-vien-servlet")
public class NhanVienServlet extends HttpServlet {
    private INhanVienService nhanVienService = new NhanVienService();
    private ITaiKhoanService taiKhoanService = new TaiKhoanService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession httpSession = request.getSession(false);
        if (httpSession.getAttribute("loai_tai_khoan").equals("admin")) {
            String action = request.getParameter("action");
            if (action == null) {
                action = "";
            }
            switch (action) {
                case "edit":
                    showEditEmployee(request, response);
                    break;
                default:
                    displayEmployee(request, response);
                    break;

            }
        }else {
            response.sendRedirect("/error-access");
        }
    }

    protected void editEmployee(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        int idtk = Integer.parseInt(request.getParameter("tk"));
        System.out.println(idtk);
        TaiKhoan taiKhoan = taiKhoanService.findById(idtk);
        NhanVien nhanVien = new NhanVien(id, name, phone, taiKhoan);
        nhanVienService.update(nhanVien);
        try {
            response.sendRedirect("/nhan-vien-servlet");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    protected void deleteEmployee(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        nhanVienService.remove(id);
        try {
            response.sendRedirect("nhan-vien-servlet");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession httpSession = request.getSession(false);
        if (httpSession.getAttribute("loai_tai_khoan").equals("admin")) {
            String action = request.getParameter("action");
            if (action == null) {
                action = "";
            }
            switch (action) {
                case "add":
                    addEmployee(request, response);
                    break;
                case "edit":
                    editEmployee(request, response);
                    break;
                case "delete":
                    deleteEmployee(request, response);
                    break;
                default:
                    displayEmployee(request, response);
                    break;

            }
        }else {
            response.sendRedirect("/error-access");

        }
    }

    private void showEditEmployee(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        NhanVien nhanVien = nhanVienService.findById(id);
        List<TaiKhoan> list = taiKhoanService.findAll();
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/sua_nhan_vien.jsp");
        request.setAttribute("nhanVien", nhanVien);
        request.setAttribute("list", list);
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void addEmployee(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        if (!isValidPhoneNumber(phone)) {
            request.setAttribute("errorPhone", "Số điện thoại không hợp lệ  !");
//            request.setAttribute();
            displayEmployee(request, response);

            return;
        }
        int idTaiKhoan = 1;
        TaiKhoan taiKhoan = taiKhoanService.findById(idTaiKhoan);
        NhanVien nhanVien = new NhanVien(name, phone, taiKhoan);
        nhanVienService.add(nhanVien);
        try {
            response.sendRedirect("/nhan-vien-servlet");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void displayEmployee(HttpServletRequest request, HttpServletResponse response) {
        List<NhanVien> list = nhanVienService.display();
        List<TaiKhoan> listtk = taiKhoanService.findAll();
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/nhan_vien.jsp");
        request.setAttribute("listEmployee", list);
        request.setAttribute("listtk", listtk);
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
    private boolean isValidPhoneNumber(String phoneNumber) {
        String phoneRegex = "^\\d{10}$";
        Pattern pattern = Pattern.compile(phoneRegex);
        Matcher matcher = pattern.matcher(phoneNumber);

        return matcher.matches();
    }

}
