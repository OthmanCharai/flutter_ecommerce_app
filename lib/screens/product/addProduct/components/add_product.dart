// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/components/custom_surfix_icon.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/form_error.dart';
import 'package:shop_app/components/shared/appState.dart';
import 'package:shop_app/components/shared/cubit.dart';
import 'package:shop_app/helper/keyboard.dart';
import 'package:shop_app/models/Category.dart';
import 'package:shop_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:shop_app/screens/home/cubit/home_cubit.dart';
import 'package:shop_app/screens/home/cubit/home_state.dart';
import 'package:shop_app/screens/login_success/login_success_screen.dart';
import 'package:shop_app/size_config.dart';

class AddProductForm extends StatelessWidget {
  AddProductForm({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeCubit()..getCategories(),
      child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = HomeCubit.get(context);
            print("ha ana ${HomeCubit.categoriesName.length}");
            //cubit.addError()
            return Form(
              key: _formKey,
              child: Column(
                children: [
                  //buildEmailFormField(),
                  TextFormField(
                    controller: cubit.nameController,
                    decoration: InputDecoration(
                      labelText: "Name",
                      hintText: "Enter Product Name",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                    onFieldSubmitted: (value) {
                      print(value);
                    },
                    onChanged: (value) {
                      print(value);
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "name can t be null ";
                      } else {
                        cubit.nameController.text = value;
                      }
                    },
                  ),
                  SizedBox(height: getProportionateScreenHeight(30)),

                  TextFormField(
                    controller: cubit.descriptionController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "description",
                      hintText: "Enter the description",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                    onFieldSubmitted: (value) {
                      print(value);
                    },
                    onChanged: (value) {
                      print(value);
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "description can t be null ";
                      } else {
                        cubit.descriptionController.text = value;
                      }
                    },
                  ),
                  SizedBox(height: getProportionateScreenHeight(30)),
                  //buildPasswordFormField(),
                  TextFormField(
                    controller: cubit.quantityController,
                    decoration: InputDecoration(
                      labelText: "quantity",
                      hintText: "Enter quantity",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                    onFieldSubmitted: (value) {
                      print(value);
                    },
                    onChanged: (value) {
                      print(value);
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "quantity can t be null ";
                      } else {
                        cubit.quantityController.text = value;
                      }
                    },
                  ),
                  SizedBox(height: getProportionateScreenHeight(30)),
                  //buildPasswordFormField(),
                  TextFormField(
                    controller: cubit.statusController,
                    decoration: InputDecoration(
                      labelText: "status",
                      hintText: "Enter status",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                    onFieldSubmitted: (value) {
                      print(value);
                    },
                    onChanged: (value) {
                      print(value);
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "status can t be null ";
                      } else {
                        cubit.statusController.text = value;
                      }
                    },
                  ),
                  SizedBox(height: getProportionateScreenHeight(30)),
                  //buildPasswordFormField(),
                  TextFormField(
                    controller: cubit.priceController,
                    decoration: InputDecoration(
                      labelText: "price",
                      hintText: "Enter price",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                    onFieldSubmitted: (value) {
                      print(value);
                    },
                    onChanged: (value) {
                      print(value);
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "price can t be null ";
                      } else {
                        cubit.priceController.text = value;
                      }
                    },
                  ),
                  SizedBox(height: getProportionateScreenHeight(30)),
                  //buildPasswordFormField(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: DropdownButton<String>(
                            hint: Text(
                              "Category",
                            ),
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.grey,
                            ),
                            iconSize: 32,
                            elevation: 4,
                            underline: Container(height: 0),
                            onChanged: (newValue) {
                              /*   var info = HomeCubit.categoriesName
                                  .where((element) => element.name == newValue!)
                                  .first; */
                              HomeCubit.category_id =
                                  HomeCubit.categoryWithId[newValue];
                              print("ha hiya id ${HomeCubit.category_id}");
                              cubit.changeSelected();
                            },
                            items: HomeCubit.category
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value.toString(),
                                child: Text(value.toString()),
                              );
                            }).toList()),
                      ),
                    ],
                  ),
                  SizedBox(height: getProportionateScreenHeight(30)),
                  DefaultButton(
                    text: "Upload Image",
                    press: cubit.chooseImage,
                  ),
                  SizedBox(height: getProportionateScreenHeight(30)),
                  Row(
                    children: [
                      /*  Checkbox(
                        value: remember,
                        activeColor: kPrimaryColor,
                        onChanged: (value) {
                          /*  setState(() {
                            remember = value;
                          }); */
                        },
                      ),
                      Text("Remember me"), */
                      Spacer(),
                      /*  GestureDetector(
                        onTap: () => Navigator.pushNamed(
                            context, ForgotPasswordScreen.routeName),
                        child: Text(
                          "Forgot Password",
                          style: TextStyle(decoration: TextDecoration.underline),
                        ),
                      ) */
                    ],
                  ),
                  // FormError(errors: errors),
                  SizedBox(height: getProportionateScreenHeight(20)),
                  DefaultButton(
                    text: "Continue",
                    press: () {
                      if (_formKey.currentState!.validate()) {
                        /* _formKey.currentState!.save(); */
                        // if all are valid then go to success screen
                        /*  KeyboardUtil.hideKeyboard(context);
                    Navigator.pushNamed(context, LoginSuccessScreen.routeName); */
                        cubit.createProduct(context: context);
                      }
                    },
                  ),
                ],
              ),
            );
          }),
    );
  }
}
