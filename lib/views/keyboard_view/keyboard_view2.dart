import 'package:flutter/material.dart';
import 'package:media_reels/core/log/log.dart';

class KeyboardView2 extends StatefulWidget {
  const KeyboardView2({super.key});

  @override
  State<KeyboardView2> createState() => _KeyboardView2State();
}

class _KeyboardView2State extends State<KeyboardView2> {
  late final FocusNode _focusNode;
  double storeKeyboard = 260.0;
  bool activeEmojiGird = false;

  @override
  void initState() {
    _focusNode = FocusNode()
      ..addListener(() {
        if (_focusNode.hasFocus) activeEmojiGird = false;
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // this is your emulate height.use this height instead of storeKeyboard.
    //you may have a better experience
    final double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    Log.error(keyboardHeight);
    return GestureDetector(
      onTap: () {
        setState(() {
          _focusNode.unfocus();
          activeEmojiGird = false;
        });
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: <Widget>[
            AnimatedPositioned(
              bottom:
                  _focusNode.hasFocus || activeEmojiGird ? storeKeyboard : 10,
              duration: const Duration(milliseconds: 100),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          if (!activeEmojiGird) _focusNode.unfocus();
                          activeEmojiGird = !activeEmojiGird;
                        });
                      },
                      icon: const Icon(Icons.emoji_emotions_rounded)),
                  SizedBox(
                    width: 300,
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: 'Input something',
                      ),
                      focusNode: _focusNode,
                    ),
                  ),
                ],
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 100),
              bottom: activeEmojiGird || _focusNode.hasFocus
                  ? 0
                  : storeKeyboard * -1,
              child: SizedBox(
                  height: storeKeyboard, width: 300, child: buildEmojiGird()),
            )
          ],
        ),
      ),
    );
  }

  Widget buildEmojiGird() {
    return Container(
      alignment: Alignment.center,
      color: Colors.red,
      child: const Text("this is emoji"),
    );
  }
}
