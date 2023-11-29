package com.example.bai1;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "login", value = "/login")
public class Login extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createUser(request, response);
        }
    }

    private void createUser(HttpServletRequest request, HttpServletResponse response) {
        String userName = request.getParameter("taiKhoan");
        String pass = request.getParameter("matKhau");
        Date date = new Date();
        DateFormat dateFormat= new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        String error= "Tên đăng nhập không đúng";
        String error2="Mật khẩu bạn nhập không chính xác";
        if (!userName.equals("admin")){
            request.setAttribute("error",error);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
            try {
                requestDispatcher.forward(request,response);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }else if (!pass.equals("admin123")){
            request.setAttribute("error2",error2);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
            try {
                requestDispatcher.forward(request,response);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }else {
            request.setAttribute("date",dateFormat.format(date));
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("succes.jsp");
            try {
                requestDispatcher.forward(request,response);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }


    }

}
