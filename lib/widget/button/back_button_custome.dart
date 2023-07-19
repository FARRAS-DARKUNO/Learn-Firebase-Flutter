import 'package:firebase_learn/utils/route.dart';
import 'package:flutter/material.dart';
import '../../global/colors.dart';
import '../../global/fonts.dart';
import '../../global/size.dart';

class BackButtonCustome extends StatelessWidget {
  const BackButtonCustome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: sHeightBackButton(context),
      padding: const EdgeInsets.all(20),
      child: GestureDetector(
        onTap: () => goBack(context),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.chevron_left_sharp, size: 24, color: cPremier),
            Text('Back', style: h2(cPremier))
          ],
        ),
      ),
    );
  }
}
