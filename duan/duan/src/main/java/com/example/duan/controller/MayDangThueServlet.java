package com.example.duan.controller;

import com.example.duan.model.DichVuDiKem;
import com.example.duan.model.LoaiDichVu;
import com.example.duan.model.MayTinh;
import com.example.duan.service.DichVuService;
import com.example.duan.service.MayTinhService;
import com.example.duan.service.impl.IDichVuService;
import com.example.duan.service.impl.IMayTinhService;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "MayDangThueServlet",value = "/may-dang-thue-servlet")
public class MayDangThueServlet extends HttpServlet {
  private IMayTinhService computerService = new MayTinhService();
  private IDichVuService iDichVuService = new DichVuService();

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    request.setCharacterEncoding("UTF-8");
    String action = request.getParameter("action");
    if (action == null) {
      action = "";
    }
    switch (action){
      case "orderFood":
        orderFood(request,response);
        break;
      case "listOrder":
        listOrder(request,response);
        break;
      case "orderUsed":
        listOrderUsed(request,response);
        break;
      default:
        listAreRental(request,response);
    }

  }

  private void listOrderUsed(HttpServletRequest request, HttpServletResponse response) {
    int idMay = Integer.parseInt(request.getParameter("id"));
    int idSuDung = computerService.getIdSuDung(idMay);
    System.out.println("helloo" + idSuDung + " heloo " + idMay);

  }

  private void orderFood(HttpServletRequest request, HttpServletResponse response) {
    int idMay = Integer.parseInt(request.getParameter("id"));
    int idSuDung = computerService.getIdSuDung(idMay);
    List<DichVuDiKem> dichVuList = iDichVuService.getListDichVu();

    RequestDispatcher requestDispatcher = request.getRequestDispatcher("/View/orderFood.jsp");
    request.setAttribute("idSuDung",idSuDung);
    request.setAttribute("idMay",idMay);
    request.setAttribute("dichVuList",dichVuList);
    try {
      requestDispatcher.forward(request,response);
    } catch (ServletException e) {
      throw new RuntimeException(e);
    } catch (IOException e) {
      throw new RuntimeException(e);
    }


  }


  private void listAreRental(HttpServletRequest request, HttpServletResponse response) {
    List<MayTinh> mayDangThue = computerService.getListAreRental();

    RequestDispatcher requestDispatcher = request.getRequestDispatcher("/View/mayDangThue.jsp");
    request.setAttribute("mayDangThue",mayDangThue);
    try {
      requestDispatcher.forward(request,response);
    } catch (ServletException e) {
      throw new RuntimeException(e);
    } catch (IOException e) {
      throw new RuntimeException(e);
    }
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String action = request.getParameter("action");
    if (action == null) {
      action = "";
    }
    switch (action){
      case "listOrder":
        listOrder(request,response);
        break;
    }
  }

  private void listOrder(HttpServletRequest request, HttpServletResponse response) {
      List<DichVuDiKem> list = iDichVuService.getListDichVu();
      int idMay = Integer.parseInt(request.getParameter("idMay"));
      int idSuDung = computerService.getIdSuDung(idMay);
    System.out.println(idSuDung);

    for (DichVuDiKem dichVuDiKem: list) {
      int quantity = Integer.parseInt(request.getParameter("quantity" + dichVuDiKem.getIdDichVuDiKem()));
      if (quantity != 0) {
        iDichVuService.addUsingDetail(dichVuDiKem.getIdDichVuDiKem(),idSuDung,quantity);
        System.out.println( "dich vu di kem id : "+dichVuDiKem.getIdDichVuDiKem() + "" + " id bang su dung " + idSuDung + " so luong : " + quantity);
      }
    }
    try {
      response.sendRedirect("may-dang-thue-servlet");
    } catch (IOException e) {
      throw new RuntimeException(e);
    }


  }


}
