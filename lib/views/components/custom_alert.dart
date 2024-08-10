import 'package:flutter/material.dart';
import 'package:music_app/constants/app_info.dart';
import 'package:music_app/constants/style.dart';

enum MessageType { common, error }

class CustomAlert extends StatelessWidget {
  const CustomAlert(
      {super.key,
      this.title = 'Title',
      this.message = 'No message',
      this.onPressed,
      this.messageType = MessageType.common});
  final String title;
  final MessageType messageType;
  final String message;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: messageType == MessageType.common
          ? const Color.fromRGBO(23, 159, 97, 1)
          : const Color.fromRGBO(236, 80, 34, 1),
      title: SizedBox(
        width: getWidth(context),
        child: Column(
          children: [
            Text(
              title,
              style: textBoldStyle.merge(const TextStyle(fontSize: 24)),
              textAlign: TextAlign.center,
            ),
            const Divider(
              thickness: 1,
              color: Colors.white,
            )
          ],
        ),
      ),
      content: Text(
        message,
        style: textStyle.merge(const TextStyle(fontSize: 18)),
      ),
      actions: [
        Container(
          alignment: Alignment.center,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(23, 159, 97, 0.5)),
              onPressed: () {
                if (onPressed != null) {
                  onPressed!();
                }

                Navigator.pop(context);
              },
              child: SizedBox(
                width: 100,
                child: Text(
                  'OK',
                  style: textBoldStyle.merge(const TextStyle(fontSize: 20)),
                  textAlign: TextAlign.center,
                ),
              )),
        )
      ],
    );
  }
}
