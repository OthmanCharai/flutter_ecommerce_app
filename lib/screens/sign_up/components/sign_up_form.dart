import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/components/custom_surfix_icon.dart';
import 'package:shop_app/components/form_error.dart';
import 'package:shop_app/components/shared/appState.dart';
import 'package:shop_app/components/shared/cubit.dart';
import 'package:shop_app/helper/keyboard.dart';
import 'package:shop_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:shop_app/screens/login_success/login_success_screen.dart';

import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class SignUpForm extends StatelessWidget {
  SignUpForm({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  bool? remember = false;
  var AddressController = TextEditingController();
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  IconData icons = Icons.remove_red_eye;
/* 
  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  } */
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>AppCubit(),
      child: BlocConsumer<AppCubit, AppState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = AppCubit.get(context);
            //cubit.addError()
            return Form(
              key: _formKey,
              child: Column(
                children: [
                  //buildEmailFormField(),
                  TextFormField(
                    controller: nameController,
                     decoration: InputDecoration(
                      labelText: "Name",
                      hintText: "Enter your name",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      suffixIcon:
                          CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
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
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: getProportionateScreenHeight(30)),

                  TextFormField(
                    controller: AddressController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "Email",
                      hintText: "Enter your email",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      suffixIcon:
                          CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
                    ),
                    onFieldSubmitted: (value) {
                      print(value);
                    },
                    onChanged: (value) {
                      print(value);
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Email can t be null ";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: getProportionateScreenHeight(30)),
                  //buildPasswordFormField(),
                  TextFormField(
                    controller: passwordController,
                    obscureText: cubit.isPasswword,
                    decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "Enter your password",

                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      suffixIcon: IconButton(
                        icon: Icon(icons),
                        onPressed: () {
                          cubit.showPassword();
                          icons = cubit.isPasswword
                              ? Icons.visibility
                              : Icons.visibility_off;
                        },
                      ),
                    ),
                    onFieldSubmitted: (value) {
                      print(value);
                    },
                    onChanged: (value) {
                      print(value);
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password can t be null ";
                      } else {
                        return null;
                      }
                    },
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
                        cubit.register(
                            email: AddressController.text,
                            password: passwordController.text,
                            context: context,
                            name:nameController.text,
                            );
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
