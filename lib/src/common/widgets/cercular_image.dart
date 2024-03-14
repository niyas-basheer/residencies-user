 import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:residential_manager/src/common/widgets/shimmer.dart';
import 'package:residential_manager/src/utils/constants/colors.dart';
import 'package:residential_manager/src/utils/constants/size.dart';
import 'package:residential_manager/src/utils/helpers/helper_function.dart';


class TCircularImage extends StatelessWidget {
  const TCircularImage({
  super.key, 
  this.width = 50,
  this.height = 50,
  this.overlayColor,
  this.backgroundColor,
  required this.image,
  this.fit = BoxFit.cover,
  this.padding = 0,
  this.isNetworkImage = false,
});

final BoxFit? fit;
final String image;
final bool isNetworkImage;
final Color? overlayColor;
final Color? backgroundColor;
final double width, height, padding;

@override
Widget build(BuildContext context) {
  return Container(
    width: width,
    height: height,
    padding: EdgeInsets.all(padding),
    decoration: BoxDecoration(
      color: backgroundColor ?? (THelperFunction.isDarkMode(context) ? Tcolors.dark : Tcolors.white),
      borderRadius: BorderRadius.circular(100),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Center(
        child: isNetworkImage? CachedNetworkImage(
          fit: fit,
          imageUrl: image,
          progressIndicatorBuilder: (context,url,downloadProgress)=> const TShimmerEffect(width: 55, height: 55),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          color: overlayColor,
        ):
        Image(
          fit: fit,
          image:AssetImage(image) ,
          color: overlayColor,
        ),
      ),
    ),
  );
}
  
}