import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/screens/home/cubit/home_cubit.dart';
import 'package:shop_app/screens/home/cubit/home_state.dart';

import '../../../size_config.dart';
import 'categories.dart';
import 'discount_banner.dart';
import 'home_header.dart';
import 'popular_product.dart';
import 'special_offers.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>HomeCubit()..getCategories()..getProduct(),
      child: BlocConsumer<HomeCubit,HomeState>(
        listener:(context,state){},
        builder: (context,state){
          return SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: getProportionateScreenHeight(20)),
                HomeHeader(),
                SizedBox(height: getProportionateScreenWidth(10)),
                DiscountBanner(),
                Categories(),
                SpecialOffers(),
                SizedBox(height: getProportionateScreenWidth(30)),
                PopularProducts(),
                SizedBox(height: getProportionateScreenWidth(30)),
              ],
            ),
          ),
        );
        },
      ),
    );
  }
}
