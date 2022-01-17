import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shop_app/models/Category.dart';
import 'package:shop_app/models/Color.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/home/cubit/home_state.dart';

class LoginDio {
  static Dio dio = Dio();
  // initialise dio
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: "http://192.168.0.48:8000/",
        receiveDataWhenStatusError: true,
        responseType: ResponseType.json,
      ),
    );
    //
  }

/*
// Login
*/
  static Future<Response> userLogin({
    required String url,
    required Map info,
  }) async {
    return await dio.post(
      url,
      data: info,
    );
  }

/*
// get User
 */
  static Future<Response> getUser({
    required String url,
    String? token,
  }) async {
    return await dio.get(url,
        options: Options(headers: {"Authorization": "Bearer $token"}));
  }

  /*
  // Register
 */
  static Future<Response> Register({
    required String url,
    required Map info,
  }) async {
    return await dio.post(
      url,
      data: info,
    );
  }

  /*
  // Send Verification email
 */
  static Future<Response> SendVerificationEmail({
    required String url,
    required String token,
  }) async {
    return await dio.get(url,
        options: Options(headers: {"Authorization": "Bearer $token"}));
  }

  static Future<Response> logout({
    required String url,
    required String token,
  }) async {
    return await dio.get(url,
        options: Options(headers: {"Authorization": "Bearer $token"}));
  }

/*
//
*/
  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    return await dio.get(url,
        options: Options(headers: {"Authorization": "Bearer $token"}));
  }

  static Future<List<Category>> getCategory({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    //List<Category> categories = [];
    try {
      var response = await dio.get(url,
          options: Options(headers: {"Authorization": "Bearer $token"}));
      print("ha howa wrak mn category");
      print(jsonEncode(response.data[0]));
      final List<Category> categories =
          categoryFromJson(jsonEncode(response.data));

      return categoryFromJson(jsonEncode(response.data));
    } catch (error) {
      print("hada werrror");
      List<Category> cat = [];
      return cat;
    }
  }

  static Future<List<Product>> getProduct({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    print("ha howa wrak mn product");
    try {
      var response = await dio.get(url,
          options: Options(headers: {"Authorization": "Bearer $token"}));
      print(jsonEncode(response.data[0]));
      return productFromJson(jsonEncode(response.data));
    } catch (error) {
      print("hada werrror");
      List<Product> cat = [];
      return cat;
    }
  }

  static Future<List<Color>> getProductColor({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    print("ha howa wrak mn product");
    try {
      var response = await dio.get(url,
          options: Options(headers: {"Authorization": "Bearer $token"}));
      print(jsonEncode(response.data[0]));
      return colorFromJson(jsonEncode(response.data));
    } catch (error) {
      print("hada werrror");
      List<Color> cat = [];
      return cat;
    }
  }

  static Future<Response> postData({
    required String url,
    required Map data,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio.options.headers = {
      "Authorization": token ?? '',
      "Content-Type": 'application/json',
      "Accept": "application/json"
    };
    return dio.post(
      url,
      data: data,
    );
  }

  static Future<Response> putData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'Authorization': token ?? '',
      'Content-Type': 'application/json',
    };

    return dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
