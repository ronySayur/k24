import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/changepasswordmember_controller.dart';

class ChangepasswordmemberView extends GetView<ChangepasswordmemberController> {
  const ChangepasswordmemberView({Key? key}) : super(key: key);
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
                controller.changePassword();
              },
              icon: const Icon(Icons.save, color: Colors.white),
            )
          ],
          backgroundColor: Colors.green,
          title: const Text('Ubah Password'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Expanded(
            child: GetBuilder<ChangepasswordmemberController>(
                init: ChangepasswordmemberController(),
                initState: (_) {},
                builder: (c) {
                  return ListView(
                    children: [
                      const Text("Ubah Password",
                          style: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      const Divider(),
                      const SizedBox(height: 10),
                      TextField(
                          textInputAction: TextInputAction.next,
                          maxLength: 20,
                          autocorrect: false,
                          controller: c.Password,
                          cursorColor: Colors.black,
                          enableSuggestions: false,
                          obscureText: true,
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () => c.togglePasswordVisibility(),
                                icon: const Icon(Icons.remove_red_eye),
                              ),
                              labelText: "Password Lama",
                              counterText: "",
                              labelStyle: const TextStyle(color: Colors.black),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide:
                                      const BorderSide(color: Colors.red)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 15))),
                      const SizedBox(height: 20),
                      TextField(
                          textInputAction: TextInputAction.next,
                          maxLength: 20,
                          autocorrect: false,
                          controller: c.NewPassword,
                          cursorColor: Colors.black,
                          enableSuggestions: false,
                          obscureText: true,
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () => c.togglePasswordVisibility1(),
                                icon: const Icon(Icons.remove_red_eye),
                              ),
                              labelText: "Password Baru",
                              counterText: "",
                              labelStyle: const TextStyle(color: Colors.black),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide:
                                      const BorderSide(color: Colors.red)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 15))),
                      const SizedBox(height: 20),
                      TextField(
                          textInputAction: TextInputAction.next,
                          maxLength: 20,
                          autocorrect: false,
                          controller: c.ConfirmPassword,
                          cursorColor: Colors.black,
                          enableSuggestions: false,
                          obscureText: true,
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () => c.togglePasswordVisibility2(),
                                icon: const Icon(Icons.remove_red_eye),
                              ),
                              labelText: "Konfirmasi Password Baru",
                              counterText: "",
                              labelStyle: const TextStyle(color: Colors.black),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide:
                                      const BorderSide(color: Colors.red)),
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
                            c.changePassword();
                          },
                          child: const Text(
                            "Simpan",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
          ),
        ));
  }
}
