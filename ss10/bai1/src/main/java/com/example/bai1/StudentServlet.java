package com.example.bai1;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "StudentServlet", value = "")
public class StudentServlet extends HttpServlet {

    private static  List<Student> studentList = new ArrayList<>();

    static {
        Student student1 = new Student(1, "Nguyen Van An", "Nam", 83d);
        Student student2 = new Student(2, "Nguyen Thi Lan", "Nữ", 49d);
        Student student3 = new Student(3, "Tran Thi Ha", "Nam", 64d);
        Student student4 = new Student(4, "Tran Tuan Anh ", "Nam", 99d);
        studentList.add(student1);
        studentList.add(student2);
        studentList.add(student3);
        studentList.add(student4);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                break;
            default:
                display(request, response);
        }

    }

    private void display(HttpServletRequest request, HttpServletResponse response) {
        System.out.println(studentList.size());
        request.setAttribute("studentList",studentList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
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

    }
}

