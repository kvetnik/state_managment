import 'package:business/src/products_change_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:model/model.dart';

// ignore: lines_longer_than_80_chars
final productsProvider = StateNotifierProvider<ProductsNotifier, List<ProductData>>(
        (_) => GetIt.I.get<ProductsNotifier>());

final cartProvider = StateNotifierProvider<CartNotifier, List<ProductData>>(
        (_) => GetIt.I.get<CartNotifier>());