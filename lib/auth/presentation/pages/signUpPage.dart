import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ses_sion_1_7/auth/presentation/pages/holder.dart';
import 'package:ses_sion_1_7/auth/presentation/pages/logIn.dart';
import 'package:ses_sion_1_7/common/controllers/passwordController.dart';
import 'package:ses_sion_1_7/common/widgets/customTextField.dart';

class SignUpPage extends StatefulWidget{
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  var email = TextEditingController();
  var password = PasswordEditingController();
  var confirmPassword = TextEditingController();

  void onChange(_){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 78,),
            Text("Создать аккаунт",
            style: Theme.of(context).textTheme.titleLarge,),
            SizedBox(height: 8,),
            Text("Завершите регистрацию чтобы начать",
            style: Theme.of(context).textTheme.titleMedium,),
            CustomTextField(
                label: "Почта",
                hint: "***********@mail.com",
                controller: email,
                onChange: onChange),
            CustomTextField(
                label: "Пароль",
                hint: "**********",
                controller: password,
                onChange: onChange),
            CustomTextField(
                label: "Повторите пароль",
                hint: "**********",
                controller: confirmPassword,
                onChange: onChange),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                          onPressed: (){
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (_) => Holder()));
                          },
                          child: Text("Зарегестрироваться")),
                    ),
                    SizedBox(height: 14,),
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => LogIn()));
                      },
                      child: RichText(
                          text: TextSpan(
                        children: [
                          TextSpan(text: "У меня уже есть аккаунт! ",
                            style: Theme.of(context).textTheme.titleMedium),
                          TextSpan(text: "Войти",
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Color.fromARGB(255, 106, 139, 249)
                          ))
                        ])
                      ),

                    ),
                    SizedBox(height: 32,)
                  ],
            ))
          ],
        ),
      ),
    );
  }
}