// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/core/models/movie_response_model.dart';
import 'package:movie_app/core/networking/api_constant.dart';

//import 'package:movie_app/core/models/feature_series_model.dart';
import 'package:movie_app/core/utils/app_color.dart';
import 'package:movie_app/core/utils/app_images.dart';
import 'package:movie_app/core/utils/app_style.dart';
import 'package:movie_app/views/widget/gener_button.dart';
import 'package:movie_app/views/widget/metadate_item.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({
    super.key,
    required this.model,
  });
  final Results model;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            width: double.infinity,
            child: Image.network(
                "${ApiConstants.imageBaseUrl + ApiConstants.backdropSize}${model.backdropPath}",
                fit: BoxFit.cover,
                width: double.infinity),
          ),
          Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.27,
              //: MediaQuery.of(context).size.height * 0.1,
            ),
            height: MediaQuery.of(context).size.height * 0.19,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColor.primary.withOpacity(0.0),
                  AppColor.primary.withOpacity(0.8),
                  AppColor.primary.withOpacity(0.95),
                  AppColor.primary.withOpacity(1),
                  AppColor.primary.withOpacity(1.0),
                ],
              ),
            ),
          ),
          Positioned(
            top: 300,
            left: 0,
            right: 0,
            child: SvgPicture.asset(
              Images.play,
              height: 60,
              width: 60,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.480,
            ),
            child: SizedBox(
              //height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      model.title ?? "",
                      style: AppStyle.semiBold24.copyWith(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        MetadateItem(
                            icon: Icons.calendar_today_outlined,
                            title: "Release Date",
                            releaseDate: model.releaseDate ?? ""),
                        SizedBox(width: 18),
                        MetadateItem(
                          icon: Icons.language,
                          title: "Language",
                          releaseDate: model.originalLanguage ?? "",
                        ),
                        SizedBox(width: 18),
                        MetadateItem(
                            icon: Icons.trending_up,
                            title: "Poprularity",
                            releaseDate: model.popularity.toString()),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Overview",
                          style:
                              AppStyle.semiBold18.copyWith(color: Colors.white),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          model.overview ?? "",
                          style: AppStyle.regular16
                              .copyWith(color: Colors.white70),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 20,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              model.voteAverage.toString(),
                              style: AppStyle.regular16
                                  .copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.how_to_vote,
                          color: Colors.white70,
                          size: 20,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          model.voteCount.toString(),
                          style:
                              AppStyle.regular16.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Genres",
                          style:
                              AppStyle.semiBold18.copyWith(color: Colors.white),
                        ),
                        const SizedBox(height: 10),
                        const Row(
                          children: [
                            GenerButton(title: "Gener 28"),
                            SizedBox(width: 8),
                            GenerButton(title: "Gener 12"),
                            SizedBox(width: 8),
                            GenerButton(title: "Gener 53"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
