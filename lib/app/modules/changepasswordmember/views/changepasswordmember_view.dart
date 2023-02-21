import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/changepasswordmember_controller.dart';

class ChangepasswordmemberView extends GetView<ChangepasswordmemberController> {
  const ChangepasswordmemberView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChangepasswordmemberView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ChangepasswordmemberView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
