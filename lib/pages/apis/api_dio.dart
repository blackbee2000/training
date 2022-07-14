import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;

import '../auth/login_page.dart';

const _defaultConnectTimeout = Duration.millisecondsPerMinute;
const _defaultReceiveTimeout = Duration.millisecondsPerMinute;

class ApiDio {
  // final String url = FlavorConfig.instance.values.baseUrl;
  // final String urlMMV = FlavorConfig.instance.values.urlMMV;
  // final String secrectKey = FlavorConfig.instance.values.appSecrect;
  final dynamic params;
  final String path;
  final dynamic type;

  ApiDio({
    this.type,
    required this.path,
    required this.params,
  });

  Dio _dio() {
    // Put your authorization token here
    return Dio(
      BaseOptions(
        // baseUrl: type == 'mmv' ? urlMMV : url,
        connectTimeout: _defaultConnectTimeout,
        receiveTimeout: _defaultReceiveTimeout,
        // headers: AuthService.to.isTokenExisted
        //     ? {
        //         'Content-Type': 'application/json; charset=UTF-8',
        //         'secretkey': secrectKey,
        //         'token': AuthService.to.appToken,
        //         'lang':
        //             AppTranslation.instance.language == AppTranslation.english
        //                 ? 'en'
        //                 : 'vi'
        //       }
        //     : {
        //         'Content-Type': 'application/json; charset=UTF-8',
        //         'secretkey': secrectKey,
        //         'lang':
        //             AppTranslation.instance.language == AppTranslation.english
        //                 ? 'en'
        //                 : 'vi'
        //       },
      ),
    )..interceptors.add(InterceptorsWrapper(
        onError: (DioError error, handler) {
          final errResponse = error.response;
          if (errResponse?.statusCode == 401) {
            getx.Get.offAll(() => LoginPage());
          }
        },
      ));
  }

  void get({
    required Function() beforeSend,
    required Function(dynamic data) onSuccess,
    required Function(dynamic error) onError,
  }) {
    beforeSend();
    _dio()
        .get(this.path, queryParameters: Map<String, dynamic>.from(this.params))
        .then((res) {
      onSuccess(res.data);
    }).catchError((error) {
      onError(error);
    });
  }

  void post({
    required Function() beforeSend,
    required Function(dynamic data) onSuccess,
    required Function(dynamic error) onError,
  }) {
    beforeSend();
    _dio().post(this.path, data: this.params).then((res) {
      onSuccess(res.data);
    }).catchError((error) {
      onError(error);
    });
  }

  void delete({
    required Function() beforeSend,
    required Function(dynamic data) onSuccess,
    required Function(dynamic error) onError,
  }) {
    beforeSend();
    _dio().delete(this.path, data: this.params).then((res) {
      onSuccess(res.data);
    }).catchError((error) {
      onError(error);
    });
  }

  void put({
    required Function() beforeSend,
    required Function(dynamic data) onSuccess,
    required Function(dynamic error) onError,
  }) {
    beforeSend();
    _dio().put(this.path, data: this.params).then((res) {
      onSuccess(res.data);
    }).printInfo(printFunction: (e) {});
  }

  void upload({
    required FormData formdata,
    required Function() beforeSend,
    required Function(dynamic data) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    beforeSend();
    _dio().post(this.path, data: formdata).then((res) {
      onSuccess(res.data);
    }).catchError((error) {
      onError(error);
    });
  }
}
