import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertask/app_images.dart';
import 'package:fluttertask/product_cubit.dart';
import 'package:fluttertask/product_state.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit()..getAllProduct(),
      child: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          final ProductCubit productCubit = context.read<ProductCubit>();
          return Scaffold(
            appBar: AppBar(
              title: SvgPicture.asset(
                AppIcons.logoIcon,
                colorFilter:
                    const ColorFilter.mode(Color(0xFF004182), BlendMode.srcIn),
                height: 35.h,
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(17.0).w,
              child: Column(
                children: [
                  Row(
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
                                  borderRadius: BorderRadius.circular(25).w,
                                  borderSide:
                                      const BorderSide(color: Colors.white))),
                        ),
                      ),
                      SizedBox(width: 24.w),
                      SvgPicture.asset(AppIcons.cart)
                    ],
                  ),
                  SizedBox(height: 24.h),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: .55),
                      itemBuilder: (context, index) {
                        final product = productCubit.allProducts[index];
                        final priceAfterDiscount = product.price +
                            (product.price * product.discountPercentage / 100);
                        return Card(
                          child: Column(
                            children: [
                              Expanded(
                                child: Stack(
                                  alignment: AlignmentDirectional.topEnd,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(18),
                                              topRight: Radius.circular(18))),
                                      width: double.infinity,
                                      child: Image.network(
                                        width: double.infinity,
                                        product.thumbnail,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    SvgPicture.asset(AppIcons.heart)
                                  ],
                                ),
                              ),
                              SizedBox(height: 8.h),
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      // maxLines: 2,
                                      product.title,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      maxLines: 2,
                                      product.description,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('\$ ${product.price}',
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14)),
                                        Text(
                                          '${priceAfterDiscount.toStringAsFixed(2)}  \$',
                                          style: GoogleFonts.poppins(
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 11,
                                              color: Color(0xFF004182)),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text('Review (${product.rating})',
                                                style: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 12)),
                                            SizedBox(
                                              width: 4.w,
                                            ),
                                            SvgPicture.asset(AppIcons.star)
                                          ],
                                        ),
                                        IconButton(
                                            onPressed: () {},
                                            icon: SvgPicture.asset(
                                                AppIcons.iconButton))
                                      ],
                                    ),
                                  ],
                                ),
                              ))
                            ],
                          ),
                        );
                      },
                      itemCount: productCubit.allProducts.length,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
