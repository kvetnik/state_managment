import 'package:data/src/service_provider.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@InjectableInit()
void initializeServices() => $initGetIt(GetIt.I);