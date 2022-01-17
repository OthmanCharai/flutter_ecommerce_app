import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shop_app/components/shared/cubit.dart';
import 'package:shop_app/components/shared/dio.dart';
import 'package:shop_app/models/Category.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/home/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(InitialState());
  //late String token;
  static HomeCubit get(context) => BlocProvider.of(context);
  //late CategoriesDataModel  categories;
  //late final category ;
  List<Category> categories = [];
  List<Product> products = [];
  List<Color> colors = [];
  //late ProductDataModel products;

  void getCategories()  {
    final storage = new FlutterSecureStorage();
    storage.read(key: "token").then((value) {
      print("hhhhhhh the old token${value.toString()}");
      LoginDio.getCategory(
        url: "api/v1/categories",
        token: value.toString(),
      ).then((value) {
        categories = value;
        emit(LoadingCategory());

      });
    });
  }

  void getProduct()  {
    final storage = new FlutterSecureStorage();
    storage.read(key: "token").then((value) {
      print("hhhhhhh the old token${value.toString()}");
      LoginDio.getProduct(
        url: "api/v1/products",
        token: value.toString(),
      ).then((value) {
        products = value;
        print("hada product ${value}");
        //print("ana image awld l9ahba ${products[0].images.first.image}");
        emit(LoadingProduct());
      });
    });
  }

   

  
}
