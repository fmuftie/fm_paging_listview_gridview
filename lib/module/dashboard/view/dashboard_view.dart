import 'package:flutter/material.dart';
import 'package:paging_listview/core.dart';
// import '../controller/dashboard_controller.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  Widget build(context, DashboardController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PagingListView()),
                ),
                child: const Card(
                  child: ListTile(
                    title: Text("Paging List View"),
                    trailing: Icon(
                      Icons.arrow_forward,
                      size: 24.0,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PagingGridView()),
                ),
                child: const Card(
                  child: ListTile(
                    title: Text("Paging Grid View"),
                    trailing: Icon(
                      Icons.arrow_forward,
                      size: 24.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<DashboardView> createState() => DashboardController();
}
