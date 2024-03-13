import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../common/controllers/passwordController.dart';
import '../../../common/widgets/customTextField.dart';
import 'holder.dart';

class ForgotPasswordPage extends StatefulWidget{
  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {

  var email = TextEditingController();
  var password = PasswordEditingController();

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
            Text("Восстановление пароля",
              style: Theme.of(context).textTheme.titleLarge,),
            SizedBox(height: 8,),
            Text("Введите свою почту",
              style: Theme.of(context).textTheme.titleMedium,),
            CustomTextField(
                label: "Почта",
                hint: "***********@mail.com",
                controller: email,
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
                          child: Text("Отправить код")),
                    ),
                    SizedBox(height: 14,),
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => ForgotPasswordPage()));
                      },
                      child: RichText(
                          text: TextSpan(
                              children: [
                                TextSpan(text: "Я вспомнил свой пароль! ",
                                    style: Theme.of(context).textTheme.titleMedium),
                                TextSpan(text: "Вернуться",
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