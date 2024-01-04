package com.example.demo.service;

import com.example.demo.model.BangSuDung;
import com.example.demo.model.MayTinh;
import com.example.demo.repository.MayTinhRepository;
import com.example.demo.repository.impl.IMayTinhRepository;
import com.example.demo.service.impl.IMayTinhService;

import java.util.List;

public class MayTinhService implements IMayTinhService {
  private final IMayTinhRepository computerRepository = new MayTinhRepository();

  @Override
  public List<MayTinh> getListMayTinh() {
    return computerRepository.getListMayTinh();
  }

  @Override
  public MayTinh getComputer(int id) {
    return computerRepository.getComputer(id);
  }

  @Override
  public void endTimeComputer(BangSuDung bangSuDung) {
    computerRepository.endTimeComputer(bangSuDung);

  }

  @Override
  public List<MayTinh> getListAreRental() {
    return computerRepository.getListAreRental();
  }

  @Override
  public List<MayTinh> listNotRental() {
    return computerRepository.listNotRental();
  }

  @Override
  public int getIdSuDung(int idMay) {
    return computerRepository.getIdSuDung(idMay);
  }

  @Override
  public List<BangSuDung> historyRental(int idMay) {
    return computerRepository.historyRental(idMay);
  }

  @Override
  public int startTimeComputer(BangSuDung bangSuDung) {
    return computerRepository.startTimeComputer(bangSuDung);
  }
}
