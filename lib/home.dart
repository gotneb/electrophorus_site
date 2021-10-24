import 'package:electrophorus_site/constants.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'banner_team.dart';
import 'member_team.dart';

class Home extends StatelessWidget {
  final appBar = AppBar(
    backgroundColor: backColor,
    toolbarHeight: 50,
    title: Image.asset(
      'assets/logo_white.png',
      width: 90,
      height: 45,
    ),
  );
  static const classMates = <MemberTeam>[
    MemberTeam(
        name: 'Cárita',
        image: 'assets/carita.jpeg',
        degree: 'Engenharia Elétrica'),
    MemberTeam(
        name: 'Darlysson',
        image: 'assets/darlysson.png',
        degree: 'Engenharia da Computação'),
    MemberTeam(
        name: 'Gabriel',
        image: 'assets/gabriel.jpg',
        degree: 'Engenharia Elétrica'),
    MemberTeam(
        name: 'João',
        image: 'assets/joao.png',
        degree: 'Engenharia da Computação'),
  ];

  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height - appBar.toolbarHeight!;

    final buttonDownload = ElevatedButton(
      onPressed: () {},
      child: SizedBox(
        width: 140,
        height: 35,
        child: Row(
          children: const <Widget>[
            Text('Download', style: download),
            Spacer(),
            Icon(Icons.download),
          ],
        ),
      ),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(12),
        primary: azul,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      ),
    );

    final body = SizedBox(
      width: width,
      height: 0.95 * height,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            'assets/woman_fixing.jpg',
            fit: BoxFit.fill,
          ),
          Container(
            width: width,
            height: 0.95 * height,
            padding: const EdgeInsets.all(32),
            color: Colors.black.withOpacity(0.7),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Simulador Eletrônico',
                  style: title,
                ),
                const Spacer(),
                buttonDownload,
              ],
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.only(bottom: 100),
            child: AnimatedTextKit(
              repeatForever: true,
              pause: pause,
              animatedTexts: [
                RotateAnimatedText(
                  'Faça a montagem do seu próprio circuito',
                  textStyle: lyrics,
                  duration: duration,
                ),
                RotateAnimatedText(
                  'Um simulador para circuitos elétricos disponível para Windows',
                  textStyle: lyrics,
                  duration: duration,
                ),
              ],
            ),
          ),
        ],
      ),
    );

    final about = Container(
      width: width,
      height: 0.1 * height,
      color: azul,
      child: const Center(
        child: Text(
          'Conheça nosso Time',
          style: meetTeam,
        ),
      ),
    );

    final team = Container(
      width: 0.9 * width,
      height: 0.35 * height,
      margin: EdgeInsets.fromLTRB(0.05 * width, 8, 0, 16),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: classMates.length,
        separatorBuilder: (_, __) => Row(
          children: <Widget>[
            SizedBox(width: 0.05 * width),
            Container(width: 2, height: 0.35 * height, color: Colors.grey[400]),
            SizedBox(width: 0.05 * width),
          ],
        ),
        itemBuilder: (_, i) => BannerTeam(classMates[i]),
      ),
    );

    final list = SizedBox(
      width: width,
      height: height,
      child: ListView(
        children: <Widget>[
          body,
          about,
          team,
        ],
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: list,
    );
  }
}
