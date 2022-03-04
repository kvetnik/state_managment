import 'package:data/data.dart';
import 'package:injectable/injectable.dart';
import 'package:model/model.dart';

@LazySingleton(as: UserService)
class DummyService implements UserService {

  @override
  Future<UserData> getDefaultUser() async {
    await Future<UserData>.delayed(
      const Duration(
        seconds: 4,
      )
    );
    return const UserData(id: 1, name: 'Default');
  }

  @override
  Future<UserData> getUserById(int id) async {
    await Future<UserData>.delayed(
        const Duration(
          seconds: 4,
        )
    );
    return UserData(id: id, name: 'Specific User number $id');
  }
}

@LazySingleton(as: ProductsService)
class ConstProductsService implements ProductsService {

   final List<ProductData> _allProducts = <ProductData> [
     const ProductData(id: 1, name: 'Ручка'),
     const ProductData(id: 2, name: 'Карандаш'),
     const ProductData(id: 3, name: 'Велосипед'),
     const ProductData(id: 4, name: 'Стол'),
     const ProductData(id: 5, name: 'Стул'),
     const ProductData(id: 6, name: 'Телефон'),
  ];

  @override
  Future<ProductData> getProductById(int id) async {
    // await Future<ProductData>.delayed(
    //     const Duration(
    //       seconds: 4,
    //     )
    // );
    // ignore: lines_longer_than_80_chars
    return ProductData(id: id, name: _allProducts.elementAt(id-1).name);
  }


  @override
   Future<List<ProductData>> getProducts() async {
    // await Future<ProductData>.delayed(
    //     const Duration(
    //       seconds: 4,
    //     )
    // );
    return _allProducts;
  }
}