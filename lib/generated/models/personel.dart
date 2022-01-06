import 'dart:convert';

class Personel {
  Personel({
    required this.adi,
    required this.soyadi,
    required this.sicilNo,
    required this.istihdamTipi,
    required this.unvani,
    required this.gorevi,
    required this.birimi,
    required this.sirketAdi,
    required this.dahili,
    required this.gsm,
    required this.girisTarihi,
    required this.ayrilisTarihi,
    required this.ayrilmaNedeni,
    required this.medeniHali,
    required this.ogrenimDurumu,
    required this.dogumTarihi,
    required this.engelDurumu,
    required this.surucuBelgesi,
    required this.cinsiyet,
    required this.durumu,
    required this.mernisNo,
  });

  String adi;
  String soyadi;
  String sicilNo;
  String istihdamTipi;
  String unvani;
  String gorevi;
  String birimi;
  String sirketAdi;
  String dahili;
  String gsm;
  String girisTarihi;
  String ayrilisTarihi;
  String ayrilmaNedeni;
  String medeniHali;
  String ogrenimDurumu;
  String dogumTarihi;
  String engelDurumu;
  String surucuBelgesi;
  String cinsiyet;
  String durumu;
  int mernisNo;

  factory Personel.fromJson(Map<String, dynamic> json) => Personel(
        adi: json["adi"],
        soyadi: json["soyadi"],
        sicilNo: json["sicilNo"],
        istihdamTipi: json["istihdamTipi"],
        unvani: json["unvani"],
        gorevi: json["gorevi"],
        birimi: json["birimi"],
        sirketAdi: json["sirketAdi"],
        dahili: json["dahili"],
        gsm: json["gsm"],
        girisTarihi: json["girisTarihi"],
        ayrilisTarihi: json["ayrilisTarihi"],
        ayrilmaNedeni: json["ayrilmaNedeni"],
        medeniHali: json["medeniHali"],
        ogrenimDurumu: json["ogrenimDurumu"],
        dogumTarihi: json["dogumTarihi"],
        engelDurumu: json["engelDurumu"],
        surucuBelgesi: json["surucuBelgesi"],
        cinsiyet: json["cinsiyet"],
        durumu: json["durumu"],
        mernisNo: json["mernisNo"],
      );

  Map<String, dynamic> toJson() => {
        "adi": adi,
        "soyadi": soyadi,
        "sicilNo": sicilNo,
        "istihdamTipi": istihdamTipi,
        "unvani": unvani,
        "gorevi": gorevi,
        "birimi": birimi,
        "sirketAdi": sirketAdi,
        "dahili": dahili,
        "gsm": gsm,
        "girisTarihi": girisTarihi,
        "ayrilisTarihi": ayrilisTarihi,
        "ayrilmaNedeni": ayrilmaNedeni,
        "medeniHali": medeniHali,
        "ogrenimDurumu": ogrenimDurumu,
        "dogumTarihi": dogumTarihi,
        "engelDurumu": engelDurumu,
        "surucuBelgesi": surucuBelgesi,
        "cinsiyet": cinsiyet,
        "durumu": durumu,
        "mernisNo": mernisNo,
      };
}
