import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jong_nham/views/pages/coupon_page/coupon_page.dart';
import 'package:jong_nham/views/pages/favorite_page/favorite_page.dart';
import 'package:jong_nham/views/pages/home_page/home_page.dart';
import 'package:jong_nham/views/pages/me_page/me_page.dart';
import '../../../app_index.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, BottomNavState>(
      builder: (context, state) {
        return Scaffold(
          body: IndexedStack(
            index: BlocProvider.of<BottomNavCubit>(context).index,
            children: const [
              HomePage(),
              CouponPage(),
              FavoritePage(),
              MePage()
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            elevation: 0,
            backgroundColor: Colors.grey.shade200,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: JongNhamAppColors.MAINCOLOR,
            selectedFontSize: 12,
            currentIndex: BlocProvider.of<BottomNavCubit>(context).index,
            onTap: (value) {
              BlocProvider.of<BottomNavCubit>(context).onTapChange(value);
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.local_activity), label: "Coupon"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: "Favorite"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_rounded), label: "Me"),
            ],
          ),
        );
      },
    );
  }
}
