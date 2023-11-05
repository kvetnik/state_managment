import 'package:data/data.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'block_factory.config.dart';

@InjectableInit()
void initializeState() {
  initializeServices();
  $initGetIt(GetIt.I);
}