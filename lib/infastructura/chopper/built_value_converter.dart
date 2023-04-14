import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:chopper/chopper.dart';

import 'serializer.dart';

class BuiltValueConverter extends JsonConverter {
  @override
  Request convertRequest(Request request) => super.convertRequest(
        request.copyWith(
          body: serializers.serializeWith(
            serializers.serializerForType(request.body.runtimeType)!,
            request.body,
          ),
        ),
      );

  @override
  Future<Response<BodyType>> convertResponse<BodyType, T>(
    Response response,
  ) async {
    final dynamicResponse = await super.convertResponse(response);
    final customBody = _convertToObject<T>(dynamicResponse.body) as BodyType;
    return dynamicResponse.copyWith<BodyType>(body: customBody);
  }

  dynamic _convertToObject<T>(element) {
    if (element is T) {
      return element;
    }
    if (element is List) {
      return _deserializeListOf<T>(element);
    }
    return _deserialize<T>(element as Map<String, dynamic>);
  }

  BuiltList<T> _deserializeListOf<T>(List dynamicList) => BuiltList<T>(
        dynamicList.map(
          (element) => _deserialize<T>(element as Map<String, dynamic>),
        ),
      );

  T _deserialize<T>(Map<String, dynamic> value) => serializers.deserializeWith(
        serializers.serializerForType(T) as Serializer<T>,
        value,
      )!;
}
