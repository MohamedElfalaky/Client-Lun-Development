import 'dart:async';

import 'package:client_app/data/cubits/cubit/check_verfification_cubit.dart';
import 'package:client_app/helpers/AppLocalizations.dart';
import 'package:client_app/helpers/myApplication.dart';
import 'package:client_app/presentation/screens/CreateAccount/CreateAccount.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class SendOTP extends StatefulWidget {
  String? phone;
  SendOTP({super.key, this.phone});
  @override
  State<SendOTP> createState() => _SendOTPState();
}

class _SendOTPState extends State<SendOTP> {
  StreamController<ErrorAnimationType> errorController =
      StreamController<ErrorAnimationType>();
  TextEditingController textEditingController = TextEditingController();
  String currentText = "";
  var onTapRecognizer;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          body: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height - 100,
            color: Theme.of(context).colorScheme.secondary,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: ListView(
                shrinkWrap: true,
                reverse: true,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      height: 48,
                      width: 48,
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
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 78),
                    child: LottieBuilder.asset(
                        'assets/Images/lottie/Verfy_editor_sbg2yvry.json'),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'OTP Verification'.tr(context),
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Theme.of(context).textTheme.headline5!.color,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.1),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        width: 330,
                        height: 48,
                        child: Text(
                          "OTP Message".tr(context),
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
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 380,
                      height: 328,
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 16),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PinCodeTextField(
                              backgroundColor: Colors.transparent,
                              appContext: context,
                              length: 4,
                              obscureText: false,
                              animationType: AnimationType.fade,
                              pinTheme: PinTheme(
                                inactiveColor: Colors.white,
                                selectedColor: Colors.white,
                                selectedFillColor: Colors.white,
                                inactiveFillColor: Colors.white,
                                shape: PinCodeFieldShape.box,
                                borderRadius: BorderRadius.circular(10),
                                fieldHeight: 64,
                                fieldWidth: 75,
                                activeFillColor: Colors.white,
                              ),
                              animationDuration:
                                  const Duration(milliseconds: 300),
                              // backgroundColor: Colors.white,
                              enableActiveFill: true,
                              errorAnimationController: errorController,
                              controller: textEditingController,
                              onCompleted: (v) {
                                print("Completed");
                              },
                              onChanged: (value) {
                                print(value);
                                setState(() {
                                  currentText = value;
                                });
                              },
                              beforeTextPaste: (text) {
                                print("Allowing to paste $text");
                                //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                                //but you can show anything you want here, like your pop up saying wrong paste format or etc
                                return true;
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 56,
                              width: 347.8,
                              child: BlocConsumer<CheckVerfificationCubit,
                                  CheckVerfificationState>(
                                listener: (context, state) {
                                  if (state is CheckVerfificationLoaded) {
                                    if (state.checkVerfification!.success ==
                                        true) {
                                      if (kDebugMode) {
                                        print('success');
                                      }
                                      showToast(
                                        text:
                                            state.checkVerfification!.message!,
                                        color: ToastColors.success,
                                      );
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const CreateAccount(),
                                        ),
                                      );
                                    }
                                    if (state.checkVerfification!.success ==
                                        false) {
                                      if (kDebugMode) {
                                        showToast(
                                            text: state
                                                .checkVerfification!.message!,
                                            color: ToastColors.error);
                                      }

                                      // navigateTo(
                                      //   context,
                                      //   PhoneOTP(
                                      //     phone: _phone.text,
                                      //     flagNumber: flagNumber,
                                      //   ),
                                      // );
                                    }
                                  }
                                },
                                builder: (context, state) {
                                  if (state is CheckVerfificationLoading) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                  return ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      // backgroundColor: Theme.of(context).hintColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    onPressed: () {
                                      context
                                          .read<CheckVerfificationCubit>()
                                          .checkVerfification(
                                              widget.phone ?? "", currentText);
                                    },
                                    child: Text(
                                      'Next'.tr(context),
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
                            // const SizedBox(
                            //   height: 10,
                            // ),
                            SizedBox(
                              width: 347.8,
                              height: 100,
                              child: LottieBuilder.asset(
                                'assets/Images/lottie/Loading.json',
                                // fit: BoxFit.scaleDown,
                                // height: 100,
                                // width: 200,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Didn't have code?".tr(context),
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
                                    // Navigator.of(context).push(
                                    //   MaterialPageRoute(
                                    //     builder: (context) => const SignUp(),
                                    //   ),
                                    // );
                                  },
                                  child: Text(
                                    "Send again".tr(context),
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
                  // const Spacer(),
                ].reversed.toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    errorController.close();

    super.dispose();
  }

  @override
  void initState() {
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pop(context);
      };
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }
}
