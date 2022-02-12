import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop_app/components/shared/cubit.dart';
import 'package:shop_app/components/shared/dio.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/models/Category.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/models/UserProduct.dart';
import 'package:shop_app/screens/home/cubit/home_state.dart';
import 'package:shop_app/screens/home/home_screen.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(InitialState());
  //late String token;
  static double totale = 0;
  static HomeCubit get(context) => BlocProvider.of(context);
  //late CategoriesDataModel  categories;
  //late final category ;
  List<Category> categories = [];
  static List<Category> categoriesName = [];

  static List<Product> products = [];
  List<Color> colors = [];
  static List<Cart> cart = [];
  static List<UserProduct> userProduct = [];
  static List<UserProduct> userFavorite = [];
  static List<ImagePicker> productImages = [];
  static List<String> category = [];
  static Map<String, String> categoryWithId = {'': ""};
  //PickedFile file = new PickedFile("");
  PickedFile? file;

  List<PickedFile> files = [];
  String id = '';

  static String? category_id;

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController categoryController = TextEditingController();

  //late ProductDataModel products;

  void getCategories() {
    final storage = new FlutterSecureStorage();
    storage.read(key: "token").then((value) {
      LoginDio.getCategory(
        url: "api/v1/categories",
        token: value.toString(),
      ).then((value) {
        categories = value;

        value.forEach((element) {
          category.add(element.name);
          categoryWithId[element.name] = element.id.toString();
        });

        emit(LoadingCategory());
      });
    });
  }

  chooseImage() async {
    // ignore: deprecated_member_use
    file = await ImagePicker().getImage(
        source: ImageSource.gallery,
        imageQuality: 50,
        maxHeight: 500.0,
        maxWidth: 500.0);
    if (file!.path.isNotEmpty) {
      files.add(file!);
    }
  }

  void createProduct({
    required BuildContext context,
  }) async {
    String filename = files[0].path.split('/').last;
    print(file!.path);
    var data = FormData.fromMap({
      "images": 
        await MultipartFile.fromFile(
          file!.path,
          filename: filename,
        ),
      "name": nameController.text,
      "description": descriptionController.text,
      "quantity": quantityController.text,
      "status": statusController.text,
      "price": priceController.text,
      "category_id": category_id,
      "user_id": AppCubit.user_id,
    });
    final storage = new FlutterSecureStorage();
    storage.read(key: "token").then((value) {
      LoginDio.createDocument(
              url: "api/v1/products", info: data, token: value.toString())
          .then((value) {
        print(value);
        emit(AddProduct());
        Navigator.pushNamed(context, HomeScreen.routeName); 
      }).catchError((onError) {
        print(onError);
      });
    });
  }

  void getProduct() {
    final storage = new FlutterSecureStorage();
    storage.read(key: "token").then((value) {
      LoginDio.getProduct(
        url: "api/v1/products",
        token: value.toString(),
      ).then((value) {
        print("ha lenght mn home");
        print(value.length);
        products = value;
        products.forEach((element) {
          element.images.forEach((elt) {
            elt.image =
                elt.image.replaceAll("localhost", "192.168.43.162:8000");
            print("ha ana 71 f home cubit");
          });
        });
        emit(LoadingProduct());
      });
    });
  }

  void changeSelected() {
    emit(ChangeValue());
  }

  void addToFavorite({
    required int user_id,
    required int product_id,
  }) {
    final storage = new FlutterSecureStorage();
    storage.read(key: "token").then((value) {
      print("hhhhhhh the old token${value.toString()}");
      LoginDio.postData(
          url: "api/v1/favorite",
          token: value.toString(),
          data: {"user_id": user_id, "product_id": product_id}).then((value) {
        print(value);
        emit(AddToFavorite());
      }).catchError((onError) {
        print(onError);
      });
    });
  }

  void removeFromFavorite({
    required int user_id,
    required int product_id,
  }) {
    final storage = new FlutterSecureStorage();
    storage.read(key: "token").then((value) {
      print("hhhhhhh the old token${value.toString()}");
      LoginDio.postData(
          url: "api/v1/remove",
          token: value.toString(),
          data: {"user_id": user_id, "product_id": product_id}).then((value) {
        print(value);
        emit(RemoveFromToFavorite());
      }).catchError((onError) {
        print(onError);
      });
    });
  }

  void getCart({
    required int user_id,
  }) {
    final storage = new FlutterSecureStorage();
    storage.read(key: "token").then((value) {
      LoginDio.getCart(
        url: "api/v1/cart?user_id=${user_id}",
        token: value.toString(),
      ).then((value) {
        print(value.length);
        cart = value;
        totale = 0;
        value.forEach((element) {
          totale = totale + (double.parse(element.price) * element.quantity);
          element.images.first.image = element.images.first.image = element
              .images.first.image
              .replaceAll("localhost", "192.168.43.162:8000");
          print("ha ana line 137");
        });
      }).catchError((onError) {
        print(onError);
      });
    });
  }

  void changeColor() {
    emit(ChangeColor());
  }

  void changerCounter() {
    emit(ChangerCounter());
  }

  void addToCart({
    required int user_id,
    required int product_id,
    required int quantity,
    required List<int> color,
  }) {
    final storage = new FlutterSecureStorage();
    storage.read(key: "token").then((value) {
      print("hhhhhhh the old token${value.toString()}");
      LoginDio.postData(url: "api/v1/carts", token: value.toString(), data: {
        "user_id": user_id,
        "product_id": product_id,
        'quantity': quantity,
        "color": color
      }).then((value) {
        print(value);
        Fluttertoast.showToast(
            msg: "Added To Cart",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.SNACKBAR,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.orange,
            textColor: Colors.white,
            fontSize: 16.0);
        emit(AddToCart());
      }).catchError((onError) {
        print(onError);
      });
    });
  }

  void removeFromCart({
    required int user_id,
    required int cart_id,
  }) {
    final storage = new FlutterSecureStorage();
    storage.read(key: "token").then((value) {
      print("hhhhhhh the old token${value.toString()}");
      LoginDio.postData(
          url: "api/v1/carts/remove",
          token: value.toString(),
          data: {"user_id": user_id, "cart_id": cart_id}).then((value) {
        print(value);
        emit(RemoveFromToFavorite());
      }).catchError((onError) {
        print(onError);
      });
    });
    emit(RemoveFromCart());
  }

  void getUserProduct({
    required int user_id,
  }) {
    final storage = new FlutterSecureStorage();
    storage.read(key: "token").then((value) {
      LoginDio.getUserProduct(
        url: "api/v1/products/${user_id}",
        token: value.toString(),
      ).then((value) {
        print(value.length);
        userProduct = value;
        userProduct.forEach((element) {
          element.images.first.image = element.images.first.image
              .replaceAll("localhost", "192.168.43.162:8000");
          print("ha ana line 215");
        });
        totale = 0;
        value.forEach((element) {
          totale = totale + (double.parse(element.price) * element.quantity);
        });
      }).catchError((onError) {
        print(onError);
      });
    });
  }

  void getUserFavorite({
    required int user_id,
  }) {
    final storage = new FlutterSecureStorage();
    storage.read(key: "token").then((value) {
      LoginDio.getUserFavorite(
        url: "api/v1/favorite/user/${user_id}",
        token: value.toString(),
      ).then((value) {
        print(value.length);
        userFavorite = value;
        userFavorite.forEach((element) {
          element.images.first.image = element.images.first.image
              .replaceAll("localhost", "192.168.43.162:8000");
          print("ha ana line 241");
        });
      }).catchError((onError) {
        print(onError);
      });
    });
  }

  void removeFromProduct({
    required int product_id,
  }) {
    final storage = new FlutterSecureStorage();
    storage.read(key: "token").then((value) {
      print("hhhhhhh the old token${value.toString()}");
      LoginDio.postData(
          url: "api/v1/products/user",
          token: value.toString(), data: {
            "product_id":product_id,
          },
         ).then((value) {
        print(value);
        emit(RemoveFromToProduct());
      }).catchError((onError) {
        print(onError);
      });
    });
    emit(RemoveFromCart());
  }
}
