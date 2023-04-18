import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/utils/extension/extension.dart';
import 'package:movie_app/utils/sizes.dart';
import 'package:movie_app/utils/styles/color_palettes.dart';
import 'package:movie_app/utils/widget/error/error.dart';
import 'package:movie_app/utils/widget/progress/loading_indicator.dart';

class CardHome extends StatelessWidget {
  final String image, title;
  final Function? onTap;
  final double rating;

  const CardHome({Key? key, required this.image, required this.title, this.onTap, required this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var isDarkTheme = theme.appBarTheme.color == null;
    return SizedBox(
      width: Sizes.width(context) / 2.5,
      child: GestureDetector(
        onTap: onTap!(),
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Sizes.dp10(context))),
          child: Stack(
            children: <Widget>[
              // Image
              ClipRRect(
                borderRadius:
                    BorderRadius.all(Radius.circular(Sizes.dp10(context))),
                child: CachedNetworkImage(
                  imageUrl: image.imageOriginal,
                  height: Sizes.width(context) / 1.8,
                  width: Sizes.width(context) / 2.5,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const LoadingIndicator(),
                  errorWidget: (context, url, error) => ErrorImage(),
                ),
              ),

              // Background
              Container(
                height: Sizes.width(context) / 1.8,
                width: Sizes.width(context) / 2.5,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.all(Radius.circular(Sizes.dp10(context))),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.1, 0.98],
                    colors: [
                      ColorPalettes.transparent,
                      !isDarkTheme ? ColorPalettes.white : ColorPalettes.darkBG,
                    ],
                  ),
                ),
              ),

              // Text and Rating
              Positioned(
                left: 0,
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.circular(Sizes.dp10(context))),
                  ),
                  padding: EdgeInsets.only(
                      left: Sizes.dp6(context), bottom: Sizes.dp5(context)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: Sizes.dp14(context),
                            fontWeight: FontWeight.bold,
                            color: !isDarkTheme
                                ? ColorPalettes.darkBG
                                : ColorPalettes.white),
                      ),
                      SizedBox(height: Sizes.dp4(context)),

                      // Rating
                      buildRatingBar(theme, context, rating),
                      SizedBox(height: Sizes.dp10(context)),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRatingBar(ThemeData theme, BuildContext context, double rating) {
    var stars = <Widget>[];
    for (var i = 1; i <= 5; i++) {
      var color = i <= rating / 2 ? theme.accentColor : ColorPalettes.grey;
      var star = Icon(
        Icons.star,
        color: color,
        size: Sizes.dp18(context),
      );
      stars.add(star);
    }
    return Row(mainAxisSize: MainAxisSize.min, children: stars);
  }
}
