import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

class ImageSection extends StatelessWidget {
  const ImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LottieBuilder.asset('assets/animations/owl.json', height: 200, repeat: true,);
  }
}
