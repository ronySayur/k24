import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:k24/app/data/member.dart';
import 'package:sqflite/sqflite.dart';

class CreatememberController extends GetxController {
  var selectedDate = DateTime.now().obs;
  TextEditingController Nama = TextEditingController();
  TextEditingController Alamat = TextEditingController();
  TextEditingController Jenis_kelamin = TextEditingController();
  TextEditingController Tanggal_lahir = TextEditingController();
  TextEditingController Username = TextEditingController();
  TextEditingController Password = TextEditingController();

  DatabaseManager database = DatabaseManager.instance;

  Future<void> createMember() async {
    Database db = await database.db;
    db.insert("member", {
      "Nama": Nama.text,
      "Tanggal_lahir": Tanggal_lahir.text,
      "Alamat": Alamat.text,
      "Jenis_kelamin": Jenis_kelamin.text,
      "Username": Username.text,
      "Password": Password.text
    });

    EasyLoading.showSuccess('Berhasil menambahkan member!');
    var data = await db.query("member");
    print(data);
  }

  chooseDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: selectedDate.value,
        firstDate: DateTime(2000),
        lastDate: DateTime(2024),
        helpText: 'Pilih Tanggal Lahir',
        cancelText: 'Tutup',
        confirmText: 'Konfirmasi',
        errorFormatText: 'Masukkan format yang benar',
        errorInvalidText: 'Masukkan tanggal yang benar',
        fieldLabelText: 'Tanggal Lahir',
        fieldHintText: 'Bulan/Hari/Tahun',
        selectableDayPredicate: disableDate);
    if (pickedDate != null && pickedDate != selectedDate.value) {
      selectedDate.value = pickedDate;
      Tanggal_lahir.text = DateFormat('dd-MM-yyyy').format(selectedDate.value);
    }
  }

  bool disableDate(DateTime day) {
    if ((day.isAfter(DateTime.now().subtract(Duration(days: 1))) &&
        day.isBefore(DateTime.now().add(Duration(days: 5))))) {
      return true;
    }
    return false;
  }
}
