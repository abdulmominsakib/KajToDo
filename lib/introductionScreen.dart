import 'package:flutter/material.dart';

import 'package:introduction_screen/introduction_screen.dart';
import 'package:kajtodo/styling/style.dart';

class Intro extends StatefulWidget {
  const Intro({Key key}) : super(key: key);

  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    final pageDecoration = PageDecoration(
      contentPadding: EdgeInsets.only(top: 50, bottom: 50),
    );

    List<String> featureList = ['Track Your Task'];

    TextEditingController nameInputController = TextEditingController();

    List<PageViewModel> introPagesView = [
      PageViewModel(
        title: 'Welcome To KajToDo',
        body: 'Let\'s do something productive today',
        image: Center(child: Image.asset('assets/intro-image-1.png')),
        footer: Center(child: Text('Do your Task more efficiently')),
        decoration: pageDecoration,
      ),
      PageViewModel(
        title: '',
        image: Center(child: Image.asset('assets/intro-image-2.png')),
        bodyWidget:
            Text(''' -Track Your Task \n  -Check Your Task \n -Do your Task'''),
        footer: Text('Manage Your Task More easily'),
        // body: 'Track your Task',
      ),
      PageViewModel(
        title: '',
        image: Image.asset('assets/intro-image-3.png'),
        bodyWidget: DefaultInput(
          hintText: 'Add your name',
          counterText: '',
          controller: nameInputController,
        ),
        footer: Text('So that we can call you by your name'),
        // body: 'Track your Task',
      ),
    ];
    return Scaffold(
        body: SafeArea(
      child: IntroductionScreen(
        globalBackgroundColor: Colors.white,
        pages: introPagesView,
        done: Text('Done'),
        onDone: () {},
      ),
    ));
  }
}
