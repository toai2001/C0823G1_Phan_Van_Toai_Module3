package com.example.demo.service.maytinhservice;

import com.example.demo.model.BangSuDung;
import com.example.demo.model.MayTinh;

import java.util.List;

public interface IMayTinhService {
    List<MayTinh> getListMayTinh();

    MayTinh getComputer(int id);

    int startTimeComputer(BangSuDung bangSuDung);

    void endTimeComputer(BangSuDung bangSuDung);

    List<BangSuDung> getListAreRental();

    List<MayTinh> listNotRental();

    int getIdSuDung(int idMay);

    List<BangSuDung> historyRental(int idMay);

    void setConfirmationPayment(int idSuDung);
}