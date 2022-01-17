import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
/*  */
import 'package:shop_app/components/shared/appState.dart';
import 'package:shop_app/components/shared/dio.dart';
import 'package:shop_app/models/User.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/login_success/login_success_screen.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(InitialState());
  //late String token;
  late int index = 0;
  Map<dynamic, dynamic> user = Map<dynamic, dynamic>();

  late TextEditingController email;
  late TextEditingController password;
  /* late List<User> users; */
  bool isPasswword = true;
  final List<String?> errors = [];
  bool isVerfied = false;
  late UserModel authUser;

  /*
  // Instance of AppCubit
  */
  static AppCubit get(context) => BlocProvider.of(context);

  /*
  // Login Function
  */
  // ignore: must_call_super
  void adderror({String? error}) {
    if (!errors.contains(error)) errors.add(error);
  }

  /*
  //device_name
  */
  void login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    LoginDio.userLogin(url: "api/v1/login", info: {
      "email": email,
      "password": password,
      "device_name": "pc",
    }).then((value) {
      print("hahahahahowa");
      print(value.data['data']['token']);
      tryToken(token: value.data['data']['token'], context: context);
      print(value);
    }).catchError((onError) {
           Fluttertoast.showToast(
            msg: "Enter a valide User",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.SNACKBAR,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red[800],
            textColor: Colors.white,
            fontSize: 16.0);
        emit(InvalideUser());
    });

    /*    LoginDio.userLogin(
      url: "api/v1/login",
      info: {
      "email": email,
      "password": password,
      "device_name": "pc",
    }).then((value) {
      print(value);
       // tryToken(token: value.data['data']['token'].toString(), context: context);
    }).catchError((onError)); */
  }

  /*
  // Try Token
  */
  void tryToken({
    required String? token,
    required BuildContext context,
  }) async {
    print("THIS IS THE TOKEN${token}");
    print(token == null);
    if (token == null) {
      print("token is invalide ");
      return;
    }
    print("hada howa token ${token}");
    LoginDio.getData(url: "api/v1/user", token: token).then((value) {
      if (value.data['user']['email_verified_at'] == null) {
        Fluttertoast.showToast(
            msg: "please try to verifie your email",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.SNACKBAR,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.blue[800],
            textColor: Colors.white,
            fontSize: 16.0);
        emit(VerifyEmail());
        return;
      }
      authUser = UserModel(
        id: value.data['user']["id"],
        image: value.data['user']["image"],
        name: value.data['user']["name"],
        token: token,
        phone: value.data['user']["phone"],
        products: value.data['product'],
      );
      print(" hada zmel${authUser}");
      this.storeToken(token: token);
      print(value);
      Navigator.pushNamed(context, LoginSuccessScreen.routeName);
    }).catchError((onError) {
      Fluttertoast.showToast(
          msg: "Some Think was wrang please try again",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      emit(LoadingState());
    });
  }

  /*
  // Store Token
  */
  void storeToken({required String token}) async {
    final storage = new FlutterSecureStorage();
    if (token != "") {
      await storage.write(key: "token", value: token);
    }
  }

  /*
  // Read Token
  */
  void readToken({
    required BuildContext context,
  }) async {
    final storage = new FlutterSecureStorage();
    storage.read(key: "token").then((value) {
      print("hhhhhhh the old token${value.toString()}");
      tryToken(token: value, context: context);
    });
  }

  /*
  // Register Function
  */
  Future register({
    required String name,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    LoginDio.Register(url: "api/v1/register", info: {
      "email": email,
      "name": name,
      "password": password,
      "phone": "a",
      "image": "a",
    }).then((value) {
      print(value);
      LoginDio.SendVerificationEmail(
        url: "api/v1/email/verify",
        token: value.data['token'].toString(),
      ).then((value) {
        Fluttertoast.showToast(
            msg:
                "You have register with success virify your email address please",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.SNACKBAR,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      });
      Navigator.pushNamed(context, SignInScreen.routeName);
    }).catchError((error) {
      Fluttertoast.showToast(
          msg: "Some Think was wrang please try again",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      print(error);
    });
  }

  /*
  // Register Screen
  */
  void changeIndexToRegister() {
    this.index = 1;
    emit(ChangeIndexToRegister());
  }

  /*
  // Login Screen
  */
  void changeIndexToLogin() {
    this.index = 0;
    emit(ChangeIndexToLogin());
  }

  /*
  // Login Screen
  */
  void showPassword() {
    isPasswword = !isPasswword;
    emit(ShowPassword());
  }

  /*
  // Check Box Function
  */
  void changeChekBox() {
    emit(ChangeCheckBox());
  }

  /*
  // Logout Function
  */
  void logout({
    required BuildContext context,
  }) {
    final storage = new FlutterSecureStorage();
    storage.read(key: "token").then((value) {
      print(value.toString());
      LoginDio.logout(url: "api/v1/delete", token: value.toString())
          .then((value) {
        storage.delete(key: "token").then((value) {
          Navigator.pushNamed(context, SignInScreen.routeName);
        });
      }).catchError((error) {
        print(error);
      });
    });
  }
}
