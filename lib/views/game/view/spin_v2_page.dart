import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:media_reels/core/log/log.dart';
import 'package:media_reels/views/game/components/my_spin_controller.dart';
import 'package:media_reels/views/game/components/spin_view.dart';

class SpinV2Page extends StatefulWidget {
  const SpinV2Page({
    super.key,
  });

  @override
  State<SpinV2Page> createState() => _SpinV2PageState();
}

class _SpinV2PageState extends State<SpinV2Page> {
  StreamController<int> selected = StreamController<int>();

  @override
  void dispose() {
    selected.close();
    super.dispose();
  }

  MySpinController mySpinController = MySpinController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(color: Color(0xff0C1B3A)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinView(
              mySpinController: mySpinController,
              wheelSize: MediaQuery.sizeOf(context).width * 0.8,
              itemList: [
                SpinItem(
                    label: '0% Sale',
                    labelStyle: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    color: Colors.black),
                SpinItem(
                    label: '5% Sale',
                    labelStyle: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    color: const Color(0xff9e00ff)),
                SpinItem(
                    label: '10% Sale',
                    labelStyle: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    color: const Color(0xff00a0ff)),
                SpinItem(
                    label: '15% Sale',
                    labelStyle: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    color: const Color(0xffffe000)),
                SpinItem(
                    label: '20% Sale',
                    labelStyle: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    color: Colors.white),
                SpinItem(
                    label: '25% Sale',
                    labelStyle: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    color: const Color(0xffde0000)),
                SpinItem(
                    label: '30% Sale',
                    labelStyle: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    color: const Color(0xff41d849)),
                SpinItem(
                    label: '35% Sale',
                    labelStyle: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    color: const Color(0xffff9c00)),
                // SpinItem(label: 'Eggplant', color: Colors.redAccent),
                // SpinItem(label: 'Flower', color: Colors.lightBlueAccent),
              ],
              onFinished: (dynamic p0) {
                Log.info(p0);
              },
            ),
            //circleOverlay(size: Get.width * 0.6,data: ['Apple','Banana','Cucumber','Durian']),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  int rdm = Random().nextInt(6);
                  await mySpinController.spinNow(
                      luckyIndex: rdm + 1, totalSpin: 10, baseSpinDuration: 20);
                },
                child: const Text('Spin Now')),
          ],
        ),
      ),
    );
  }
}
