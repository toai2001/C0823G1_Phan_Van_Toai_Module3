package com.example.demo.controller;

import com.example.demo.service.thongke.IThongKeService;
import com.example.demo.service.thongke.ThongKeService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "ThongKeServlet", value = "/ThongKeServlet")
public class ThongKeServlet extends HttpServlet {
    private IThongKeService iThongKeService = new ThongKeService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            default:
                display(request, response);
                break;
        }
    }
    private void display(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("thongKes", iThongKeService.display());

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/display.jsp");
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
                e.printStackTrace(); // Xử lý lỗi chuyển đổi ngày nếu cần
            }
        } else {
            // Xử lý trường hợp không có ngày được chọn (có thể chuyển về trang mặc định hoặc hiển thị thông báo)
            display(request, response);
        }
    }

    private void displayByDate(HttpServletRequest request, HttpServletResponse response, Date selectedDate) {
        request.setAttribute("thongKes", iThongKeService.displayByDate(selectedDate));
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/display.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }
}
