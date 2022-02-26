import 'package:electrophorus_site/constants.dart' as utils;
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

//import 'package:url_launcher/url_launcher.dart';
//import 'dart:html' as html;

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final _downloadButton = InkWell(
    onTap: () {},
    child: Container(
      width: 130.0,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border.all(
        color: Colors.red,
      )),
      child: Row(
        children: [
          AnimatedTextKit(
            pause: utils.pause,
            repeatForever: true,
            animatedTexts: [
              TypewriterAnimatedText(
                'Download',
                speed: const Duration(milliseconds: 300),
                textStyle: utils.button,
                curve: Curves.decelerate,
              ),
            ],
          ),
          const Icon(
            Icons.file_download_outlined,
            color: Colors.white,
          )
        ],
      ),
    ),
  );

  final _supportButton = InkWell(
    onTap: () {},
    child: Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border.all(
        color: Colors.green,
      )),
      child: Row(children: [
        Text('Buy me a coffee', style: utils.button),
        const SizedBox(width: 5),
        const Icon(
          Icons.interests_outlined,
          color: Colors.white,
        )
      ]),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/bg2.jpg', width: width, fit: BoxFit.cover),
          Container(
            color: Colors.black.withOpacity(0.7),
          ),
          _buildBody()
        ],
      ),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 70),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                TextButton(
                    onPressed: () {},
                    child: Text('Electrophorus', style: utils.electrophorus)),
                const Spacer(),
                TextButton(
                    onPressed: () {}, child: Text('Demo', style: utils.top)),
                TextButton(
                    onPressed: () {}, child: Text("PDF's", style: utils.top)),
                TextButton(
                    onPressed: () {}, child: Text('Sobre', style: utils.top)),
              ],
            ),
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Simulador para Circuitos Elétricos',
                      style: utils.title),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset('assets/logo_white_2.png', height: 100),
                        const SizedBox(width: 35),
                        Text(
                            'Electrophorus é um projeto de código aberto disponível para Windows.',
                            style: utils.text),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      _downloadButton,
                      const SizedBox(width: 20),
                      _supportButton,
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      _customButtom(
                          iconLink:
                              'https://cdn-icons-png.flaticon.com/512/25/25231.png'),
                      const SizedBox(width: 10),
                      _customButtom(
                          iconLink:
                              'https://cdn-icons-png.flaticon.com/512/1384/1384060.png'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ]),
    );
  }

  Widget _customButtom({required String iconLink}) {
    return ElevatedButton(
      onPressed: () {},
      child: Padding(
          padding: const EdgeInsets.all(20),
          child: Image.network(
            iconLink,
            width: 20,
          )),
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        shape: const CircleBorder(),
      ),
    );
  }

  /*
  void downloadSetup() {
    const url =
        'https://github.com/gotneb/Electrophorus/blob/Installer/Installer/Electrophorus-x64.msix';
    html.AnchorElement anchorElement = html.AnchorElement(href: url);
    anchorElement.download = url;
    anchorElement.click();
  }
  */
}
