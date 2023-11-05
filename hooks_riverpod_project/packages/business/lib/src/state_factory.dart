import 'package:business/src/state_factory.config.dart';
import 'package:data/data.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@InjectableInit()
void initializeState() {
  initializeServices();
  $initGetIt(GetIt.I);
}