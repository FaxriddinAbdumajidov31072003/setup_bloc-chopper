import 'package:dartz/dartz.dart';
import 'package:setup_provider/domain/model/shop_model.dart';

abstract class ShopFacade{

  Future<Either<ShopListModel,String>> getShopList();

}