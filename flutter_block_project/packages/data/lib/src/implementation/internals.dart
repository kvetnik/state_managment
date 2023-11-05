import 'package:data/data.dart';
import 'package:injectable/injectable.dart';
import 'package:model/model.dart';

@LazySingleton(as: ProductsService)
class ConstProductsService implements ProductsService {
  final List<ProductData> _allProducts = <ProductData> [
    ProductData(id: 1, name: 'Ручка'),
    ProductData(id: 2, name: 'Карандаш'),
    ProductData(id: 3, name: 'Велосипед'),
    ProductData(id: 4, name: 'Стол'),
    ProductData(id: 5, name: 'Стул'),
    ProductData(id: 6, name: 'Телефон'),
  ];

  final List<ProductData> _cart = List.empty(growable: true);

  Future<ProductData> getProductById(int id) async {
    // await Future<Product>.delayed(
    //     const Duration(
    //       seconds: 4,
    //     )
    // );
    return ProductData(id: id, name: _allProducts.elementAt(id-1).name);
  }

  Future<List<ProductData>> getProducts() async {
    // await Future<Product>.delayed(
    //     const Duration(
    //       seconds: 4,
    //     )
    // );
    return _allProducts;
  }

  Future<List<ProductData>> getCart() async {
    // await Future<Product>.delayed(
    //     const Duration(
    //       seconds: 4,
    //     )
    // );
    return _cart;
  }

  void addProductToCart(ProductData product) async {
    // await Future<Product>.delayed(
    //     const Duration(
    //       seconds: 4,
    //     )
    // );
    print(product.name);
    _cart.add(product);
  }

  void removeProductFromCart(ProductData product) async {
    // await Future<Product>.delayed(
    //     const Duration(
    //       seconds: 4,
    //     )
    // );
    print(product.name);
    _cart.remove(product);
  }
}