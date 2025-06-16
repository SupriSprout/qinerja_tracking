import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:qinerja_tracking/src/utils/tracking_color.dart';

class QinerjaImageHelper extends StatelessWidget {
  const QinerjaImageHelper(
      {super.key,
      required this.url,
      this.height = 500,
      this.width = 500,
      this.boxFit = BoxFit.cover,
      this.generateName = '',
      this.borderRadius = 0});

  final String generateName;
  final String url;
  final double height;
  final double width;
  final BoxFit boxFit;
  final double borderRadius;

  String _getBaseUrl(String url) {
    int indexOfQuestionMark = url.indexOf('?');
    if (indexOfQuestionMark != -1) {
      return url.substring(
          0, indexOfQuestionMark); // Return the part before '?'
    }
    return url; // If no '?' is present, return the original URL
  }

  @override
  Widget build(BuildContext context) {
    final String imageUrl = _getBaseUrl(url);

    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: imageUrl.isEmpty || !imageUrl.contains('http')
          ? ClipRRect(
              borderRadius: BorderRadius.circular(borderRadius),
              child: Container(
                height: height,
                width: width,
                decoration: BoxDecoration(
                    color: TrackingColor.borderPrimaryInvertColor,
                    borderRadius: BorderRadius.circular(borderRadius),
                    border:
                        Border.all(color: TrackingColor.lineBorder)),
                child: Center(
                  child: Text(
                    generateName.isEmpty
                        ? 'A'
                        : generateName
                            .split(' ')
                            .first
                            .substring(0, 1)
                            .toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: TrackingColor.shadowColor),
                  ),
                ),
              ),
            )
          : Container(
              height: height,
              width: width,
              padding: const EdgeInsets.all(0.2),
              decoration: BoxDecoration(
                  color: TrackingColor.borderPrimaryInvertColor,
                  borderRadius: BorderRadius.circular(borderRadius),
                  border: Border.all(
                      color: TrackingColor.lineColor, width: 1)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(borderRadius),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  height: height,
                  width: width,
                  fit: boxFit,
                ),
              ),
            ),
    );
  }
}
