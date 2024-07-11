import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertask/app_images.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(
          AppIcons.logoIcon,
          colorFilter: ColorFilter.mode(Color(0xFF004182), BlendMode.srcIn),
          height: 35.h,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(17.0).w,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 13.h, horizontal: 24.w),
                          child: SvgPicture.asset(AppIcons.search),
                        ),
                        hintText: 'what do you search for?',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(color: Colors.white))),
                  ),
                ),
                SizedBox(width: 24.w),
                SvgPicture.asset(AppIcons.cart)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
