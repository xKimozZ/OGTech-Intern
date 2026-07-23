import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurserylink/core/constant/constant.dart';

class CustomForm extends StatefulWidget {
  final String title;
  final TextEditingController controller;
  final String hint;
  final IconData icon;
  const CustomForm({
    super.key,
    required this.title,
    required this.controller,
    required this.hint,
    required this.icon,
  });

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: TextStyle(
              fontSize: AppFonts.small,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          TextFormField(
            controller: widget.controller,
            decoration: InputDecoration(
              prefixIcon: Icon(widget.icon, color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: const BorderSide(color: Colors.red),
              ),
              hintText: widget.hint,
            ),
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your ${widget.title.toLowerCase()}';
              }

              if (widget.title == 'Email' && !value.contains('@')) {
                return 'Please enter a valid email';
              }

              return null;
            },
          ),
        ],
      ),
    );
  }
}
