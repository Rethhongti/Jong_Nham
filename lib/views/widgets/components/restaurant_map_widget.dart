import 'package:flutter/material.dart';

class RestaurantMapWidget extends StatelessWidget {
  const RestaurantMapWidget({Key? key,
    required this.name
  }) : super(key: key);

  final String name;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color(0xffe6e6e6),
                blurRadius: 1,
                offset: Offset(0,4),
              ),
            ],
            borderRadius: BorderRadius.all(Radius.circular(5))
          ),
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          height: 90,
          child: Row(
            children: [
              Image.asset("assets/images/logo.jpeg"),
              const SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                    ),
                  ),
                  const SizedBox(height: 5,),
                  const Text("Open Now",
                    style: TextStyle(
                        color: Colors.green
                    ),),
                ],
              )
            ],
          ),
        ),

        const Positioned(
          bottom: 10,
          right: 20,
          child: CircleAvatar(
            radius: 15,
            backgroundColor: Colors.blueAccent,
            child: Icon(Icons.navigation,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}
