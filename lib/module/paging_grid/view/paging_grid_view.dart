import 'package:flutter/material.dart';
import 'package:paging_listview/core.dart';
import '../controller/paging_grid_controller.dart';

class PagingGridView extends StatefulWidget {
  const PagingGridView({Key? key}) : super(key: key);

  Widget build(context, PagingGridController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: Text("Paging Grid View ${controller.pageDisplay + 1}"),
        actions: const [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1.0,
            crossAxisCount: 2,
            mainAxisSpacing: 6,
            crossAxisSpacing: 6,
          ),
          controller: controller.scrollController,
          itemCount: controller.products.length,
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            var item = controller.products[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    height: 160.0,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          item["thumbnail"],
                        ),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          8.0,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 4.0,
                ),
                Text(
                  item["title"],
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 4.0,
                ),
                Text(
                  "\$${item["price"]}",
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  State<PagingGridView> createState() => PagingGridController();
}
