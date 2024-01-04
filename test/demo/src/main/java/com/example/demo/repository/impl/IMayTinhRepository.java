package com.example.demo.repository.impl;

import com.example.demo.model.BangSuDung;
import com.example.demo.model.MayTinh;


import java.util.List;

public interface IMayTinhRepository {
  List<MayTinh>getListMayTinh();

  MayTinh getComputer(int id);

  int startTimeComputer(BangSuDung bangSuDung);

  void endTimeComputer(BangSuDung bangSuDung);

  List<MayTinh> getListAreRental();

  List<MayTinh> listNotRental();

  int getIdSuDung(int idMay);

  List<BangSuDung> historyRental(int idMay);
}