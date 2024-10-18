import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;

import 'package:media_reels/core/log/log.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage>
    with SingleTickerProviderStateMixin {
  static const platform = MethodChannel('actionSong');

  List<double> sectors = [100, 20, 0.15, 0.5, 50, 20, 100, 50, 20, 50];
  int randomSectorIndex = -1;
  List<double> sectorRadians = [];
  double angle = 0;

  // other data
  bool spinning = false;
  double earnedValue = 0;
  double totalEarnings = 0;
  int spins = 0;

  math.Random random = math.Random();

  // spin animation controller
  late AnimationController controller;
  // Animation
  late Animation<double> animation;

  // init
  @override
  void initState() {
    super.initState();
    // generate sector radians/ fill the list
    generateSectorRadians();

    // animation controller
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 3600) // 3.6 sec
        );

    // the tween
    Tween<double> tween = Tween<double>(begin: 0, end: 1);

    // the curve behavior
    CurvedAnimation curve =
        CurvedAnimation(parent: controller, curve: Curves.decelerate);

    // animation
    animation = tween.animate(curve);

    // rebuild the screen as the animation continues
    controller.addListener(() {
      // only when animation completes
      if (controller.isCompleted) {
        // rebuild
        setState(() {
          // record stats
          recordStats();
          // update status bool
          spinning = false;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  // used to record game statistics
  void recordStats() {
    earnedValue = sectors[
        sectors.length - (randomSectorIndex + 1)]; // current earned value
    totalEarnings = totalEarnings + earnedValue; // total earnings
    spins = spins + 1; // all numbers of spin to far
  }

  void generateSectorRadians() {
    // radian for 1 sector
    double sectorRadian = 2 * math.pi / sectors.length;

    // make it some how large
    for (int i = 0; i < sectors.length; i++) {
      // make it greater as much you can
      sectorRadians.add((i + 1) * sectorRadian);
    }
  }

  void spin() {
    // spinning here
    // get any random sector index
    randomSectorIndex = random.nextInt(sectors.length); // bound exclusive
    // generate a random radian to spin to the wheel
    double randomRadian = generateRandomRadianToSpinTo();
    controller.reset(); // reset any prev. values
    angle = randomRadian;
    controller.forward();
  }

  double generateRandomRadianToSpinTo() {
    // make it higher as much as you can
    return (2 * math.pi * sectors.length) + sectorRadians[randomSectorIndex];
  }

  void resetGame() {
    spinning = false;
    angle = 0;
    earnedValue = 0;
    totalEarnings = 0;
    spins = 0;
    controller.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _body(),
    );
  }

  Widget _body() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg.jpg'), fit: BoxFit.cover)),
      child: _gameContent(),
    );
  }

  // game content method
  Widget _gameContent() {
    return Stack(
      children: [_gameTitle(), _gameWheel(), _gameActions(), _gameStats()],
    );
  }

  // game title
  Widget _gameTitle() {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: const EdgeInsets.only(top: 70),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            border: Border.all(color: CupertinoColors.systemYellow, width: 2),
            gradient: const LinearGradient(
                colors: [Color(0XFF2d014c), Color(0XFFf8009e)],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight)),
        child: const Text('Fortune Wheel'),
      ),
    );
  }

  // game Wheel
  Widget _gameWheel() {
    return Center(
      child: Container(
        padding: const EdgeInsets.only(top: 20, left: 5),
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.5,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/belt.png'),
                fit: BoxFit.contain)),
        child: InkWell(
          child: AnimatedBuilder(
              animation: animation,
              builder: (context, child) {
                return Transform.rotate(
                  angle: controller.value * angle,
                  child: Container(
                    margin: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.07),
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.contain,
                            image: AssetImage('assets/images/wheel.png'))),
                  ),
                );
              }),
          onTap: () {
            setState(() {
              if (!spinning) {
                spin();
              }
            });
          },
        ),
      ),
    );
  }

  // game statistics
  Widget _gameStats() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            border: Border.all(color: CupertinoColors.systemYellow, width: 2),
            gradient: const LinearGradient(
                colors: [Color(0XFF2d014c), Color(0XFFf8009e)],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight)),
        child: Table(
          border: TableBorder.all(color: CupertinoColors.systemYellow),
          children: [
            TableRow(children: [
              _titleColumn('Earned'),
              _titleColumn('Earnings'),
              _titleColumn('Spins'),
            ]),
            TableRow(children: [
              _valueColumn(earnedValue),
              _valueColumn(totalEarnings),
              _valueColumn(spins),
            ]),
          ],
        ),
      ),
    );
  }

  Column _titleColumn(String title) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text(title),
        ),
      ],
    );
  }

  Column _valueColumn(var val) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text('$val'),
        ),
      ],
    );
  }

  Widget _gameActions() {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height * 0.17,
            left: 20,
            right: 10),
        child: Row(
          children: [
            InkWell(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                    border: Border.all(color: CupertinoColors.systemYellow)),
                child: IconButton(
                    onPressed: () {
                      Log.error('Ready to withdraw \$ $totalEarnings ?');
                    },
                    icon: const Icon(Icons.arrow_circle_down)),
              ),
            ),
            InkWell(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                    border: Border.all(color: CupertinoColors.systemYellow)),
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                child: Text(spinning ? 'Spining' : 'spin'),
              ),
              onTap: () {
                platform.invokeMethod('playSong');
                setState(() {
                  if (!spinning) {
                    spin();
                    spinning = true;
                  }
                });
              },
            ),
            InkWell(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                    border: Border.all(color: CupertinoColors.systemYellow)),
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                child: const Text('Reset'),
              ),
              onTap: () {
                platform.invokeMethod('pauseSong');
                if (spinning) return;
                setState(() {
                  resetGame();
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
