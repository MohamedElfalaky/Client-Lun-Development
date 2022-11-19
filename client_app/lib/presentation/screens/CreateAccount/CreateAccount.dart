import 'package:client_app/data/cubits/cubit/create_acc_cubit.dart';
import 'package:client_app/helpers/AppLocalizations.dart';
import 'package:client_app/presentation/widgets/shared.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreateAccount extends StatefulWidget {
  final String? phone;
  const CreateAccount({super.key, this.phone});
  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  static final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
              padding: const EdgeInsets.all(24),
              child: ListView(
                shrinkWrap: true,
                // reverse: true,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 25),
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
                  SvgPicture.asset(
                    'Logo'.tr(context),
                    color: Theme.of(context).colorScheme.primary,
                    semanticsLabel: 'Acme Logo',
                    width: 109,
                    height: 152,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Text(
                          'welcome to'.tr(context),
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.headline5!.color,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.1),
                        ),
                        Text(
                          'talabatkom'.tr(context),
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.1),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'agree'.tr(context),
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Theme.of(context).hintColor,
                              fontSize: 16,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'privacy policy'.tr(context),
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Theme.of(context).hintColor,
                                  fontSize: 16,
                                  height: -.5,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  'terms of use'.tr(context),
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 16,
                                    height: -.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 380,
                      height: 425,
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
                          key: _formKey,
                          child: ListView(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'username'.tr(context),
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .color,
                                  fontSize: 16,
                                  // fontWeight: FontWeight.w500,
                                  // letterSpacing: 0.8,
                                  height: 3,
                                ),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              defaultTextField(
                                textColor: Theme.of(context).hintColor,
                                validate: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'type your name'.tr(context);
                                  }
                                  return null;
                                },
                                width: 348,
                                height: 48,
                                // color: const Color(0xffF2F2F2),
                                cursorColor: Theme.of(context).hintColor,
                                textSize: 16,
                                hint: 'type your name'.tr(context),
                                radius: 10,
                                borderColor: Colors.white,
                                // label: "Phone",
                                controller: nameController,
                                type: TextInputType.phone,
                                isBorder: true,
                              ),
                              Text(
                                'password'.tr(context),
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .color,
                                  fontSize: 16,
                                  // fontWeight: FontWeight.w500,
                                  // letterSpacing: 0.8,
                                  height: 3,
                                ),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              defaultTextField(
                                textColor: Theme.of(context).hintColor,
                                validate: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'type your password'.tr(context);
                                  }
                                  if (value.length < 8 || value.length > 8) {
                                    return 'password hint'.tr(context);
                                  }

                                  return null;
                                },
                                suffixColor: Theme.of(context).hintColor,
                                isPassword: context
                                    .watch<CreateAccCubit>()
                                    .isHiddenConfirmPass,
                                suffix: context.select(
                                    (CreateAccCubit b) => b.securityIcon2),
                                suffixPressed: () {
                                  context
                                      .read<CreateAccCubit>()
                                      .showConfirmPassWord();
                                },
                                width: 348,
                                height: 48,
                                // color: const Color(0xffF2F2F2),
                                cursorColor: Theme.of(context).hintColor,
                                textSize: 16,
                                // hint: 'type your name'.tr(context),
                                label: 'password'.tr(context),
                                radius: 10,
                                borderColor: Colors.white,
                                // label: "Phone",
                                controller: passwordController,
                                type: TextInputType.phone,
                                isBorder: true,
                              ),
                              // Text(
                              //   'password hint'.tr(context),
                              //   style: TextStyle(
                              //       height: 2,
                              //       fontSize: 12,
                              //       color: Theme.of(context)
                              //           .textTheme
                              //           .headline5!
                              //           .color),
                              // ),
                              const SizedBox(
                                height: 1,
                              ),
                              Text(
                                'confirm password'.tr(context),
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .color,
                                  fontSize: 16,
                                  // fontWeight: FontWeight.w500,
                                  // letterSpacing: 0.8,
                                  height: 3,
                                ),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              defaultTextField(
                                textColor: Theme.of(context).hintColor,
                                validate: (String? value) {
                                  if (value! != passwordController.text) {
                                    return 'confirm password hint'.tr(context);
                                  }
                                  return null;
                                },
                                suffixColor: Theme.of(context).hintColor,
                                isPassword: context
                                    .watch<CreateAccCubit>()
                                    .isHiddenPass,
                                suffix: context.select(
                                    (CreateAccCubit a) => a.securityIcon),
                                suffixPressed: () {
                                  context.read<CreateAccCubit>().showPassWord();
                                },
                                width: 348,
                                height: 48,
                                // color: const Color(0xffF2F2F2),
                                cursorColor: Theme.of(context).hintColor,
                                textSize: 16,
                                // hint: 'type your name'.tr(context),
                                label: 'confirm password'.tr(context),
                                radius: 10,
                                borderColor: Colors.white,
                                // label: "Phone",
                                controller: confirmPassword,
                                type: TextInputType.phone,
                                isBorder: true,
                              ),
                              // Text(
                              //   'confirm password hint'.tr(context),
                              //   style: TextStyle(
                              //       height: 2,
                              //       fontSize: 12,
                              //       color: Theme.of(context)
                              //           .textTheme
                              //           .headline5!
                              //           .color),
                              // ),
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                height: 56,
                                width: 347.8,
                                child: BlocConsumer<CreateAccCubit,
                                    CreateAccState>(
                                  listener: (context, state) {
                                    if (state is CreateAccSuccess) {
                                      print(state.createAccount.message);
                                      if (state.createAccount.success == true) {
                                        if (kDebugMode) {
                                          print('phone is exist');
                                        }
                                        // showToast(
                                        //   state.createAccount!.message!,
                                        // );
                                        // MyApplication.navigateTo(
                                        //   SendOTP(phone: _phone.text),
                                        //   context,
                                        // );
                                      } else {
                                        if (kDebugMode) {
                                          print('phone is not exist');
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
                                    if (state is CreateAccLoading) {
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
                                        if (_formKey.currentState!.validate()) {
                                          context
                                              .read<CreateAccCubit>()
                                              .createAccount(
                                                  name: nameController.text,
                                                  phone: widget.phone!,
                                                  password:
                                                      passwordController.text);
                                        }
                                      },
                                      child: Text(
                                        'register'.tr(context),
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
