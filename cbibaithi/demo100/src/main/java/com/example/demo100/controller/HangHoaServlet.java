package com.example.demo100.controller;

import com.example.demo100.model.HangHoa;
import com.example.demo100.model.LoaiHangHoa;
import com.example.demo100.service.IHangHoaService;
import com.example.demo100.service.ILoaiHangHoaService;
import com.example.demo100.service.impl.HangHoaService;
import com.example.demo100.service.impl.LoaiHangHoaService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Date;

@WebServlet(name = "HangHoaServlet", value = "/HangHoa")
public class HangHoaServlet extends HttpServlet {
    private IHangHoaService iHangHoaService = new HangHoaService();
    private ILoaiHangHoaService iLoaiHangHoaService = new LoaiHangHoaService();

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
        request.setAttribute("loaiHangHoaId", iLoaiHangHoaService.hienThiLoaiHangHoa());
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/create.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void display(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("hangHoaList", iHangHoaService.display());
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
            case "remove":
                remove(request, response);
                break;
            default:
                display(request, response);
        }
    }

    private void create(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String maHangHoa = request.getParameter("maHangHoa");
        String tenHangHoa = request.getParameter("tenHangHoa");
        String donViHangHoa = request.getParameter("donViHangHoa");
        int idLoaiHangHoa = Integer.parseInt(request.getParameter("idLoaiHangHoa"));
        Date ngayThuHoach = Date.valueOf(request.getParameter("ngayThuHoach"));
        iHangHoaService.add(new HangHoa(maHangHoa, tenHangHoa, donViHangHoa, new LoaiHangHoa(idLoaiHangHoa), ngayThuHoach));
        response.sendRedirect("/HangHoa");

    }

    private void remove(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        iHangHoaService.remove(id);
        response.sendRedirect("/HangHoa");
    }
}
