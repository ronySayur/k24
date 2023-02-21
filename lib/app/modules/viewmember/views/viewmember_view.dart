import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/viewmember_controller.dart';

class ViewmemberView extends GetView<ViewmemberController> {
  const ViewmemberView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ViewmemberView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ViewmemberView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
