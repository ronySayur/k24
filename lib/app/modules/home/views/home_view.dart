import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../controllers/page_index_controller_controller.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  GetStorage box = GetStorage();
  final pageC = Get.find<PageIndexController>();
  final String id = Get.arguments;

  @override
  Widget build(BuildContext context) {
    controller.getUser(id);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            const Text("Dashboard",
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
                },
              ),
            ),
            const SizedBox(height: 20),
            Divider(
              color: Colors.grey[300],
              thickness: 2,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Member",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
            FutureBuilder(
                future: controller.getMember(),
                builder: (context, snap) {
                  if (snap.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }


                  if (snap.data?.length == 0) {
                    return const Center(
                      child: Text('Data Kosong'),
                    );
                  }

                  return Column(
                    children: [
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey[200],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Total Member",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.grey)),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("${snap.data!.length}",
                                    style: const TextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold)),
                                const Text("Member",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: snap.data!.length,
                        itemBuilder: (context, index) {
                          Map<String, dynamic> dataMember = snap.data![index];
                          final int count = snap.data!.length;
                          final Animation<double> animation =
                              Tween<double>(begin: 0.0, end: 1.0).animate(
                            CurvedAnimation(
                              parent: controller.animationController!,
                              curve: Interval((1 / count) * index, 1.0,
                                  curve: Curves.fastOutSlowIn),
                            ),
                          );
                          controller.animationController?.forward();
                          return GridMember(
                              animation: animation, dataMember: dataMember);
                        },
                      ),
                    ],
                  );
                }),
          ],
        ),
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        splashColor: Colors.white,
        onPressed: () => Get.toNamed('/createmember'),
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
    );
  }
}

class GridMember extends StatelessWidget {
  const GridMember({
    super.key,
    required this.animation,
    required this.dataMember,
  });

  final Animation<double> animation;
  final Map<String, dynamic> dataMember;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      initState: (_) {},
      builder: (c) {
        return AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget? child) {
            return FadeTransition(
              opacity: animation,
              child: Transform(
                transform: Matrix4.translationValues(
                    0.0, 50 * (1.0 - animation.value), 0.0),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: ListTile(
                    title: Text(dataMember['Nama'],
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                    subtitle: Text(dataMember['Tanggal_lahir'],
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14)),
                    trailing: Text(dataMember['Jenis_kelamin'],
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14)),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
