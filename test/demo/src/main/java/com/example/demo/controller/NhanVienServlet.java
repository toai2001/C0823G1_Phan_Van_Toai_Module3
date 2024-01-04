package com.example.demo.controller;

import com.example.demo.repository.NhanVienRepo;
import com.example.demo.repository.TaikhoanRepo;
import com.example.demo.repository.impl.INhanVienRepo;
import com.example.demo.repository.impl.ITaikhoanRepo;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "NhanVienServlet", value = "/NhanVien")
public class NhanVienServlet extends HttpServlet {
    private INhanVienRepo iNhanVienRepo = new NhanVienRepo();
    private ITaikhoanRepo iTaikhoanRepo = new TaikhoanRepo();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || !session.getAttribute("type_account").equals("admin")) {
            resp.sendRedirect("/error-access");
        } else if (session.getAttribute("type_account").equals("admin") ) {
            String action = req.getParameter("action");
            if (action == null) {
                action = "";
            }
            switch (action) {
                case "detail":
                    showFormDetail(req, resp);
                    break;
//                case "update":
//                    formUpdate(req, resp);
//                    break;
//                default:
//                    showList(req, resp);
            }
        }else {
            resp.sendRedirect("/error-access");
        }

    }

    private void showFormDetail(HttpServletRequest req, HttpServletResponse resp) {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
