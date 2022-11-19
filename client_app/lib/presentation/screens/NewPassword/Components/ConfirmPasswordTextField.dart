import 'package:client_app/data/cubits/Login_cubit/login_cubit.dart';
import 'package:client_app/data/cubits/NewPassWord/new_pass_word_cubit_cubit.dart';
import 'package:client_app/helpers/myApplication.dart';
import 'package:client_app/presentation/screens/LogIn/LogIn.dart';
import 'package:client_app/presentation/screens/NewPassword/NewPassword.dart';
import 'package:client_app/presentation/widgets/MyFormTextField.dart';
import 'package:flutter/material.dart';

class ConfirmPasswordTextField extends StatelessWidget {
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
        TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            obscureText: NewPassWordCubit.get(context).isHiddenPass2,
            keyboardType: TextInputType.visiblePassword,
            controller: ConfirmpasswordText,
            validator: (value) {
              if (value!.isEmpty) {
                return "please enter your Password";
              } else if (value.length <= 5) {
                return "Password must be more than 5 fileds";
              } else if (value != ResetpasswordText.text) {
                return "Not matched Passwords";
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: "Confirm password",
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  )),
              focusedBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.white,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.white,
                ),
              ),
              // prefixIcon: myPrefix,
              suffixIcon: InkWell(
                child: NewPassWordCubit.get(context).securityIcon2,
                onTap: () {
                  NewPassWordCubit.get(context).showPassWord2();
                },
              ),
            )),
      ],
    );
  }
}
