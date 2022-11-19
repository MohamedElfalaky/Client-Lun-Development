import 'package:client_app/data/cubits/Login_cubit/login_cubit.dart';
import 'package:client_app/helpers/myApplication.dart';
import 'package:client_app/presentation/screens/LogIn/LogIn.dart';
import 'package:client_app/presentation/widgets/MyFormTextField.dart';
import 'package:flutter/material.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: MyApplication.hightClc(context, 26),
        ),
        Text(
          "Password",
          style: Theme.of(context).inputDecorationTheme.hintStyle,
        ),
        SizedBox(
          height: MyApplication.hightClc(context, 8),
        ),
        MyFormTextField(
            obscrdTxt: LoginCubit.get(context).isHiddenPass,
            mySuffix: InkWell(
              child: LoginCubit.get(context).securityIcon,
              onTap: () {
                LoginCubit.get(context).showPassWord();
              },
            ),
            keyBrdType: TextInputType.visiblePassword,
            controller: passwordText,
            validator: (value) {
              if (value!.isEmpty) {
                return "please enter your Password";
              } else if (value.length <= 5) {
                return "Password must be more than 5 fileds";
              }
              return null;
            }),
      ],
    );
  }
}
