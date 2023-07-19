import 'package:flutter/material.dart';

import '../../global/colors.dart';
import '../../global/fonts.dart';
import '../../global/size.dart';

class HomeHeader extends StatelessWidget {
  final String name;
  const HomeHeader({required this.name, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      width: sWidthMinus(context, 40),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(radius: 20, child: Text("NF")),
          const SizedBox(width: 5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Welcome To My Apps', style: h2(cPremier)),
              SizedBox(
                width: sWidthMinus(context, 130),
                child: Text(
                  name,
                  style: body(cBlack),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
