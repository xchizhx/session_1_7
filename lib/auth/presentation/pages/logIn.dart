import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../common/controllers/passwordController.dart';
import '../../../common/widgets/customTextField.dart';
import 'forgorPasswordPage.dart';
import 'holder.dart';

class LogIn extends StatefulWidget{
  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

  var email = TextEditingController();
  var password = PasswordEditingController();
  bool rememberPassword = false;

  onChange(_){

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

            SizedBox(height: 18,),
        Row(
          children: [
            SizedBox.square(
              dimension: 22,
              child: Transform.scale(
                scale: 1.2,
                child: Checkbox(
                  side: BorderSide(
                    width: 1,
                    color: Color.fromARGB(255, 129, 129, 129)
                  ),
                  value: rememberPassword,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)
                  ),
                  onChanged: (newValue) {
                    setState(() {
                      rememberPassword = newValue!;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
                child: Text(
                    "Запомнить меня",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Color.fromARGB(255, 129, 129, 129))
                    )
                ),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => ForgotPasswordPage())
                );
              },
              child: Text(
                  "Забыли пароль?",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Color.fromARGB(255, 106, 129, 249)
                  )
              ),
            )
          ]),
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
                          child: Text("Войти")),
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
                                TextSpan(text: "У меня нет аккаунта! ",
                                    style: Theme.of(context).textTheme.titleMedium),
                                TextSpan(text: "Создать",
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