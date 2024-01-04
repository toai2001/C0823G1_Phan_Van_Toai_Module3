package com.example.demo.controller;

import com.example.demo.service.thongke.IThongKeService;
import com.example.demo.service.thongke.ThongKeService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "ThongKeServlet",value = "/thong-ke-servlet")
public class ThongKeServlet extends HttpServlet {

    private IThongKeService iThongKeService = new ThongKeService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession httpSession = request.getSession(false);
        if (httpSession.getAttribute("loai_tai_khoan").equals("admin")) {
            String action = request.getParameter("action");
            if (action == null) {
                action = "";
            }
            switch (action) {
                default:
                    display(request, response);
                    break;
            }
        }else {
            response.sendRedirect("/error-access");
        }
    }
    private void display(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("thongKes", iThongKeService.display());

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/View/thongke.jsp");
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
        String selectedDateStr = request.getParameter("selectedDate");

        if (selectedDateStr != null && !selectedDateStr.isEmpty()) {
            try {
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                Date selectedDate = dateFormat.parse(selectedDateStr);
                displayByDate(request, response, selectedDate);
            } catch (ParseException e) {
                e.printStackTrace();
            }
        } else {
            // Xử lý trường hợp không có ngày được chọn (có thể chuyển về trang mặc định hoặc hiển thị thông báo)
            display(request, response);
        }
    }

    private void displayByDate(HttpServletRequest request, HttpServletResponse response, Date selectedDate) {
        request.setAttribute("thongKes", iThongKeService.displayByDate(selectedDate));
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/View/thongke.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }
}
