package com.example.demo.controller;

import com.example.demo.model.DichVuDiKem;
import com.example.demo.model.LoaiDichVu;
import com.example.demo.service.dichvudikemservice.DichVuDiKemService;
import com.example.demo.service.dichvudikemservice.IDichVuDiKemService;
import com.example.demo.service.loaidichvuservice.ILoaiDichVuService;
import com.example.demo.service.loaidichvuservice.LoaiDichVuService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DichVuDiKemServlet", value = "/dich-vu-di-kem-servlet")
public class DichVuDiKemServlet extends HttpServlet {
    private final IDichVuDiKemService dichVuDiKemService = new DichVuDiKemService();
    private final ILoaiDichVuService loaiDichVuService = new LoaiDichVuService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession httpSession = request.getSession(false);
        if (httpSession.getAttribute("loai_tai_khoan").equals("admin")||httpSession.getAttribute("loai_tai_khoan").equals("Nhân viên")) {
            String action = request.getParameter("action");
            if (action == null) {
                action = "";
            }
            switch (action) {
                case "edit":
                    hienThiFormEdit(request, response);
                    break;
                default:
                    hienThiDanhSachDichVuDiKem(request, response);
            }
        }else {
            response.sendRedirect("/error-access");
        }
    }

    protected void hienThiFormEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        DichVuDiKem dichVuDiKem = null;
        List<DichVuDiKem> listdvdk = dichVuDiKemService.layDanhSachDichVuDiKem();
        for (DichVuDiKem dichVuDiKem1 : listdvdk) {
            if (dichVuDiKem1.getMaDichVuDiKem() == id) {
                dichVuDiKem = dichVuDiKem1;
                break;
            }
        }
        List<LoaiDichVu> list = loaiDichVuService.layDanhSachLoaiDichVu();
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/sua_dich_vu_di_kem.jsp");
        request.setAttribute("list", list);
        request.setAttribute("dichVuDiKem", dichVuDiKem);
        requestDispatcher.forward(request, response);
    }

    protected void hienThiDanhSachDichVuDiKem(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<DichVuDiKem> listdvdk = dichVuDiKemService.hienThiDichVuDiKem();
        List<LoaiDichVu> list = loaiDichVuService.layDanhSachLoaiDichVu();
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/dich_vu_di_kem.jsp");
        request.setAttribute("list", list);
        request.setAttribute("listdvdk", listdvdk);
        requestDispatcher.forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession httpSession = request.getSession(false);
        if (httpSession.getAttribute("loai_tai_khoan").equals("admin")||httpSession.getAttribute("loai_tai_khoan").equals("Nhân viên")) {
            String action = request.getParameter("action");
            if (action == null) {
                action = "";
            }
            switch (action) {
                case "add":
                    themDichVuDiKem(request, response);
                    break;
                case "edit":
                    suaDichVuDiKem(request, response);
                    break;
                case "delete":
                    xoaDichVuDiKem(request, response);
                    break;
            }
        }else {
            response.sendRedirect("/error-access");
        }
    }

    protected void xoaDichVuDiKem(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        dichVuDiKemService.xoaDichVuDiKem(id);
        response.sendRedirect("/dich-vu-di-kem-servlet");
    }

    protected void suaDichVuDiKem(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        LoaiDichVu loaiDichVu = loaiDichVuService.layThongTinLDV(Integer.parseInt(request.getParameter("maldv")));
        int number = loaiDichVu.getMaLoaiDichVu();
        DichVuDiKem dichVuDiKem = new DichVuDiKem(id, name, price, number);
        dichVuDiKemService.suaDichVuDikem(dichVuDiKem);
        response.sendRedirect("/dich-vu-di-kem-servlet");
    }

    protected void themDichVuDiKem(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        int text = Integer.parseInt(request.getParameter("maldv"));
        LoaiDichVu loaiDichVu = loaiDichVuService.layThongTinLDV(text);
        int idLoaiDichVu = loaiDichVu.getMaLoaiDichVu();
        DichVuDiKem dichVuDiKem = new DichVuDiKem(name, price, idLoaiDichVu);
        dichVuDiKemService.themDichVuDiKem(dichVuDiKem);
        response.sendRedirect("/dich-vu-di-kem-servlet");
    }
}
