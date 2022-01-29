import 'package:flutter/material.dart';

class RecommendWidget extends StatelessWidget {
  const RecommendWidget({Key? key,
    required this.iconPath,
    required this.imagePath,
    required this.title,
    required this.height
  }) : super(key: key);

  final String iconPath;
  final String title;
  final String imagePath;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      height: 150,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        child: Stack(
          children: [
            SizedBox(
              height: 150,
              child: Image.asset(imagePath,
                fit: BoxFit.cover,
              ),
            ),
            Opacity(
              opacity: 0.3,
              child: Container(
                color: Colors.black,
              ),
            ),

            Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: height,
                    child: Image.asset(iconPath),
                  ),
                  const SizedBox(height: 5,),
                  Text(title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white
                    ),
                  )
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
