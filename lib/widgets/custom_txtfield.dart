import 'package:flutter/material.dart';

class CustomTxtField extends StatefulWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? action;
  final FocusNode? focusNode;
  final Function(String)? onChanged;
  final Function()? onTap;
  final String label;
  bool isError;
  final String errorText;
  final double width;
  final int maxLines;
  final bool isPassword;
  final bool isEnabled;
  final bool isRequired;

  CustomTxtField({
    Key? key,
    required this.controller,
    this.keyboardType,
    this.action,
    this.focusNode,
    this.onChanged,
    this.onTap,
    required this.label,
    this.isError = false,
    this.errorText = '',
    this.width = double.infinity,
    this.maxLines = 1,
    this.isPassword = false,
    this.isEnabled = true,
    this.isRequired = false,
  }) : super(key: key);

  @override
  State<CustomTxtField> createState() => _CustomTxtFieldState();
}

bool passwordHidden = true;

class _CustomTxtFieldState extends State<CustomTxtField> {
  @override
  Widget build(BuildContext context) {
    if (widget.errorText.isNotEmpty) {
      setState(() {
        widget.isError = true;
      });
    }
    return SizedBox(
      width: widget.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            focusNode: widget.focusNode,
            onChanged: widget.onChanged,
            onTap: widget.onTap,
            maxLines: widget.maxLines,
            obscureText: widget.isPassword && passwordHidden,
            decoration: InputDecoration(
              enabled: widget.isEnabled,
              labelText: widget.isRequired ? "${widget.label}*" : widget.label,
              labelStyle: TextStyle(
                color: widget.isError
                    ? const Color.fromRGBO(230, 57, 70, .6)
                    : Colors.black,
              ),
              alignLabelWithHint: true,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              // label:const Text('ghjk') ,
              floatingLabelStyle: TextStyle(
                  color: widget.isError
                      ? const Color.fromRGBO(230, 57, 70, 1)
                      : const Color(0xffE8E8E8),
                  fontWeight: FontWeight.w400),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffE8E8E8), width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: widget.isError
                      ? const Color.fromRGBO(230, 57, 70, 1)
                      : const Color(0xffE8E8E8),
                  width: 1.0,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(5)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: widget.isError
                      ? const Color.fromRGBO(230, 57, 70, 1)
                      : const Color(0xffE8E8E8),
                  width: 2.0,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(5)),
              ),
              suffixIcon: widget.isPassword
                  ? IconButton(
                      padding: const EdgeInsets.only(right: 8),
                      icon: Icon(
                        passwordHidden
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: const Color.fromRGBO(0, 38, 53, 1),
                      ),
                      onPressed: () {
                        setState(() {
                          passwordHidden = !passwordHidden;
                        });
                      },
                    )
                  : null,
            ),
          ),
          if (widget.errorText.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text(
                widget.errorText,
                textAlign: TextAlign.right,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color.fromRGBO(230, 57, 70, 1),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
