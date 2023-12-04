import 'package:model/model.dart';

abstract class ProductsService{
  Future<List<ProductData>> getProducts();
  Future<ProductData> getProductById(int id);
  Future<List<ProductData>> getCart();
  void addProductToCart(ProductData product);
  void removeProductFromCart(ProductData product);
}