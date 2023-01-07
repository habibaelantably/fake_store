// import 'package:dio/dio.dart';
//
// import '../end_points.dart';
//
// class DioHelper {
//   static Dio? dio;
//
//   static init() {
//     dio = Dio(
//       BaseOptions(
//         baseUrl: baseURL,
//         receiveDataWhenStatusError: true,
//       ),
//     );
//   }
//
//   static Future<Response> getData({
//     required String url,
//     String? token,
//     Map<String, dynamic>? query,
//     bool isMultipart = false,
//   }) async {
//     dio!.options.headers = {
//       if (isMultipart) 'Content-Type': 'multipart/form-data',
//       if (!isMultipart) 'Content-Type': 'application/json',
//       if (!isMultipart) 'Accept': 'application/json',
//       if (token != null) 'Authorization': 'Bearer $token',
//     };
//     return await dio!.get(url, queryParameters: query);
//   }
//
//   static Future<Response> postData({
//     required String url,
//     Map<String, dynamic>? query,
//     String? token,
//     body,
//     bool isMultipart = false,
//   }) async {
//     dio!.options.headers = {
//       if (isMultipart) 'Content-Type': 'multipart/form-data',
//       if (!isMultipart) 'Content-Type': 'application/json',
//       if (!isMultipart) 'Accept': 'application/json',
//       if (token != null) 'Authorization': 'Bearer $token',
//     };
//     return await dio!.post(url, data: body);
//   }
// }

import 'package:dio/dio.dart';
import 'package:fake_store/domain_layer/end_points.dart';


class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseURL,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    required Map<String, dynamic> query,
    String? token
  }) async
  {
    dio!.options.headers = {
      // 'lang': getLanguage() !=null ? getLanguage().toString(): "ar",
      // 'currency': getCurrency() !=null ? '${utf8.fuse(base64).encode(getCurrency().toString())}' : '${utf8.fuse(base64).encode("${LocaleKeys.k_currency.tr()}")}',
      'Authorization': 'Bearer $token',
      //'Content-Type': 'application/json',
      "Accept":"application/json",
    };
    return await dio!.get(url, queryParameters: query,);
  }
//////////////////////////////////////////////////////////////////////////
  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String lang = 'en',
    String? token,
    String?type
  }) async {
    dio!.options.headers = {
      //'lang': getLanguage()!=null ? getLanguage().toString(): "ar",
      //'currency': getCurrency() !=null ? '${utf8.fuse(base64).encode(getCurrency().toString())}' : '${utf8.fuse(base64).encode("${LocaleKeys.k_currency.tr()}")}',
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    };
    return await dio!.post(url, data: data);
  }
////////////////////////////////////////////////////////////////////////////////
  static Future<Response> putData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio!.options.headers = {
      // 'lang': getLanguage()!=null ? getLanguage().toString(): "ar",
      //'currency': getCurrency() !=null ?  '${utf8.fuse(base64).encode(getCurrency().toString())}' : '${utf8.fuse(base64).encode("${LocaleKeys.k_currency.tr()}")}',
      'Authorization': token ?? '',
      'Content-Type': 'application/json',
    };

    return dio!.put(
      url,
      queryParameters: query,
      data: data,
    );
  }
}




