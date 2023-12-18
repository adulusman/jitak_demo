import 'package:flutter/material.dart';

void customSnackbar(
  BuildContext context,
  String message, {
  String title = '',
  bool showLoading = false,
  bool isSuccess = false,
  bool isError = false,
  bool isWarning = false,
}) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        backgroundColor: isSuccess
            ? Colors.green
            : isError
                ? Colors.red
                : isWarning
                    ? Colors.amber
                    : const Color(0xffFFC8AB),
        duration: showLoading
            ? const Duration(minutes: 30)
            : const Duration(seconds: 4),
        behavior: SnackBarBehavior.floating,
        width: MediaQuery.of(context).size.width * 0.8,
        showCloseIcon: true,
        closeIconColor: Colors.white,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        content: Row(
          children: [
            if (showLoading)
              const Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: CircularProgressIndicator(),
              ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title != '')
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                Text(
                  message,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 18),
                ),
              ],
            ),
          ],
        ),
      ),
    );
}
