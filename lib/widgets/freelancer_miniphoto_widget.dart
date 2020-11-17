import 'package:flutter/material.dart';

class FreelancerMiniPhotoWidget extends StatelessWidget {
  final String freelancerName;
  final String freelancerUrlImage;
  final Function onTap;
  const FreelancerMiniPhotoWidget({
    Key key,
    @required this.freelancerName,
    @required this.freelancerUrlImage,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: const [BoxShadow(blurRadius: 2, color: Colors.grey)],
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(freelancerUrlImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              freelancerName.split(' ')[0],
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
