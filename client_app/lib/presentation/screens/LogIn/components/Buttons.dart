import 'package:client_app/data/cubits/Login_cubit/login_cubit.dart';
import 'package:client_app/helpers/CacheHelper.dart';
import 'package:client_app/helpers/myApplication.dart';
import 'package:client_app/presentation/screens/LogIn/LogIn.dart';
import 'package:client_app/presentation/screens/OnboardingScreen/OnBoarding.dart';
import 'package:client_app/presentation/screens/Registration/Registeration.dart';
import 'package:client_app/presentation/widgets/MyButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Buttons extends StatelessWidget {
  final GlobalKey<FormState>? formKey;
  const Buttons({this.formKey});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MyApplication.hightClc(context, 8),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Recover Password",
              style: TextStyle(
                  fontSize: 16,
                  color:
                      Theme.of(context).colorScheme.primary.withOpacity(0.8)),
            )
          ],
        ),
        SizedBox(
          height: MyApplication.hightClc(context, 24),
        ),
        BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              if (state.myLoginModel.success!) {
                CacheHelper.saveToShared(
                    'name', state.myLoginModel.data!.name!);
                CacheHelper.saveToShared(
                        'token', state.myLoginModel.data!.token!)
                    .then((value) =>
                        MyApplication.navigateToRemove(context, OnBoarding()));
                // print(CacheHelper.getToken("token"));
              } else {}
            }
          },
          builder: (context, state) {
            return state is! LoginLoading
                ? MyButton(
                    myColor: Theme.of(context).colorScheme.primary,
                    txt: "Login",
                    onPressedHandler: () {
                      if (formKey!.currentState!.validate()) {
                        context.read<LoginCubit>().userLogin(
                            phone:
                                "${countryCode?.dialCode ?? '+966'}${phoneText.text}",
                            password: passwordText.text);
                      }
                    },
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
        SizedBox(
          height: MyApplication.hightClc(context, 24),
        ),
        Row(
          children: [
            Expanded(
                child: MyButton(
              myColor: Color(0xFF363537),
              txt: "Register",
              onPressedHandler: () {
                MyApplication.navigateTo(Registration(), context);
              },
            )),
            SizedBox(
              width: MyApplication.widthClc(context, 24),
            ),
            Expanded(
                child: MyButton(
              myColor: Color(0xff707070),
              txt: "Visitor",
              onPressedHandler: () {},
            ))
          ],
        ),
      ],
    );
  }
}
