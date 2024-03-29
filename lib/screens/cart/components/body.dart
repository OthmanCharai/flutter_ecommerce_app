import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/screens/home/cubit/home_cubit.dart';
import 'package:shop_app/screens/home/cubit/home_state.dart';

import '../../../size_config.dart';
import 'cart_card.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) => {},
      builder: (context, state) {
        print("ahahahahahhhahahahahah00");
        var cubit = HomeCubit.get(context);
        return Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: ListView.builder(
            itemCount: HomeCubit.cart.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Dismissible(
                key: Key(HomeCubit.cart[index].price.toString()),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  cubit.removeFromCart(
                      user_id: HomeCubit.cart[index].id,
                      cart_id: HomeCubit.cart[index].carts[index].id);
                },
                background: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFE6E6),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Spacer(),
                      SvgPicture.asset("assets/icons/Trash.svg"),
                    ],
                  ),
                ),
                child: CartCard(cart: HomeCubit.cart[index]),
              ),
            ),
          ),
        );
      },
    );
  }
}
