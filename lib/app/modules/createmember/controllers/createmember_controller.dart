import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:k24/app/data/member.dart';
import 'package:sqflite/sqflite.dart';

class CreatememberController extends GetxController {
  var selectedDate = DateTime.now().obs;
  TextEditingController nama = TextEditingController();
  TextEditingController alamat = TextEditingController();
  TextEditingController jenisKelamin = TextEditingController();
  TextEditingController tanggalLahir = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  DatabaseManager database = DatabaseManager.instance;

  Future<void> createMember() async {
    if (nama.text.isEmpty ||
        alamat.text.isEmpty ||
        jenisKelamin.text.isEmpty ||
        tanggalLahir.text.isEmpty ||
        username.text.isEmpty ||
        password.text.isEmpty) {
      Get.snackbar("Error", "Semua Field Harus Diisi",
          snackPosition: SnackPosition.TOP,
          icon: const Icon(Icons.error),
          colorText: Colors.white,
          backgroundColor: Colors.red);
    } else {
      Database db = await database.db;
      db.insert("member", {
        "Nama": nama.text,
        "Tanggal_lahir": tanggalLahir.text,
        "Alamat": alamat.text,
        "Jenis_kelamin": jenisKelamin.text,
        "Username": username.text,
        "Password": password.text
      });

      Get.back();
      Get.snackbar("Success", "Member Berhasil Ditambahkan",
          snackPosition: SnackPosition.TOP,
          icon: const Icon(Icons.check),
          colorText: Colors.white,
          backgroundColor: Colors.green);
    }

    EasyLoading.show(
        status: 'Loading...',
        maskType: EasyLoadingMaskType.black,
        dismissOnTap: true);
    await Future.delayed(const Duration(seconds: 2));
    EasyLoading.dismiss();
  }

  chooseDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: selectedDate.value,
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
        helpText: 'Pilih Tanggal Lahir',
        cancelText: 'Tutup',
        confirmText: 'Konfirmasi',
        errorFormatText: 'Masukkan format yang benar',
        errorInvalidText: 'Masukkan tanggal yang benar',
        fieldLabelText: 'Tanggal Lahir',
        fieldHintText: 'Bulan/Hari/Tahun');
    if (pickedDate != null && pickedDate != selectedDate.value) {
      selectedDate.value = pickedDate;
      tanggalLahir.text = DateFormat('dd-MM-yyyy').format(selectedDate.value);
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
