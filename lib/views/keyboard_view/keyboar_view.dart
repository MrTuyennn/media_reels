import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class KeyboarView extends StatefulWidget {
  const KeyboarView({super.key});

  @override
  State<KeyboarView> createState() => _KeyboarViewState();
}

class _KeyboarViewState extends State<KeyboarView> {
  final TextEditingController _textEditingController = TextEditingController();
  final StreamController<void> _gridBuilderController =
      StreamController<void>.broadcast();

  final FocusNode _focusNode = FocusNode();
  double _keyboardHeight = 0;
  double _preKeyboardHeight = 0;

  bool get showCustomKeyBoard => activeEmojiGird;
  bool activeEmojiGird = false;
  List<String> sessions = <String>[
    '[44] @Dota2 CN dota best dota',
    'yes, you are right [36].',
    '大家好，我是拉面，很萌很新 [12].',
    '\$Flutter\$. CN dev best dev',
    '\$Dota2 Ti9\$. Shanghai,I\'m coming.',
    'error 0 [45] warning 0',
  ];
  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    final bool showingKeyboard = keyboardHeight > _preKeyboardHeight;
    _preKeyboardHeight = keyboardHeight;
    if ((keyboardHeight > 0 && keyboardHeight >= _keyboardHeight) ||
        showingKeyboard) {
      activeEmojiGird = false;
      _gridBuilderController.add(null);
    }
    _keyboardHeight = max(_keyboardHeight, keyboardHeight);
    return SafeArea(
      bottom: true,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: <Widget>[
            // message
            Expanded(
                child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                List<Widget> list = <Widget>[];
                return Row(
                  children: list,
                );
              },
              padding: const EdgeInsets.only(bottom: 10.0),
              reverse: true,
              itemCount: sessions.length,
            )),
            Container(
              height: 2.0,
              color: Colors.blue,
            ),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Input something',
              ),
              strutStyle: const StrutStyle(),
              controller: _textEditingController,
              focusNode: _focusNode,
            ),
            StreamBuilder<void>(
              stream: _gridBuilderController.stream,
              builder: (BuildContext b, AsyncSnapshot<void> d) {
                return Container(
                  color: Colors.grey.withOpacity(0.3),
                  child: Column(
                    children: <Widget>[
                      IconButton(
                          onPressed: () {
                            onToolbarButtonActiveChanged(keyboardHeight, () {
                              activeEmojiGird = !activeEmojiGird;
                            });
                          },
                          icon: const Icon(Icons.emoji_emotions)),
                      Container(
                        width: 20.0,
                      ),
                      Container(),
                    ],
                  ),
                );
              },
            ),
            Container(
              height: 2.0,
              color: Colors.blue,
            ),
            StreamBuilder<void>(
              stream: _gridBuilderController.stream,
              builder: (BuildContext b, AsyncSnapshot<void> d) {
                return SizedBox(
                    height: showCustomKeyBoard
                        ? _keyboardHeight -
                            (Platform.isIOS ? mediaQueryData.padding.bottom : 0)
                        : 0,
                    child: buildCustomKeyBoard());
              },
            ),
            StreamBuilder<void>(
              stream: _gridBuilderController.stream,
              builder: (BuildContext b, AsyncSnapshot<void> d) {
                return Container(
                  height: showCustomKeyBoard ? 0 : keyboardHeight,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void onToolbarButtonActiveChanged(double keyboardHeight, Function activeOne) {
    if (keyboardHeight > 0) {
      _keyboardHeight = keyboardHeight;
      SystemChannels.textInput.invokeMethod<void>('TextInput.hide');
    }
    activeOne();
    _gridBuilderController.add(null);
  }

  Widget buildCustomKeyBoard() {
    if (!showCustomKeyBoard) {
      return Container();
    }
    if (activeEmojiGird) {
      return buildEmojiGird();
    }
    return Container();
  }

  Widget buildEmojiGird() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 8, crossAxisSpacing: 10.0, mainAxisSpacing: 10.0),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          child: const Text("emoji"),
        );
      },
      itemCount: 20,
      padding: const EdgeInsets.all(5.0),
    );
  }
}
