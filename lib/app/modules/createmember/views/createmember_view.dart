import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/createmember_controller.dart';

class CreatememberView extends GetView<CreatememberController> {
  const CreatememberView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CreatememberView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'CreatememberView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
