package com.example.thi.controller;

import com.example.thi.model.ChiTieu;
import com.example.thi.model.LoaiChiTieu;
import com.example.thi.service.impl.ChiTieuServiceImpl;
import com.example.thi.service.impl.LoaiChiTieuImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Date;

@WebServlet(name = "ChiTieuServlet", value = "/ChiTieu")
public class ChiTieuServlet extends HttpServlet {
    private ChiTieuServiceImpl chiTieuService = new ChiTieuServiceImpl();
    private LoaiChiTieuImpl loaiChiTieu = new LoaiChiTieuImpl();

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
            default:
                display(request, response);
        }
    }

    private void fromCreate(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("loaiChiTieuId", loaiChiTieu.hienThiLoaiChiTieu());
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
        request.setAttribute("chitieuList", chiTieuService.display());
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

        } switch (action) {
            case "create":
                create(request, response);
                break;
            case "remove":
                remove(request,response);
                break;
            default:
                display(request, response);
        }
    }

    private void remove(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        chiTieuService.remove(id);
        response.sendRedirect("/ChiTieu");

    }


    private void create(HttpServletRequest request, HttpServletResponse response) {
        String tenChitieu = request.getParameter("tenChitieu");
        java.sql.Date ngayChi = Date.valueOf(request.getParameter("ngayChi"));
        Long soTienCHi = Long.valueOf(request.getParameter("soTienChi"));
        String moTaThem = request.getParameter("moTaTHem");
        int idLoaiChiTieu =Integer.parseInt(request.getParameter("loaiChiTieuId"));


        chiTieuService.add(new ChiTieu(tenChitieu, ngayChi, soTienCHi, moTaThem, new LoaiChiTieu(idLoaiChiTieu)));
        try {
            response.sendRedirect("/ChiTieu");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }
}
