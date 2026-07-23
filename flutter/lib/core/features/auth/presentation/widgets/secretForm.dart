import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurserylink/core/constant/constant.dart';

class SecretForm extends StatefulWidget {
  final String title;
  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final TextInputAction textInputAction;
  const SecretForm({
    super.key,
    required this.title,
    required this.controller,
    required this.hint,
    required this.icon, 
    required this.textInputAction,
  });

  @override
  State<SecretForm> createState() => _SecretFormState();
}

class _SecretFormState extends State<SecretForm> {
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
              prefixIcon: Icon(Icons.lock, color: Colors.grey),
              suffixIcon: Icon(widget.icon, color: Colors.grey),
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
            textInputAction: widget.textInputAction,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
