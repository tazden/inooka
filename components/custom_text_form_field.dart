import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final String? title;
  final String? hint;
  final Widget? textFormIcon;
  final double? width;
  final TextEditingController? textEditingController;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChange;

  final ValueChanged<String>? onSubmit;
  final bool? readOnly;
  final bool? isObsecure;
  final TextInputType? type;
  final String? initialValue;
  final int? maxLength;

  final double? height;

  const CustomTextField(
      {Key? key,
      this.title,
      this.textFormIcon,
      this.width,
      this.hint,
      this.textEditingController,
      this.onTap,
      this.onChange,
      this.onSubmit,
      this.readOnly = false,
      this.isObsecure = false,
      this.type,
      this.initialValue,
      this.maxLength,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title ?? "",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.normal,
            fontSize: 16,
          ),
        ),
        Container(
          height: height ?? 40,
          width: width,
          child: TextFormField(
            maxLength: maxLength,
            initialValue: initialValue,
            keyboardType: type,
            onTap: onTap,
            readOnly: readOnly!,
            onChanged: onChange,
            onFieldSubmitted: onSubmit,
            obscureText: isObsecure ?? false,
            controller: textEditingController,
            style: TextStyle(fontSize: 18),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                top: 5,
                left: 16,
              ),
              suffixIcon: textFormIcon,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: BorderSide(),
              ),
              hintText: hint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: BorderSide(
                  width: 0.5,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
