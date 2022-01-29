import 'package:flutter/material.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

class ShopListCard extends StatelessWidget {
  const ShopListCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      // color: Colors.teal,
      padding: const EdgeInsets.only(left: 15,top: 15,bottom: 15,right: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            // height: 90,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(3)),
              child: Image.asset("assets/images/logo.jpeg"),
            ),
          ),
          const SizedBox(width: 15,),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Jong Nham",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SmoothStarRating(
                    rating: 0,
                    borderColor: Colors.grey,
                    size: 20,
                  ),
                  const SizedBox(width: 5,),
                  const Text("0.0"),
                  const SizedBox(width: 5,),
                  const Text("|"),
                  const SizedBox(width: 5,),
                  const Icon(Icons.visibility,
                    size: 18,
                  ),
                  const SizedBox(width: 5,),
                  const Text("24 Views",
                    style: TextStyle(
                      color: Colors.grey
                    ),
                  ),
                ],
              ),

              const Text("No Rating | No Review",
                style: TextStyle(
                    color: Colors.grey
                ),
              ),
              Row(
                children: const [
                  Icon(Icons.restaurant,
                    size: 15,
                  ),
                  Text("Coffee |"),
                  SizedBox(width: 5,),
                  Icon(Icons.location_on,
                    size: 15,
                  ),
                  Text("Open Now",
                    style: TextStyle(
                        color: Colors.green
                    ),),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
