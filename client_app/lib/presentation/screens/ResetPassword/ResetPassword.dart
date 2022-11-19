import 'package:client_app/data/cubits/ResetPassWord/reset_password_cubit.dart';
import 'package:client_app/data/cubits/cubit/check_phone_cubit.dart';
import 'package:client_app/helpers/AppLocalizations.dart';
import 'package:client_app/helpers/myApplication.dart';
import 'package:client_app/presentation/screens/LogIn/LogIn.dart';
import 'package:client_app/presentation/screens/ResetPassOTP/ResetPassOTP.dart';
import 'package:client_app/presentation/screens/ResetPassword/Components/ResetTextField.dart';
import 'package:client_app/presentation/screens/SendOTP/SendOTP.dart';
import 'package:client_app/presentation/widgets/shared.dart';
import 'package:client_app/style/icons.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({
    super.key,
  });
  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _ResetFormKey = GlobalKey<FormState>();

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
                    ],
                  ),
                  SizedBox(
                      height: MyApplication.hightClc(context, 240),
                      width: MyApplication.widthClc(context, 240),
                      child: Lottie.asset(forgetPass)),
                  SizedBox(
                    height: MyApplication.hightClc(context, 24),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: MyApplication.widthClc(context, 360),
                      height: MyApplication.hightClc(context, 43),
                      child: Text(
                        'Reset Password'.tr(context),
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
                          "You will receive 4 digit code for phone number verification",
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
                      height: MyApplication.hightClc(context, 325),
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
                          key: _ResetFormKey,
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ResetTextField(),
                              SizedBox(
                                height: MyApplication.hightClc(context, 45),
                              ),
                              SizedBox(
                                height: MyApplication.hightClc(context, 56),
                                width: MyApplication.widthClc(context, 348),
                                child: BlocConsumer<ResetPasswordCubit,
                                    ResetPasswordState>(
                                  listener: (context, state) {
                                    if (state is ResetPasswordSuccess) {
                                      MyApplication.navigateTo(
                                          ResetPassOTP(
                                              phone:
                                                  "${countryCode?.dialCode ?? '+966'}${phoneText.text}"),
                                          context);
                                    }
                                  },
                                  builder: (context, state) {
                                    if (state is ResetPasswordLoading) {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                    return ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        // backgroundColor: Theme.of(context).hintColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      onPressed: () {
                                        if (_ResetFormKey.currentState!
                                            .validate()) {
                                          context
                                              .read<ResetPasswordCubit>()
                                              .ResetPass(
                                                phone:
                                                    "${countryCode?.dialCode ?? '+966'}${phoneText.text}",
                                              );
                                        }
                                      },
                                      child: Text(
                                        'Send OTP',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          // fontWeight: FontWeight.bold,
                                          // letterSpacing: 0.8,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                height: MyApplication.hightClc(context, 20),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'alreadyHaveAccount'.tr(context),
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Theme.of(context).hintColor,
                                      fontSize: 16,
                                      // fontWeight: FontWeight.w500,
                                      // letterSpacing: 0.8,
                                      height: 1.5,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => const LogIn(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'Login'.tr(context),
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 20,
                                        // fontWeight: FontWeight.w500,
                                        // letterSpacing: 0.8,
                                        height: 1.5,
                                      ),
                                    ),
                                  ),
                                ],
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
