
import 'package:flutter/material.dart';
import 'package:flutter_elite_toast/main.dart';

enum PositionedType { top, center, bottom }

class QmsToastStyle {
  static int delayedSeconds = 2;
  static int milliseconds = 200;

  ///计算文本尺寸
  static Size boundingTextSize(String text, TextStyle style,
      {int maxLines = 2 ^ 31, double maxWidth = double.infinity}) {
    if (text.isEmpty) {
      return Size.zero;
    }
    final TextPainter textPainter = TextPainter(
        textDirection: TextDirection.ltr,
        text: TextSpan(text: text, style: style),
        maxLines: maxLines)
      ..layout(maxWidth: maxWidth);
    return textPainter.size;
  }

  static Widget toast(String msg, String imageName, BuildContext context,
      PositionedType positionedType) {
    Positioned positioned =
        Positioned(top: 18, child: tostChild(msg, imageName, context));
    if (positionedType == PositionedType.top) {
      positioned =
          Positioned(top: 18, child: tostChild(msg, imageName, context));
    } else if (positionedType == PositionedType.center) {
      positioned = Positioned(
          top: MediaQuery.of(context).size.height / 2 - 100,
          child: tostChild(msg, imageName, context));
    } else if (positionedType == PositionedType.bottom) {
      positioned =
          Positioned(bottom: 18, child: tostChild(msg, imageName, context));
    }

    return ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Opacity(
            opacity: 0.2,
            child: Container(
              color: Colors.black,
            ),
          ),
          positioned
        ],
      ),
    );
  }

  static Widget tostChild(String msg, String imageName, BuildContext context) {
    Size size = boundingTextSize(
        msg, const TextStyle(fontSize: 14, color: Colors.black));
    double width = MediaQuery.of(context).size.width;
    if (size.width >= (width - 80)) {
      width = width - 40;
    } else {
      width = size.width + 80;
    }
    return Column(
      children: [
        Container(
          width: width,
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0), color: Colors.white),
          child: Row(
            children: [
              // Image.asset("images/$imageName.png"),
              const SizedBox(
                width: 12.0,
              ),
              Expanded(
                child: Text(
                  msg,
                  style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      decoration: TextDecoration.none),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  ///成功提示
  static void showSuccessToast({required String msg}) {
    Future.delayed(Duration(milliseconds: milliseconds), () {
      showDialog(
          context: globalKey.currentState!.context,
          builder: (BuildContext context) {
            Future.delayed(Duration(seconds: delayedSeconds), () {
              Navigator.of(context).pop();
            });
            return toast(
                msg, "", globalKey.currentState!.context, PositionedType.top);
          });
    });
  }

  ///普通警告
  static void showCommonWarningToast({required String msg}) {
    Future.delayed(Duration(milliseconds: milliseconds), () {
      showDialog(
          context: globalKey.currentState!.context,
          builder: (BuildContext context) {
            Future.delayed(Duration(seconds: delayedSeconds), () {
              Navigator.of(context).pop();
            });
            return toast(
                msg, "", globalKey.currentState!.context, PositionedType.top);
          });
    });
  }

  ///强烈警告
  static void showStrongWarningToast({required String msg}) {
    Future.delayed(Duration(milliseconds: milliseconds), () {
      showDialog(
          context: globalKey.currentState!.context,
          builder: (BuildContext context) {
            Future.delayed(Duration(seconds: delayedSeconds), () {
              Navigator.of(context).pop();
            });
            return toast(
                msg, "", globalKey.currentState!.context, PositionedType.top);
          });
    });
  }

  ///普通提示
  static void showGeneralTipsToast({required String msg}) {
    Future.delayed(Duration(milliseconds: milliseconds), () {
      showDialog(
          context: globalKey.currentState!.context,
          builder: (BuildContext context) {
            Future.delayed(Duration(seconds: delayedSeconds), () {
              Navigator.of(context).pop();
            });
            return toast(
                msg, "", globalKey.currentState!.context, PositionedType.top);
          });
    });
  }

  ///等待提示
  static void showWaitPromptToast({required String msg}) {
    Future.delayed(Duration(milliseconds: milliseconds), () {
      showDialog(
          context: globalKey.currentState!.context,
          builder: (BuildContext context) {
            Future.delayed(Duration(seconds: delayedSeconds), () {
              Navigator.of(context).pop();
            });
            return toast(
                msg, "", globalKey.currentState!.context, PositionedType.top);
          });
    });
  }
}
