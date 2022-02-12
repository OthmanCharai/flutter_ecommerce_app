import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/models/Category.dart';
import 'package:shop_app/models/Color.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/models/User.dart';
import 'package:shop_app/models/UserProduct.dart';
import 'package:shop_app/screens/home/cubit/home_state.dart';

class LoginDio {
  static Dio dio = Dio();
  // initialise dio
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: "http://192.168.43.162:8000/",
        receiveDataWhenStatusError: true,
         headers: {
          'Content-Type': 'application/json',
          "Accept": "application/json"
        },
        
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
    required String token,
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
      print("hada werrror ${error}");
      List<Product> cat = [];
      return cat;
    }
  }

  static Future<User> getUser({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    print("ha howa wrak mn USer");
    try {
      var response = await dio.get(url,
          options: Options(headers: {"Authorization": "Bearer $token"}));
   
      print(response);
      return userFromJson(jsonEncode(response.data));

    } catch (error) {
      print("hada werrror");
      throw Exception();
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
  static Future<List<Cart>> getCart({
      required String url,
 
      String? token,
    }) async {
      try {
        var response = await dio.get(url,
            options: Options(headers: {"Authorization": "Bearer $token"}),
          
            );
      print("ha howa wrak mn product");
        print(jsonEncode(response.data[0]));
        return cartFromJson(jsonEncode(response.data));
      } catch (error) {
        print("hada werrror ${error}");
        List<Cart> cat = [];

        return cat;
      }
    }
    static Future<List<UserProduct>> getUserProduct({
      required String url,
 
      String? token,
    }) async {
      try {
        var response = await dio.get(url,
            options: Options(headers: {"Authorization": "Bearer $token"}),
          
            );
      print("ha howa wrak mn product");
        print(jsonEncode(response.data[0]));
        return userProductFromJson(jsonEncode(response.data));
      } catch (error) {
        print("hada werrror ${error}");
        List<UserProduct> cat = [];

        return cat;
      }
    }
  static Future<List<UserProduct>> getUserFavorite({
      required String url,
 
      String? token,
    }) async {
      try {
        var response = await dio.get(url,
            options: Options(headers: {"Authorization": "Bearer $token"}),
          
            );
      print("ha howa wrak mn product");
        print(jsonEncode(response.data[0]));
        return userProductFromJson(jsonEncode(response.data));
      } catch (error) {
        print("hada werrror ${error}");
        List<UserProduct> cat = [];
        return cat;
      }
    }
  static Future<Response> postData({
    required String url,
    required Map data,
    required String token,
  }) async {
    return dio.post(
      url,
      data: data,
      options: Options(headers: {"Authorization": "Bearer $token"}, followRedirects: false,
            // will not throw errors
            validateStatus: (status) => true,)
    );
  }

  static Future<Response> createDocument({
    required String url,
    required FormData info,
    required String token,
  }) async {
    return await dio.post(url,
        data: info,
         options: Options(

            followRedirects: false,
            // will not throw errors
            validateStatus: (status) => true,
            headers: {"Authorization": "Bearer $token"}
          ),);
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
