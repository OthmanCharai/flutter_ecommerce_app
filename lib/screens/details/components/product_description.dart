import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/components/shared/cubit.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/models/User.dart';
import 'package:shop_app/screens/home/cubit/home_cubit.dart';
import 'package:shop_app/screens/home/cubit/home_state.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ProductDescription extends StatelessWidget {
  
  const ProductDescription({
    Key? key,
    required this.product,
    this.pressOnSeeMore,
  }) : super(key: key);

  final Product product;
  final GestureTapCallback? pressOnSeeMore;

  @override
  Widget build(BuildContext context) {
    Favorite favorite = new Favorite(
        id: product.id,
        name: product.name,
        description: product.description,
        quantity: product.quantity,
        status: product.status,
        userId: product.userId,
        createdAt: product.createdAt,
        updatedAt: product.updatedAt,
        deletedAt: product.deletedAt,
        price: product.price,
        isPopulaire: product.isPopulaire,
        pivot: Pivot(
            userId: product.userId,
            productId: product.id,
            createdAt: null,
            updatedAt: null));
    bool a = false;
    int b = 0;
    AppCubit.favorites.forEach((element) {
      if (element.pivot.productId == favorite.pivot.productId) {
        a = true;
        b = element.pivot.productId;
      }
    });
    return BlocProvider(
      create: (BuildContext context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Text(
                  "${product.name}",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                  width: getProportionateScreenWidth(64),
                  decoration: BoxDecoration(
                    color: a
                        ? Color(0xFFFFE6E6)
                        : Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                  child: IconButton(
                    icon: SvgPicture.asset(
                      "assets/icons/Heart Icon_2.svg",
                      color: a ? Color(0xFFFF4848) : Color(0xFFDBDEE4),
                      height: getProportionateScreenWidth(16),
                    ),
                    onPressed: () {
                      a = !a;
                      if (!a) {
                        cubit.addToFavorite(
                            product_id: product.id, user_id: AppCubit.user_id);
                      } else {
                        cubit.removeFromFavorite(
                            product_id: product.id, user_id: AppCubit.user_id);
                      }
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: getProportionateScreenWidth(20),
                  right: getProportionateScreenWidth(64),
                ),
                child: Text(
                  product.description,
                  maxLines: 3,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20),
                  vertical: 10,
                ),
                child: GestureDetector(
                  onTap: () {



                  },
                  child: Row(
                    children: [
                    
                      SizedBox(width: 5),
                      
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
