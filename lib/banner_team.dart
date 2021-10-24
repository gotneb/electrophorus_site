import 'package:flutter/material.dart';

import 'constants.dart';
import 'member_team.dart';

class BannerTeam extends StatelessWidget {
  final MemberTeam member;

  const BannerTeam(this.member) : super(key: null);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            foregroundImage: AssetImage(
              member.image,
            ),
            radius: 60,
          ),
          Text(member.name, style: name),
          Text(member.degree),
        ],
      ),
    );
  }
}
