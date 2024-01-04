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

@WebServlet(name = "LoaiDichVuServlet", value = "/loai-dich-vu-servlet")
public class LoaiDichVuServlet extends HttpServlet {
    private final ILoaiDichVuService loaiDichVuService = new LoaiDichVuService();
    private final IDichVuDiKemService dichVuDiKemService = new DichVuDiKemService();

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
                    hienThiFormSua(request, response);
                    break;
                default:
                    hienThiLoaiDichVu(request, response);
            }
        }else {
            response.sendRedirect("/error-access");
        }
    }

    protected void hienThiFormSua(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        LoaiDichVu loaiDichVu = loaiDichVuService.layThongTinLDV(id);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/sua_loai_dich_vu.jsp");
        request.setAttribute("loaiDichVu", loaiDichVu);
        requestDispatcher.forward(request, response);
    }

    protected void xoaLoaiDichVu(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        List<DichVuDiKem> list = dichVuDiKemService.layDanhSachDichVuDiKem();
        int count = 0;
        for (DichVuDiKem dichVuDiKem : list) {
            if (dichVuDiKem.getMaLoaiDichVu().getMaLoaiDichVu() == id) {
                count++;
            }
        }
        if (count != 0) {
            response.sendRedirect("/loi_xoa_khong_thanh_cong.jsp");
        } else {
            loaiDichVuService.xoaLoaiDichVu(id);
            response.sendRedirect("/loai-dich-vu-servlet");
        }
    }

    protected void hienThiLoaiDichVu(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<LoaiDichVu> list = loaiDichVuService.layDanhSachLoaiDichVu();
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/loai_dich_vu.jsp");
        request.setAttribute("list", list);
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
                case "delete":
                    xoaLoaiDichVu(request, response);
                    break;
                case "edit":
                    suaLoaiDichVu(request, response);
                    break;
                case "add":
                    themLoaiDichVu(request, response);
                    break;
            }
        }else {
            response.sendRedirect("/error-access");
        }
    }

    protected void themLoaiDichVu(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        loaiDichVuService.themLoaiDichVu(new LoaiDichVu(name));
        response.sendRedirect("/loai-dich-vu-servlet");
    }

    protected void suaLoaiDichVu(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        loaiDichVuService.suaLoaiDichVu(new LoaiDichVu(id, name));
        response.sendRedirect("/loai-dich-vu-servlet");
    }
}
