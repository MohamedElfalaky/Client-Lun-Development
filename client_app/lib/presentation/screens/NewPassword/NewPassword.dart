import 'package:client_app/data/cubits/NewPassWord/new_pass_word_cubit_cubit.dart';
import 'package:client_app/data/cubits/cubit/check_phone_cubit.dart';
import 'package:client_app/helpers/AppLocalizations.dart';
import 'package:client_app/helpers/myApplication.dart';
import 'package:client_app/presentation/screens/LogIn/LogIn.dart';
import 'package:client_app/presentation/screens/NewPassword/Components/ConfirmPasswordTextField.dart';
import 'package:client_app/presentation/screens/NewPassword/Components/ResetPasswordTextField.dart';
import 'package:client_app/presentation/screens/SendOTP/SendOTP.dart';
import 'package:client_app/presentation/widgets/MyButton.dart';
import 'package:client_app/presentation/widgets/shared.dart';
import 'package:client_app/style/icons.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class NewPassword extends StatefulWidget {
  final phone;
  // final pass;
  const NewPassword({this.phone});
  @override
  State<NewPassword> createState() => _NewPasswordState();
}

final ResetpasswordText = TextEditingController();
final ConfirmpasswordText = TextEditingController();
final _newPassformKey = GlobalKey<FormState>();

class _NewPasswordState extends State<NewPassword> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            color: Theme.of(context).colorScheme.secondary,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MyApplication.hightClc(context, 24),
                  horizontal: MyApplication.widthClc(context, 24)),
              child: ListView(
                shrinkWrap: true,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: MyApplication.hightClc(context, 48),
                        width: MyApplication.widthClc(context, 48),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor:
                                Theme.of(context).hintColor.withOpacity(0.2),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "❮",
                            style: TextStyle(
                                // fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Theme.of(context).hintColor),
                          ),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(right: 15),
                          child: InkWell(
                            onTap: () =>
                                MyApplication.navigateTo(LogIn(), context),
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .hintColor
                                      .withOpacity(0.8),
                                  fontSize: 20),
                            ),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: MyApplication.hightClc(context, 60),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: MyApplication.widthClc(context, 360),
                      height: MyApplication.hightClc(context, 43),
                      child: Text(
                        'New Password',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Theme.of(context).textTheme.headline5!.color,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.1),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MyApplication.hightClc(context, 5),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: MyApplication.widthClc(context, 360),
                        height: MyApplication.hightClc(context, 48),
                        child: Text(
                          "Your new password must be different from the previous one",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Theme.of(context).hintColor,
                            fontSize: 16,
                            // fontWeight: FontWeight.w500,
                            letterSpacing: 0.8,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MyApplication.hightClc(context, 20),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: MyApplication.widthClc(context, 360),
                      height: MyApplication.hightClc(context, 400),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.white,
                            spreadRadius: 2,
                            // blurRadius: 5,
                            // offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Form(
                          key: _newPassformKey,
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BlocBuilder<NewPassWordCubit,
                                  NewPassWordCubitState>(
                                builder: (context, state) {
                                  return Column(
                                    children: [
                                      ResetPasswordTextField(),
                                      ConfirmPasswordTextField()
                                    ],
                                  );
                                },
                              ),
                              SizedBox(
                                height: MyApplication.hightClc(context, 45),
                              ),
                              SizedBox(
                                height: MyApplication.hightClc(context, 56),
                                width: MyApplication.widthClc(context, 348),
                                child: BlocConsumer<NewPassWordCubit,
                                    NewPassWordCubitState>(
                                  listener: (context, state) {
                                    // if (state is CheckPhoneLoaded) {
                                    //   print(state.checkPhone!.message);
                                    //   if (state.checkPhone!.success == true) {
                                    //     if (kDebugMode) {
                                    //       print('phone is exist');
                                    //     }
                                    //     // MyApplication.showToast(
                                    //     //     text: state.checkPhone!.message!,
                                    //     //     color: ToastColors.success);
                                    //     // MyApplication.navigateTo(
                                    //     //     SendOTP(phone: _phone.text), context);
                                    //   } else {
                                    //     if (kDebugMode) {
                                    //       print('phone is not exist');
                                    //     }
                                    //     // MyApplication.showToast(
                                    //     //     text: state.checkPhone!.message!,
                                    //     //     color: ToastColors.error);
                                    //     // navigateTo(
                                    //     //   context,
                                    //     //   PhoneOTP(
                                    //     //     phone: _phone.text,
                                    //     //     flagNumber: flagNumber,
                                    //     //   ),
                                    //     // );
                                    //   }
                                    // }
                                  },
                                  builder: (context, state) {
                                    if (state is NewPassWordLoading) {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                    return MyButton(
                                      txt: "Confirm",
                                      myColor:
                                          Theme.of(context).colorScheme.primary,
                                      onPressedHandler: () {
                                        if (_newPassformKey.currentState!
                                            .validate()) {
                                          context
                                              .read<NewPassWordCubit>()
                                              .newPass(
                                                  phone: widget.phone,
                                                  pass: ResetpasswordText.text);
                                        }
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
