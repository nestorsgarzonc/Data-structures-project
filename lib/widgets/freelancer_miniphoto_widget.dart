import 'package:flutter/material.dart';

class FreelancerMiniPhotoWidget extends StatelessWidget {
  //TODO: Add photo url
  const FreelancerMiniPhotoWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.lightBlue,
      ),
      child: const Icon(
        Icons.person_pin,
        size: 50,
        color: Colors.white,
      ),
    );
  }
}
