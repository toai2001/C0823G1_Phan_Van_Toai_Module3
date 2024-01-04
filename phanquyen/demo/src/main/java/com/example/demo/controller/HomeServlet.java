package com.example.demo.controller;

import com.example.demo.model.*;
import com.example.demo.service.dichvuservice.DichVuService;
import com.example.demo.service.dichvuservice.IDichVuService;
import com.example.demo.service.maytinhservice.IMayTinhService;
import com.example.demo.service.maytinhservice.MayTinhService;
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
import java.time.ZoneId;
import java.util.Date;
import java.util.List;

@WebServlet(name = "HomeServlet", value = "/home-servlet")
public class HomeServlet extends HttpServlet {
    private IMayTinhService computerService = new MayTinhService();
    private IDichVuService iDichVuService = new DichVuService();
    private INhanVienService nhanVienService = new NhanVienService();
    private ITaiKhoanService taiKhoanService = new TaiKhoanService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession httpSession = request.getSession(false);
        if (httpSession.getAttribute("loai_tai_khoan").equals("admin") || httpSession.getAttribute("loai_tai_khoan").equals("Nhân viên")) {
            request.setCharacterEncoding("UTF-8");
            String action = request.getParameter("action");
            if (action == null) {
                action = "";
            }
            switch (action) {
                case "orderFood":
                    orderFood(request, response);
                    break;
                case "listOrder":
                    listOrder(request, response);
                    break;
                case "orderUsed":
                    listOrderUsed(request, response);
                    break;
                default:
                    listAreRental(request, response);
            }
        } else {
            response.sendRedirect("/error-access");
        }

    }

    private void listAreRental(HttpServletRequest request, HttpServletResponse response) {
        List<BangSuDung> mayDangThue = computerService.getListAreRental();
        List<MayTinh> mayChuaThue = computerService.listNotRental();
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/View/home1.jsp");
        request.setAttribute("mayDangThue", mayDangThue);
        mayDangThue.forEach(item -> {
            Date date = Date.from(item.getGioBatDau().atZone(ZoneId.systemDefault()).toInstant());
            item.setGioBatDauDate(date);
//            Date dateEnd = Date.from(item.getGioKetThuc().atZone(ZoneId.systemDefault()).toInstant());
//            item.setGioKetThucDate(dateEnd);

        });
        request.setAttribute("mayChuaThue", mayChuaThue);
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void listOrderUsed(HttpServletRequest request, HttpServletResponse response) {
        int idMay = Integer.parseInt(request.getParameter("id"));
        int idSuDung = computerService.getIdSuDung(idMay);
        List<SuDungChiTiet> listUsed = iDichVuService.getListUsed(idSuDung);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("View/dichVuDaDung.jsp");
        request.setAttribute("listUsed", listUsed);
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }

    private void orderFood(HttpServletRequest request, HttpServletResponse response) {
        int idMay = Integer.parseInt(request.getParameter("id"));
        int idSuDung = computerService.getIdSuDung(idMay);
        List<DichVuDiKem> dichVuList = iDichVuService.getListDichVu();
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/View/home1.jsp");
        request.setAttribute("idSuDung", idSuDung);
        request.setAttribute("idMay", idMay);
        request.setAttribute("dichVuList", dichVuList);
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession httpSession = request.getSession(false);
        if (httpSession.getAttribute("loai_tai_khoan").equals("admin") || httpSession.getAttribute("loai_tai_khoan").equals("Nhân viên")) {
            String action = request.getParameter("action");
            if (action == null) {
                action = "";
            }
            switch (action) {
                case "listOrder":
                    listOrder(request, response);
                    break;
                case "addEmployee":
                    addEmployee(request,response);
                    break;
            }
        } else {
            response.sendRedirect("/error-access");

        }
    }
    private void addEmployee(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String ltk = "Nhân viên";
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String tk = request.getParameter("tk");
        String pass = request.getParameter("password");
        boolean checkUniqueAccount = taiKhoanService.createAccount(new TaiKhoan(tk,pass,ltk));
        if (checkUniqueAccount){
            int idAccount = taiKhoanService.findIdAccount(tk);
            TaiKhoan taiKhoan = new TaiKhoan(idAccount);
            NhanVien nhanVien = new NhanVien(name,phone,taiKhoan);
            nhanVienService.add(nhanVien);
        } else {

        }


////        TaiKhoan taiKhoan = taiKhoanService.findById(idTaiKhoan);
//        NhanVien nhanVien = new NhanVien(name,phone,taiKhoan);
//        nhanVienService.add(nhanVien);


        response.sendRedirect("/nhan-vien-servlet");
    }

    private void listOrder(HttpServletRequest request, HttpServletResponse response) {
        List<DichVuDiKem> list = iDichVuService.getListDichVu();
        int idMay = Integer.parseInt(request.getParameter("idMay"));
        int idSuDung = computerService.getIdSuDung(idMay);
        System.out.println(idSuDung);

        for (DichVuDiKem dichVuDiKem : list) {
            int quantity = Integer.parseInt(request.getParameter("quantity" + dichVuDiKem.getMaLoaiDichVu()));
            if (quantity != 0) {
                iDichVuService.addUsingDetail(dichVuDiKem.getMaDichVuDiKem(), idSuDung, quantity);
            }
        }
        try {
            response.sendRedirect("home-servlet");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }


    }


}