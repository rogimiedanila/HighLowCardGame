import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:highlowcardgame_pec01act7/winnerstate.dart';
import 'gameoverstate.dart';
import 'home.dart';
import 'statelesswidget.dart';
import 'suits.dart';

class MobileLandscape extends StatefulWidget {
  const MobileLandscape({Key? key}) : super(key: key);

  @override
  State<MobileLandscape> createState() => _MobileLandscapeState();
}

class _MobileLandscapeState extends State<MobileLandscape> {
  final ScrollController controller = ScrollController();
  int xy = 0;
  int get imagePath => deckList[xy].keys;
  late FlipCardController _controller;
  int xy1 = 1;
  int get imagpath => deckList[xy1].keys;
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _controller = FlipCardController();
  }

  bool button1 = true, button2 = true, button3 = false;

  void button1Condition() {
    button1 = false;
    button2 = false;
    button3 = true;
  }

  void button2Condition() {
    button1 = false;
    button2 = false;
    button3 = true;
  }

  void button3Condition() {
    button1 = true;
    button2 = true;
    button3 = false;
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: Colors.transparent,
              height: MediaQuery.of(context).size.height,
              width: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Text(
                    'Choose H or L',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.pink,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Padding(padding: EdgeInsets.all(5)),
                  const Text(
                    'Deck Cards',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.pink,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Padding(padding: EdgeInsets.all(5)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          color: Colors.white,
                          height: 220,
                          width: 180,
                          child: FlipcardMobileLandscape(
                            imagpath:
                                'assets/images/${deckList[xy].imgpath}.png',
                            key: ValueKey<int>(imagpath),
                          ),
                        ),
                      ),
                      const Padding(padding: EdgeInsets.all(5)),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          color: Colors.white,
                          height: 220,
                          width: 180,
                          child: FlipCard(
                            speed: 500,
                            controller: _controller,
                            flipOnTouch: false,
                            front: Image.asset(
                              'assets/images/backcard.png',
                              fit: BoxFit.fill,
                            ),
                            back: FlipCardDetailsLandscape(
                              imagePath:
                                  'assets/images/${deckList[xy1].imgpath}.png',
                              key: ValueKey<int>(imagePath),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.pink[200],
              height: MediaQuery.of(context).size.height,
              width: 83,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Opacity(
                    opacity: button1 ? 1.0 : 0.2,
                    child: TextButton(
                      onPressed: () {
                        if (button1) {
                          button1Condition();
                          setState(() {
                            _controller.state?.controller?.forward();
                            if (deckList[xy1].number >= deckList[xy].number) {
                              _counter++;
                              if (_counter <= 5) {
                                store.add(deckList[xy1].imgpath);
                              }
                            } else {
                              _counter = 0;
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const GameOver()));
                              worldShuffle();
                              store = [];
                            }
                          });
                        }
                      },
                      child: const Text(
                        'H',
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
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
                            if (deckList[xy1].number < deckList[xy].number) {
                              _counter++;
                              if (_counter <= 5) {
                                store.add(deckList[xy1].imgpath);
                              }
                            } else {
                              _counter = 0;
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const GameOver()));
                              worldShuffle();
                              store = [];
                            }
                          });
                        }
                      },
                      child: const Text(
                        'L',
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
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
                                      builder: (context) => const Winner()));
                              worldShuffle();
                              store = [];
                            }
                          });
                        }
                      },
                      child: const Text(
                        'P',
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.transparent,
              height: MediaQuery.of(context).size.height,
              width: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('5 Correct Guessed Cards'),
                            content: SingleChildScrollView(
                              child: Column(children: [
                                SizedBox(
                                  height: 170,
                                  width: 450,
                                  child: ListView.builder(
                                      itemCount: store.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return SizedBox(
                                          height: 170,
                                          width: 130,
                                          child: Center(
                                            child: Image.asset(
                                              'assets/images/${store[index]}.png',
                                            ),
                                          ),
                                        );
                                      }),
                                )
                              ]),
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      });
                    },
                    child: const Text(
                      'Show 5 Cards',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.pink,
                      ),
                    ),
                  ),
                  Text(
                    'Points: $_counter',
                    style: const TextStyle(
                      fontSize: 30,
                      color: Colors.pink,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        worldShuffle();
                        store = [];
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
            ),
          ],
        ),
      ),
    );
  }
}
