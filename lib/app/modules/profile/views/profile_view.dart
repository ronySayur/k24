import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/page_index_controller_controller.dart';
import '../../../routes/app_pages.dart';
import '../../home/controllers/home_controller.dart';
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
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey[200],
            ),
            child: GetBuilder<HomeController>(
              init: HomeController(),
              initState: (_) {},
              builder: (c) {
                if (c.userData == null) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (c.role.value == "admin") {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Selamat Datang ${c.role.value}...",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    ],
                  );
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Selamat Datang...",
                          style: TextStyle(fontSize: 18, color: Colors.grey)),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${c.userData[0]['Nama']}',
                              style: const TextStyle(
                                  fontSize: 26, fontWeight: FontWeight.bold)),
                          Text("${c.userData[0]['Jenis_kelamin']}",
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${c.userData[0]['Alamat']}",
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          Text("${c.userData[0]['Tanggal_lahir']}",
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  );
                }
              },
            ),
          ),

          const SizedBox(height: 10),
          GetBuilder<HomeController>(
            init: HomeController(),
            initState: (_) {},
            builder: (c) {
              if (c.userData == null) {
                return const Center(child: CircularProgressIndicator());
              }
              if (c.role.value == "admin") {
                return const SizedBox();
              } else {
                return ListTile(
                    onTap: () {
                      Get.toNamed(Routes.CHANGEPASSWORDMEMBER);
                    },
                    leading:
                        const Icon(Icons.lock, color: Colors.black, size: 30),
                    title: const Text("Ubah Password",
                        style: TextStyle(fontSize: 20)),
                    trailing: const Icon(Icons.arrow_forward_ios,
                        color: Colors.black, size: 20));
              }
            },
          ),

          const SizedBox(height: 10),
          const Divider(),
          const SizedBox(height: 10),

          //Logout
          ListTile(
              onTap: () => controller.logout(),
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
          TabItem(icon: Icons.people, title: 'Profile'),
        ],
        initialActiveIndex: pageC.pageIndex.value,
        onTap: (int i) => pageC.changePage(i),
      ),
    );
  }
}
