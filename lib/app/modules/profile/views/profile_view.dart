import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../controllers/page_index_controller_controller.dart';
import '../../../routes/app_pages.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  final pageC = Get.find<PageIndexController>();
  ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const SizedBox(height: 20),
          const Text("Profile",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          const Divider(),

          const SizedBox(height: 10),
          ListTile(
              onTap: () {},
              leading: const Icon(Icons.person, color: Colors.black, size: 30),
              title: const Text("Profile", style: TextStyle(fontSize: 20)),
              trailing: const Icon(Icons.arrow_forward_ios,
                  color: Colors.black, size: 20)),
          const SizedBox(height: 10),
          ListTile(
              onTap: () {},
              leading: const Icon(Icons.manage_accounts,
                  color: Colors.black, size: 30),
              title: const Text("Ubah Profile", style: TextStyle(fontSize: 20)),
              trailing: const Icon(Icons.arrow_forward_ios,
                  color: Colors.black, size: 20)),
          const SizedBox(height: 10),
          ListTile(
              onTap: () {},
              leading: const Icon(Icons.lock, color: Colors.black, size: 30),
              title:
                  const Text("Ubah Password", style: TextStyle(fontSize: 20)),
              trailing: const Icon(Icons.arrow_forward_ios,
                  color: Colors.black, size: 20)),

          const SizedBox(height: 10),
          const Divider(),
          const SizedBox(height: 10),

          //Logout
          ListTile(
              onTap: () {},
              leading: const Icon(Icons.logout, color: Colors.black, size: 30),
              title: const Text("Logout", style: TextStyle(fontSize: 20)),
              trailing: const Icon(Icons.arrow_forward_ios,
                  color: Colors.black, size: 20))
        ],
      ),
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.reactCircle,
        backgroundColor: Colors.green,
        items: const [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.add, title: 'Add'),
          TabItem(icon: Icons.people, title: 'Profile'),
        ],
        initialActiveIndex: pageC.pageIndex.value,
        onTap: (int i) => pageC.changePage(i),
      ),
    );
  }
}
