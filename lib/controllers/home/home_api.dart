import 'package:training/controllers/apis/api_dio.dart';
import 'package:training/models/product/product_response.dart';

abstract class HomeApiProtocol {
  getProducts({
    required Map<String, dynamic> params,
    required Function() beforeSend,
    required Function(ProductResponse data) onSuccess,
    required Function(dynamic error) onError,
  });
}

class HomeApi extends HomeApiProtocol {
  @override
  getProducts(
      {required Map<String, dynamic> params,
      required Function() beforeSend,
      required Function(ProductResponse data) onSuccess,
      required Function(dynamic error) onError}) {
    ApiDio(
      path: 'https://api.jsonbin.io/v3/b/62c54002f023111c70667fec',
      params: params,
    ).get(
      beforeSend: () => {beforeSend()},
      onSuccess: (data) {
        onSuccess(ProductResponse.fromJson(data));
      },
      onError: (error) => {onError(error)},
    );
  }
}
