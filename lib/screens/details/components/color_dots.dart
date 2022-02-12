import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop_app/components/rounded_icon_btn.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/home/cubit/home_cubit.dart';
import 'package:shop_app/screens/home/cubit/home_state.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ColorDots extends StatelessWidget {
  static int counter = 0;
  const ColorDots({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    // Now this is fixed and only for demo
    counter = 0;
    int selectedColor = 0;
    return BlocProvider(
      create: (BuildContext context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: Row(
              children: [
                ...List.generate(
                  product.colors.length,
                  (index) => ColorDot(
                    color: HexColor(product.colors[index].color.toString()),
                    isSelected: index == selectedColor,
                    selectedColor: product.colors[index].id,
                  ),
                ),
                Spacer(),
               
                SizedBox(width: 5.0,),
                RoundedIconBtn(
                  icon: Icons.remove,
                  press: () {

                    counter--;
                    print(counter);
                    HomeCubit.get(context).changerCounter();
                  },
                ),
                SizedBox(width: getProportionateScreenWidth(20)),
                 Text(
                  "$counter",
                ),
                SizedBox(width: getProportionateScreenWidth(20)),

                RoundedIconBtn(
                  icon: Icons.add,
                  showShadow: true,
                  press: () {
                    counter++;
                    HomeCubit.get(context).changerCounter();
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

class ColorDot extends StatelessWidget {
  static List<int> index = [];

  const ColorDot({
    Key? key,
    required this.color,
    required this.selectedColor,
    this.isSelected = false,
  }) : super(key: key);

  final Color color;
  final bool isSelected;
  final int selectedColor;

  @override
  Widget build(BuildContext context) {
    ColorDot.index = [];
    bool a = false;
    return BlocProvider(
      create: (BuildContext context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) => {},
        builder: (context, state) {
          return GestureDetector(
            onTap: () {
              print("you select ${color}");
              a = !a;
              if (!a) {
                if (index.contains(selectedColor)) {
                  ColorDot.index.remove(selectedColor);
                }
              } else {
                if (!index.contains(selectedColor)) {
                  ColorDot.index.add(selectedColor);
                }
              }

              print(index.length);
              HomeCubit.get(context).changeColor();
            },
            child: Container(
              margin: EdgeInsets.only(right: 2),
              padding: EdgeInsets.all(getProportionateScreenWidth(8)),
              height: getProportionateScreenWidth(40),
              width: getProportionateScreenWidth(40),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border:
                    Border.all(color: a ? kPrimaryColor : Colors.transparent),
                shape: BoxShape.circle,
              ),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
