import 'package:electrophorus_site/constants.dart' as utils;
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/bg1.jpg',
            width: width,
            height: height,
            fit: BoxFit.fill,
          ),
          Container(
            color: Colors.black.withOpacity(0.7),
          ),
          _buildBody(context),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
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
              onTap: () {
                _openDownload();
              },
              pause: utils.pause,
              repeatForever: true,
              animatedTexts: [
                TypewriterAnimatedText(
                  'Download',
                  speed: utils.speed,
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
      onTap: () {
        _openSupport();
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            border: Border.all(
          color: Colors.green,
        )),
        child: Row(children: [
          Text('Buy me a coffee', style: utils.button),
          const SizedBox(width: 15),
          const Icon(
            Icons.favorite_outlined,
            color: Colors.white,
          )
        ]),
      ),
    );

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
                    onPressed: () {
                      Navigator.pushNamed(context, '/demo');
                    },
                    child: Text('Demo', style: utils.top)),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/guide');
                    },
                    child: Text("PDF's", style: utils.top)),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/about');
                    },
                    child: Text('Sobre', style: utils.top)),
              ],
            ),
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Simulador para Circuitos Elétricos',
                      style: utils.title),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 35),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset('assets/logo.png', height: 110),
                        const SizedBox(width: 35),
                        Flexible(
                          child: Text(
                              'Electrophorus é um projeto de código aberto disponível para Windows.\nAtualmente em desenvolvimento.',
                              style: utils.text),
                        ),
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
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      _customButtom(
                        iconLink:
                            'https://cdn-icons-png.flaticon.com/512/25/25231.png',
                        onPressed: () {
                          _openSource();
                        },
                      ),
                      _customButtom(
                          iconLink:
                              'https://cdn-icons-png.flaticon.com/512/1384/1384060.png'),
                    ],
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text('2020 - 2022 Desenvolvedores do Electrophorus',
                  style: utils.credits),
            ),
          ]),
    );
  }

  Widget _customButtom({
    required String iconLink,
    Function()? onPressed,
  }) {
    onPressed ??= () {};

    return ElevatedButton(
      onPressed: onPressed,
      child: Padding(
          padding: const EdgeInsets.all(10),
          child: Image.network(
            iconLink,
            width: 30,
          )),
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        shape: const CircleBorder(),
      ),
    );
  }

  // Support
  Future<void> _openSupport() async {
    const url = 'https://www.buymeacoffee.com/electrophorus';
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  // Source code
  Future<void> _openSource() async {
    const url = 'https://github.com/gotneb/Electrophorus';
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  // Dowload program
  Future<void> _openDownload() async {
    const url =
        'https://www.mediafire.com/file/gsqeflyd63ief5s/Electrophorus-x64.msix/file';
    if (await canLaunch(url)) {
      await launch(url);
    }
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
