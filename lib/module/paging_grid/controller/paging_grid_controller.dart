import 'package:flutter/material.dart';
import 'package:paging_listview/core.dart';
import '../service/product_service.dart';
import '../view/paging_grid_view.dart';

class PagingGridController extends State<PagingGridView> {
  static late PagingGridController instance;
  late PagingGridView view;

  @override
  void initState() {
    instance = this;
    getProducts();
    scrollController.addListener(() {
      if (loading) return;
      double offset = scrollController.offset;
      double maxOffset = scrollController.position.maxScrollExtent;
      // print("offset: $offset");
      // print("maxOffset: $maxOffset");
      if (offset == maxOffset) {
        nextPage();
      }
    });
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  int page = 0;
  int pageDisplay = 0;

  ScrollController scrollController = ScrollController();

  List products = [];
  bool loading = false;

  nextPage() async {
    loading = true;
    page++;
    List newItems = await ProductService().getProduct(page: page * 10);
    if (newItems.isEmpty) {
      page--;
    }
    pageDisplay = page;
    products.addAll(newItems);
    loading = false;
    setState(() {});
  }

  getProducts() async {
    products = await ProductService().getProduct(page: page * 10);
    setState(() {});
  }
}
