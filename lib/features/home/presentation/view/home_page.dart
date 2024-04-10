import 'package:app/features/home/presentation/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(context),
    );
  }

  /// appbar
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text("Home Page"),
    );
  }

  /// body
  Widget _buildBody(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              shrinkWrap: true,
              itemCount: controller.users.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    sda(context);
                  },
                  child: ListTile(
                    title: Text(controller.users[index].name ?? ''),
                  ),
                );
              },
            ),
    );
  }

  void sda(BuildContext context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        // titlePadding: EdgeInsets.zero,
        // insetPadding: EdgeInsets.zero,
        // contentPadding: EdgeInsets.zero,
        // actionsPadding: EdgeInsets.zero,
        title: const Text('AlertDialog Title'),
        content: const Text('AlertDialog description'),
        actions: <Widget>[
          InkWell(
            onTap: () {
              Navigator.pop(context, 'OK');
            },
            child: Container(
              width: double.infinity,
              color: Colors.blue,
              margin: const EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.symmetric(vertical: 6),
              alignment: Alignment.center,
              child: const Text('OK'),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context, 'Cancel');
            },
            child: Container(
              width: double.infinity,
              color: Colors.yellow,
              padding: const EdgeInsets.symmetric(vertical: 6),
              alignment: Alignment.center,
              child: const Text('Cancel'),
            ),
          ),
        ],
      ),
    );
  }
}
