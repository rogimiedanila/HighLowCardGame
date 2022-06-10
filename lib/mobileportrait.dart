import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'gameoverstate.dart';
import 'home.dart';
import 'statelesswidget.dart';
import 'suits.dart';
import 'winnerstate.dart';

//Mobile Mode/Portrait Layout
class MobilePortrait extends StatefulWidget {
  const MobilePortrait({
    Key? key,
  }) : super(key: key);

  @override
  State<MobilePortrait> createState() => _MobileModePortraitState();
}

class _MobileModePortraitState extends State<MobilePortrait> {
  final ScrollController controller = ScrollController();
  int xy = 0;
  int get imagePath => deckList[xy].keys;
  late FlipCardController _controller;
  int xy1 = 1;
  int get imagpath => deckList[xy1].keys;
  int _counter = 0;

  void button1Condition() async {
    setState(() {
      button1 = false;
      button2 = false;
      button3 = true;
    });
  }

  void button2Condition() async {
    setState(() {
      button1 = false;
      button2 = false;
      button3 = true;
    });
  }

  void button3Condition() async {
    setState(() {
      button1 = true;
      button2 = true;
      button3 = false;
    });
  }

  bool button1 = true;
  bool button2 = true;
  bool button3 = false;

  String hold1 = "cardframe",
      hold2 = "cardframe",
      hold3 = "cardframe",
      hold4 = "cardframe",
      hold5 = "cardframe";

  void pushCard() {
    hold5 = hold4;
    hold4 = hold3;
    hold3 = hold2;
    hold2 = hold1;
    hold1 = deckList[xy1].imgpath;
  }

  @override
  void initState() {
    super.initState();
    _controller = FlipCardController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/backgroundplay.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              flex: 1,
              fit: FlexFit.loose,
              child: Column(
                children: [
                  const Padding(padding: EdgeInsets.only(top: 10)),
                  const Text(
                    'Deck Cards',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.pink,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                            color: Colors.white,
                            height: 160,
                            width: 115,
                            child: FlipcardMobile(
                              imagpath:
                                  'assets/images/${deckList[xy].imgpath}.png',
                              key: ValueKey<int>(imagpath),
                            ),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.all(15)),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                            color: Colors.white,
                            height: 160,
                            width: 115,
                            child: FlipCard(
                              speed: 500,
                              controller: _controller,
                              flipOnTouch: false,
                              front: Image.asset(
                                'assets/images/backcard.png',
                                fit: BoxFit.fill,
                              ),
                              back: FlipCardDetails(
                                imagePath:
                                    'assets/images/${deckList[xy1].imgpath}.png',
                                key: ValueKey<int>(imagePath),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 10)),
                  const Text(
                    'Choose Buttons:',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.pink,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Padding(padding: EdgeInsets.all(5)),
                  Expanded(
                    flex: 0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        color: Colors.pink[200],
                        height: 60,
                        width: 300,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Opacity(
                              opacity: button1 ? 1.0 : 0.2,
                              child: TextButton(
                                onPressed: () {
                                  if (button1) {
                                    button1Condition();
                                    setState(() {
                                      _controller.state?.controller?.forward();
                                      if (deckList[xy1].number >=
                                          deckList[xy].number) {
                                        _counter++;
                                        if (_counter <= 5) {
                                          pushCard();
                                        }
                                      } else {
                                        _counter = 0;
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const GameOver()));
                                        worldShuffle();
                                        store = [];
                                      }
                                    });
                                  }
                                },
                                child: const Text(
                                  "Higher",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                            ),
                            Opacity(
                              opacity: button2 ? 1.0 : 0.2,
                              child: TextButton(
                                onPressed: () {
                                  if (button2) {
                                    button2Condition();
                                    setState(() {
                                      _controller.state?.controller?.forward();
                                      if (deckList[xy1].number <
                                          deckList[xy].number) {
                                        _counter++;
                                        if (_counter <= 5) {
                                          //store.add(deckList[xy1].imgpath);
                                          pushCard();
                                        }
                                      } else {
                                        _counter = 0;
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const GameOver()));
                                        worldShuffle();
                                        store = [];
                                      }
                                    });
                                  }
                                },
                                child: const Text(
                                  "Lower",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ),
                            Opacity(
                              opacity: button3 ? 1.0 : 0.2,
                              child: TextButton(
                                onPressed: () {
                                  if (button3) {
                                    button3Condition();
                                    setState(() {
                                      xy++;
                                      xy1++;
                                      _controller.state?.controller?.reset();
                                      if ((_counter == 52)) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Winner()));
                                        worldShuffle();
                                        store = [];
                                      }
                                    });
                                  }
                                },
                                child: const Text(
                                  "Proceed",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 10)),
                  const Text(
                    '5 Correct Guessed Cards',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.pink,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Padding(padding: EdgeInsets.only(top: 15)),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                            color: Colors.transparent,
                            height: 124,
                            width: 70,
                            child: Image.asset(
                              'assets/images/$hold1.png',
                              height: 124,
                              width: 70,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.all(2)),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                            color: Colors.transparent,
                            height: 124,
                            width: 70,
                            child: Image.asset(
                              'assets/images/$hold2.png',
                              height: 124,
                              width: 70,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.all(2)),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                            color: Colors.transparent,
                            height: 124,
                            width: 70,
                            child: Image.asset(
                              'assets/images/$hold3.png',
                              height: 124,
                              width: 70,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.all(2)),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                            color: Colors.transparent,
                            height: 124,
                            width: 70,
                            child: Image.asset(
                              'assets/images/$hold4.png',
                              height: 124,
                              width: 70,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.all(2)),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                            color: Colors.transparent,
                            height: 124,
                            width: 70,
                            child: Image.asset(
                              'assets/images/$hold5.png',
                              height: 124,
                              width: 70,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 15)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Padding(padding: EdgeInsets.only(top: 5)),
                          Text(
                            'Points: $_counter',
                            style: const TextStyle(
                              fontSize: 30,
                              color: Colors.pink,
                            ),
                          ),
                          const Padding(padding: EdgeInsets.only(top: 5)),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                worldShuffle();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const HomePage(
                                              title: 'High Low Card Game',
                                            )));
                              });
                            },
                            child: const Text(
                              'Exit',
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.pink,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
