import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/components/shared/appState.dart';
import 'package:shop_app/components/shared/cubit.dart';
import 'package:shop_app/controllers/MenuController.dart';
import 'package:shop_app/models/User.dart';
import 'package:shop_app/screens/cart/cart_screen.dart';
import 'package:shop_app/screens/favorite/cart_screen.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/main/main_screen.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>AppCubit(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                ProfilePic(),
                SizedBox(height: 20),
                ProfileMenu(
                  text: "Home",
                  icon: "assets/icons/Shop Icon.svg",
                  press: () {
                    Navigator.pushNamed(context, HomeScreen.routeName);
                  },
                ),
             
                ProfileMenu(
                  text: "Favorite",
                  icon: "assets/icons/Heart Icon.svg",
                  press: () {
                    Navigator.pushNamed(context, FavoriteScreen.routeName);
                     
                  },
                ),
                ProfileMenu(
                  text: "Cart",
                  icon: "assets/icons/Cart Icon.svg",
                  press: () {
                    Navigator.pushNamed(context, CartScreen.routeName);
                  },
                ),
                ProfileMenu(
                  text: "Log Out",
                  icon: "assets/icons/Log out.svg",
                  press: () {
                    cubit.logout(context: context);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
