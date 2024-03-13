import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget{
  final String label;
  final String hint;
  final bool enavleObscure;
  final TextEditingController controller;
  final Function(String)? onChange;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    this.enavleObscure = false, 
    required this.controller,
    this.onChange});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscure = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 24,),
        Text(widget.label,
        style: Theme.of(context).textTheme.titleLarge,),
        SizedBox(height: 8,),
        TextField(
          controller: widget.controller,
          onChanged: widget.onChange,
          decoration: InputDecoration(

            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(
                color: Color.fromARGB(255, 129, 129, 129)
              )
            ),
            suffixIcon: (widget.enavleObscure) ?
                GestureDetector(
                  onTap: (){
                    isObscure = !isObscure;
                  },
                  child: Image.asset("assets/img_2.png"),
                ) : null
          ),
        )
      ],
    );
  }
}