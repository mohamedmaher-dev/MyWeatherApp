import 'package:flutter/material.dart';
import 'package:myweatherapp/services/location_service.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    LocationService(context: context).start();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF081A24),
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          const Spacer(flex: 1),
          const Image(
              image: NetworkImage(
                  "https://cdn-icons-png.flaticon.com/128/9973/9973191.png")),
          const Spacer(flex: 1),
          Container(
            padding: const EdgeInsets.all(25),
            child: const CircularProgressIndicator(color: Colors.white),
          )
        ],
      ),
    );
  }
}
