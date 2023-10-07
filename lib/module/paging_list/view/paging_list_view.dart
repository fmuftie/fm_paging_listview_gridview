import 'package:flutter/material.dart';
import 'package:paging_listview/core.dart';
import '../controller/paging_list_controller.dart';

class PagingListView extends StatefulWidget {
  const PagingListView({Key? key}) : super(key: key);

  Widget build(context, PagingListController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: Text("Paging List View ${controller.page + 1}"),
        actions: const [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          controller: controller.scrollController,
          itemCount: controller.products.length,
          physics: const ScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            var item = controller.products[index];
            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey[200],
                  backgroundImage: NetworkImage(item["thumbnail"]),
                ),
                title: Text(item["title"]),
                subtitle: Text("\$${item["price"]}"),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  State<PagingListView> createState() => PagingListController();
}
