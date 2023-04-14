import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:setup_provider/domain/model/shop_model.dart';

import '../../domain/facade/shop_facade.dart';
import '../servises/dio.dart';

class ShopRepo implements ShopFacade{
  @override
  Future<Either<ShopListModel, String>> getShopList() async {
    try {
      final res = await DioService.client().get("/api/v1/rest/shops/paginate?perPage=15&page=1&type=restaurant&lang=en");

      return left(ShopListModel.fromJson(res.data));
    } catch (e) {
      if (e is DioError) {
        if(e.response?.statusCode == 400){
          return right("Error");
        }else{
          return right(e.response?.statusCode.toString() ?? "something is wrong");
        }
      } else {
        return right(e.toString());
      }
    }
  }

}