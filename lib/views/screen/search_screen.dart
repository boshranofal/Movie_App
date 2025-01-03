import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/core/utils/app_color.dart';
import 'package:movie_app/core/utils/app_images.dart';
import 'package:movie_app/core/utils/app_style.dart';
import 'package:movie_app/views/widget/search_screen_body.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_outlined,
              color: Colors.white, size: 24),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColor.primary,
              AppColor.primary,
              //Color(0xff373E52),
            ],
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 16),
              TextField(
                autofocus: true,
                cursorColor: Colors.white,
                // onChanged: cubit.filterMovies,
                style: AppStyle.meduim14.copyWith(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xff767680).withOpacity(0.12),
                  hintText: 'Search for movies',
                  hintStyle: AppStyle.meduim14.copyWith(
                    color: const Color(0xffA0A0A0),
                  ),
                  prefixIcon: SvgPicture.asset(
                    Images.search,
                    fit: BoxFit.scaleDown,
                  ),
                  suffixIcon:
                      const Icon(Icons.clear, color: Colors.white, size: 24),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  enabledBorder: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              const SearchScreenBody(),
            ],
          ),
        ),
      ),
    );
  }
}
