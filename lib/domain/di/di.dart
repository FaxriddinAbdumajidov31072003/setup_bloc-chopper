
import 'package:get_it/get_it.dart';
import 'package:setup_provider/domain/facade/auth_facade.dart';
import 'package:setup_provider/domain/facade/shop_facade.dart';
import 'package:setup_provider/infastructura/chopper/api_chopper.dart';
import 'package:setup_provider/infastructura/repo/auth_repo.dart';

import '../../infastructura/repo/shop_repo.dart';

final getIt = GetIt.instance;


setUp(){
  getIt.registerSingleton<AuthFacade>(AuthRepo(AuthService.create()));
  getIt.registerSingleton<ShopFacade>(ShopRepo());
}

final authRepo = getIt.get<AuthFacade>();
final shopRepo = getIt.get<ShopFacade>();