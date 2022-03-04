import 'package:data/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:model/model.dart';

@injectable
class ProductsAppState with ChangeNotifier {
  ProductsAppState(this._productService){
    _initProducts();
  }
  late final ProductsService _productService;
  late List<ProductData> products;
  List<ProductData> cart = [];

  bool get isLoaded => products.isNotEmpty;

  // ignore: avoid_void_async
  void _initProducts() async {
    products = await _productService.getProducts();
    notifyListeners();
  }
}