import 'package:flutter/material.dart';

class CustomKeyboard extends StatefulWidget {
  const CustomKeyboard({super.key});

  @override
  State<CustomKeyboard> createState() => _CustomKeyboardState();
}

class _CustomKeyboardState extends State<CustomKeyboard> {
  late final FocusNode _focusNode;
  final inputController = TextEditingController();
  double heightKeyboard = 0;
  bool activeEmojiGird = false;

  @override
  void initState() {
    // _focusNode = FocusNode()
    //   ..addListener(() {
    //     if (_focusNode.hasFocus) activeEmojiGird = false;
    //   });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    return SafeArea(
      bottom: true,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('Custom Keyboard'),
        ),
        body: GestureDetector(
          onTap: () {
            // setState(() {
            //   _focusNode.unfocus();
            //   activeEmojiGird = false;
            // });
          },
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height,
              ),
              Positioned(
                width: MediaQuery.of(context).size.width,
                bottom: 0,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(4)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: TextField(
                              textAlign: TextAlign.left,
                              controller: inputController,
                              cursorColor: Colors.black,
                              onChanged: (value) {},
                              style: const TextStyle(
                                color: Colors
                                    .black, // Set text color conditionally
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                              ),
                              decoration: InputDecoration(
                                counterText: '',
                                hintText: 'Chat',
                                labelStyle:
                                    const TextStyle(color: Colors.black),
                                filled: true,
                                isDense: true,
                                fillColor: Colors.white,
                                hintStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                                contentPadding: const EdgeInsets.only(
                                    left: 14.0,
                                    bottom: 14.0,
                                    top: 14.0,
                                    right: 14),
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Icon(
                                Icons.emoji_emotions,
                                color: Colors.yellow,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.fastOutSlowIn,
                      color: Colors.green,
                      height: keyboardHeight,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
