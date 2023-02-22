import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../controllers/page_index_controller_controller.dart';
import '../controllers/createmember_controller.dart';

class CreatememberView extends GetView<CreatememberController> {
  final pageC = Get.find<PageIndexController>();

  CreatememberView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.arrow_back, color: Colors.white)),
          actions: [
            IconButton(
              onPressed: () {
                controller.createMember();
              },
              icon: const Icon(Icons.save, color: Colors.white),
            )
          ],
          backgroundColor: Colors.green,
          title: const Text('Tambah Member'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Expanded(
            child: ListView(
              children: [
                const SizedBox(height: 20),
                const Text("Tambah Member",
                    style:
                        TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                const Divider(),
                const SizedBox(height: 10),
                TextField(
                    textInputAction: TextInputAction.next,
                    controller: controller.Nama,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        labelText: "Nama",
                        labelStyle: const TextStyle(color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(color: Colors.red)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15))),
                const SizedBox(height: 20),
                TextField(
                    controller: controller.Alamat,
                    textInputAction: TextInputAction.done,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        labelText: "Alamat",
                        labelStyle: const TextStyle(color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(color: Colors.red)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15))),
                const SizedBox(height: 20),
                DropdownMenu(
                    label: const Text("Jenis Kelamin"),
                    controller: controller.Jenis_kelamin,
                    onSelected: (value) =>
                        controller.Jenis_kelamin.text = value.toString(),
                    // ignore: prefer_const_literals_to_create_immutables
                    dropdownMenuEntries: [
                      const DropdownMenuEntry(
                        leadingIcon: Icon(Icons.man),
                        value: 'Laki-laki',
                        label: 'Laki-laki',
                      ),
                      const DropdownMenuEntry(
                        leadingIcon: Icon(Icons.woman),
                        value: 'Perempuan',
                        label: 'Perempuan',
                      ),
                    ]),
                const SizedBox(height: 20),
                TextField(
                    readOnly: true,
                    controller: controller.Tanggal_lahir,
                    onTap: () => controller.chooseDate(),
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        labelText: "Tanggal Lahir",
                        icon: const Icon(Icons.calendar_today),
                        labelStyle: const TextStyle(color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(color: Colors.red)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15))),
                const SizedBox(height: 20),
                TextField(
                    textInputAction: TextInputAction.next,
                    maxLength: 15,
                    controller: controller.Username,
                    enableSuggestions: false,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        labelText: "Username",
                        counterText: "",
                        labelStyle: const TextStyle(color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(color: Colors.red)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15))),
                const SizedBox(height: 20),
                TextField(
                    textInputAction: TextInputAction.next,
                    maxLength: 20,
                    autocorrect: false,
                    controller: controller.Password,
                    cursorColor: Colors.black,
                    enableSuggestions: false,
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: "Password",
                        counterText: "",
                        labelStyle: const TextStyle(color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(color: Colors.red)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15))),
                const SizedBox(height: 20),
                SizedBox(
                  width: Get.context!.width,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                    ),
                    onPressed: () {
                      EasyLoading.show(status: 'Tunggu Sebentar');
                      controller.createMember();
                      EasyLoading.dismiss();
                    },
                    child: const Text(
                      "Tambah Member",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
