import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/components/shared/cubit.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/screens/home/cubit/home_cubit.dart';
import 'package:shop_app/screens/home/cubit/home_state.dart';

import 'components/body.dart';
import 'components/check_out_card.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          HomeCubit()..getCart(user_id: AppCubit.user_id),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          print("hahahahah ha ana ${HomeCubit.cart.length}");
          return ConditionalBuilder(
            builder: (BuildContext context) {
              return Scaffold(
                appBar: buildAppBar(context, HomeCubit.cart.length),
                body: Body(),
                bottomNavigationBar: CheckoutCard(),
              );
            },
            condition: HomeCubit.cart.length > 0,
            fallback: (context) => Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }

  AppBar buildAppBar(BuildContext context, int cart) {
    return AppBar(
      title: Column(
        children: [
          Text(
            "Your Cart",
            style: TextStyle(color: Colors.black),
          ),
          Text(
            "${cart} items",
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
