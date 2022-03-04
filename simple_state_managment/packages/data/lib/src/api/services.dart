import 'package:model/model.dart';

abstract class UserService{
  Future<UserData> getDefaultUser();
  Future<UserData> getUserById(int id);
}

abstract class ProductsService{
  Future<List<ProductData>> getProducts();
  Future<ProductData> getProductById(int id);
}