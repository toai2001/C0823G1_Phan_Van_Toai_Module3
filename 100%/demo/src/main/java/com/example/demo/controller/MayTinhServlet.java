package com.example.demo.controller;
import com.example.demo.model.BangSuDung;
import com.example.demo.model.MayTinh;
import com.example.demo.model.NhanVien;
import com.example.demo.service.maytinhservice.IMayTinhService;
import com.example.demo.service.maytinhservice.MayTinhService;

import java.io.IOException;
import java.sql.ResultSet;
import java.text.DecimalFormat;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "MayTinhServlet" , urlPatterns = "/may-tinh-servlet")
public class MayTinhServlet extends HttpServlet {
    private IMayTinhService computerService = new MayTinhService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession httpSession = request.getSession(false);
        request.setCharacterEncoding("UTF-8");
        if (httpSession.getAttribute("loai_tai_khoan").equals("admin")||httpSession.getAttribute("loai_tai_khoan").equals("Nhân viên")) {
            String action = request.getParameter("action");
            if (action == null) {
                action = "";
            }
            switch (action) {
                case "detail":
                    detailComputer(request, response);
                    break;
                case "startTime":
                    startTime(request, response);
                    break;
                case "endTime":
                    endTime(request, response);
                    break;
                case "dungchitiet":
                    detailUsing(request, response);
                    break;
//      case "historyRental":
//        historyRental(request,response);
//        break;


                default:
                    showListComputer(request, response);
                    break;
            }
        }else {
            response.sendRedirect("/error-access");

        }
    }

    private void historyRental(HttpServletRequest request, HttpServletResponse response) {
        int idMay = Integer.parseInt(request.getParameter("id"));
        List<BangSuDung> historyList = computerService.historyRental(idMay);

    }

//  private void areRenting(HttpServletRequest request, HttpServletResponse response) {
//    List<MayTinh> mayTinhList = computerService.getListMayTinh();
//    RequestDispatcher requestDispatcher = request.getRequestDispatcher("/View/mayDangThue.jsp");
//    request.setAttribute("mayDangThue", mayTinhList);
//    try {
//      requestDispatcher.forward(request,response);
//    } catch (ServletException e) {
//      throw new RuntimeException(e);
//    } catch (IOException e) {
//      throw new RuntimeException(e);
//    }
//
//
//  }

    private void detailUsing(HttpServletRequest request, HttpServletResponse response) {
//        int idBangSuDung = Integer.parseInt(request.getParameter("idBangSuDung"));
//        int idMayTinh = Integer.parseInt(request.getParameter("idMay"));




    }

    private void endTime(HttpServletRequest request, HttpServletResponse response) {

        int idMay = Integer.parseInt(request.getParameter("idMay"));
        boolean checkStatus = computerService.checkStatusComputer(idMay);
        if (checkStatus){
            int idBangSuDung = computerService.getIdSuDung(idMay);
            LocalDateTime end = LocalDateTime.now();
            MayTinh mayTinh = new MayTinh(idMay);
            BangSuDung bangSuDung = new BangSuDung(idBangSuDung,mayTinh,end);
            computerService.endTimeComputer(bangSuDung);
            List<BangSuDung> historyList = computerService.historyRental(idMay);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/View/historyRental.jsp");
            historyList.forEach(item -> {
                Date date = Date.from(item.getGioBatDau().atZone(ZoneId.systemDefault()).toInstant());
                item.setGioBatDauDate(date);
                Date dateEnd = Date.from(item.getGioKetThuc().atZone(ZoneId.systemDefault()).toInstant());
                item.setGioKetThucDate(dateEnd);
                double bill = item.getTongTien();
                DecimalFormat decimalFormat = new DecimalFormat("#.##");
                String formattedTongTien = decimalFormat.format(bill);
                item.setTongTien(Double.parseDouble(formattedTongTien));

                long timeUse = item.getDaDung() / 60;
                decimalFormat = new DecimalFormat("#.#");
                String formattedSoPhut = decimalFormat.format(timeUse);
                item.setDaDung(Long.parseLong(formattedSoPhut));
            });

            request.setAttribute("historyList",historyList);
            request.setAttribute("idMay",idMay);
            try {
                requestDispatcher.forward(request,response);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }

        } else {
            List<BangSuDung> mayDangThue = computerService.getListAreRental();
            List<MayTinh> mayChuaThue = computerService.listNotRental();
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/View/home1.jsp");
            request.setAttribute("mayDangThue", mayDangThue);
            mayDangThue.forEach(item -> {
                Date date = Date.from(item.getGioBatDau().atZone(ZoneId.systemDefault()).toInstant());
                item.setGioBatDauDate(date);

            });
            request.setAttribute("mayChuaThue", mayChuaThue);
            request.setAttribute("successMessage", " Máy đã được nhân viên khác tắt");
            try {

                request.getRequestDispatcher("View/home1.jsp").forward(request, response);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }



    }

    private void startTime(HttpServletRequest request, HttpServletResponse response) {
       String account = request.getParameter("idNv");
        int idMay = Integer.parseInt(request.getParameter("idMay"));
        boolean checkStatusComputer = computerService.checkStatusComputer(idMay);

        if (!checkStatusComputer){
            int idNhanVien = computerService.getIdNhanVienByAccount(account);
            MayTinh mayTinh = new MayTinh(idMay);
            LocalDateTime start = LocalDateTime.now();
            NhanVien nhanVien = new NhanVien(idNhanVien);
            BangSuDung bangSuDung = new BangSuDung(start,mayTinh,nhanVien);
            int  idBangSuDung =  computerService.startTimeComputer(bangSuDung);
            try {
                response.sendRedirect("/home-servlet");
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        } else {
            List<BangSuDung> mayDangThue = computerService.getListAreRental();
            List<MayTinh> mayChuaThue = computerService.listNotRental();
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/View/home1.jsp");
            request.setAttribute("mayDangThue", mayDangThue);
            mayDangThue.forEach(item -> {
                Date date = Date.from(item.getGioBatDau().atZone(ZoneId.systemDefault()).toInstant());
                item.setGioBatDauDate(date);

            });
            request.setAttribute("mayChuaThue", mayChuaThue);
            request.setAttribute("successMessage", " Máy đã được nhân viên khác mở");
            try {

                request.getRequestDispatcher("View/home1.jsp").forward(request, response);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }



//    RequestDispatcher requestDispatcher = request.getRequestDispatcher("/may-tinh-servlet");
//    request.setAttribute("idBangSuDung",idBangSuDung);
//    request.setAttribute("mayTinhList",mayTinhList);
//    request.setAttribute("idMay",idMay);


    }

    private void detailComputer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        MayTinh computer = computerService.getComputer(id);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/View/detail.jsp");
        request.setAttribute("computer",computer);
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)  {

    }

    protected void showListComputer(HttpServletRequest request, HttpServletResponse response) {
        List<MayTinh> mayTinhList = computerService.getListMayTinh();
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/View/home.jsp");
        request.setAttribute("mayTinhList", mayTinhList);
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

}
