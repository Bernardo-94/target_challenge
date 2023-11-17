import 'package:flutter/material.dart';
import 'package:target_challenge/project/shared/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class MainDesign extends StatelessWidget {
  final Widget child;
  const MainDesign({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF204C60),
            Color(0xFF2E968F),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          child,
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 30.0,
              ),
              child: TextButton(
                onPressed: () {
                  _lauchGoogle();
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                ),
                child: const Text('Política de Privacidade'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _lauchGoogle() async {
    Uri url = Uri.parse(urlGoole);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Não foi possível abrir $url';
    }
  }
}
