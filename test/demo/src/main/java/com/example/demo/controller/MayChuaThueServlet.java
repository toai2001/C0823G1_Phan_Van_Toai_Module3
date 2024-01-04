package com.example.demo.controller;

import com.example.demo.model.MayTinh;
import com.example.demo.service.MayTinhService;
import com.example.demo.service.impl.IMayTinhService;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "MayChuaThueServlet",value = "/may-chua-thue-servlet")
public class MayChuaThueServlet extends HttpServlet {
  private IMayTinhService computerService = new MayTinhService();
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String action = request.getParameter("action");
    if (action == null) {
      action = "";
    }
    switch (action){
      default:
        listNotRental(request,response);
        break;

    }

  }
  private void listNotRental(HttpServletRequest request, HttpServletResponse response) {
    List<MayTinh> mayDangThue = computerService.listNotRental();
    RequestDispatcher requestDispatcher = request.getRequestDispatcher("/View/mayChuaThue.jsp");
    request.setAttribute("mayChuaThue",mayDangThue);
    try {
      requestDispatcher.forward(request,response);
    } catch (ServletException e) {
      throw new RuntimeException(e);
    } catch (IOException e) {
      throw new RuntimeException(e);
    }
  }

}
