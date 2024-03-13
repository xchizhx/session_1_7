import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomTextField extends StatefulWidget{
  final String label;
  final String hint;
  final bool enableObscure;
  final TextEditingController controller;
  final Function(String)? onChange;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    this.enableObscure = false,
    required this.controller,
    this.onChange});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 24,),
        Text(widget.label,
        style: Theme.of(context).textTheme.titleMedium,),
        SizedBox(height: 8,),
        SizedBox(
          width: double.infinity,
          child: TextField(
            controller: widget.controller,
            onChanged: widget.onChange,
            obscuringCharacter: "*",
            obscureText: (widget.enableObscure) ? isObscure : false,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(
                  color: Color.fromARGB(255, 129, 129, 129)
                  )
                  ),
              hintText: widget.hint,
              hintStyle: Theme.of(context).textTheme.titleMedium,
              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 129, 129, 129)
                )
              ),
              suffixIcon: (widget.enableObscure) ?
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                    child: Image.asset("assets/eye-slash.png"),
                  ) : null
            ),
          ),
        )
      ],
    );
  }
}