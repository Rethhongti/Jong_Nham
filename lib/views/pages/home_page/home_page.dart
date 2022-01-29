import 'package:flutter/material.dart';
import 'package:jong_nham/views/pages/home_page/widget/home_action_widget.dart';
import '../../../app_index.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              child: Stack(
                children: [
                  Container(
                    color: Colors.teal,
                    width: double.infinity,
                    // height: MediaQuery.of(context).size.height * 0.25,
                    child: Image.asset(
                      "assets/images/cover.jpeg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Opacity(
                    opacity: 0.3,
                    child: Container(
                      color: Colors.black,
                    ),
                  ),
                  Positioned(
                    child: Column(
                      children: [
                        Expanded(
                          child: Center(
                            child: SizedBox(
                              height: 60,
                              child: Image.asset(
                                "assets/images/logo.jpeg",
                              ),
                            ),
                          ),
                        ),
                        // const Spacer(),
                        InkWell(
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage(),)),
                          child: Container(
                            height: 42,
                            margin: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.all(Radius.circular(5)),
                            ),
                            child: Row(
                              children: const [
                                Padding(
                                  padding:
                                  EdgeInsets.symmetric(horizontal: 10),
                                  child: Icon(
                                    Icons.search_outlined,
                                    color: JongNhamAppColors.MAINCOLOR,
                                  ),
                                ),
                                Text(
                                  "Search restaurants",
                                  style: TextStyle(
                                      color: JongNhamAppColors.LIGHT_GRAY,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //Other Action
            Container(
              height: MediaQuery.of(context).size.height * 0.08,
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xffe6e6e6),
                    blurRadius: 1,
                    offset: Offset(0,4),
                  )
                ],
              ),
              child: Row(
                children: const [
                  Expanded(
                    child: HomeActionWidget(
                      actionName: "Near Me",
                      icon: Icons.gps_fixed_outlined,
                    ),
                  ),
                  VerticalDivider(
                    thickness: 1,
                  ),
                  Expanded(
                    child: HomeActionWidget(
                      actionName: "Type of food",
                      icon: Icons.restaurant,
                    ),
                  ),
                  VerticalDivider(
                    thickness: 1,
                  ),
                  Expanded(
                    child: HomeActionWidget(
                      actionName: "Location",
                      icon: Icons.location_on,
                    ),
                  ),
                ],
              ),
            ),

            // Recommend
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text("Recommended",
                    style: TextStyle(
                      fontSize: 15,
                      color: JongNhamAppColors.LIGHT_GRAY
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: const [
                      Expanded(
                        child: RecommendWidget(
                          iconPath: "assets/icons/ic_most_view.png",
                          imagePath: "assets/images/most_view.jpeg",
                          title: "Most View",
                          height: 40,
                        ),
                      ),
                      Expanded(
                        child: RecommendWidget(
                          iconPath: "assets/icons/ic_use_coupon.png",
                          imagePath: "assets/images/most_view.jpeg",
                          title: "Most Coupon",
                          height: 30,
                        ),
                      ),
                      Expanded(
                        child: RecommendWidget(
                          iconPath: "assets/icons/ic_top_review.png",
                          imagePath: "assets/images/most_view.jpeg",
                          title: "Top Review",
                          height: 30,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),

            // Coupon
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text("Coupon",
                    style: TextStyle(
                        fontSize: 15,
                        color: JongNhamAppColors.LIGHT_GRAY
                    ),
                  ),
                ),
                SizedBox(
                  height: 150,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(8)),
                          child: Image.asset("assets/images/coupon.jpeg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),

              ],
            )
          ],
        ),
      ),
    );
  }
}
