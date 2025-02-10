


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NetworkImageWidget extends StatelessWidget {
  final String? imageUrl;
  final double size;
  final double iconSize;
  final BoxFit boxFit;

  const NetworkImageWidget({
    super.key,
    required this.imageUrl,
    this.size = 120,
    this.iconSize = 20,
    this.boxFit = BoxFit.cover,
  });

  bool _isValidUrl(String? url) {
    if (url == null || url.isEmpty) return false;
    return url.startsWith('http') || url.startsWith('https');
  }

  @override
  Widget build(BuildContext context) {
    final double borderRadius = size / 2;

    bool isValidUrl = _isValidUrl(imageUrl);

    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: !isValidUrl
          ? Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              child: Image.asset('assets/images/image_not_found.png'),
            )
          : CachedNetworkImage(
              imageUrl: imageUrl!,
              width: size,
              height: size,
              imageBuilder: (context, imageProvider) => Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadius),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: boxFit,
                  ),
                ),
              ),
              placeholder: (context, url) => Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: CircularProgressIndicator(),
                ),
              ),
              errorWidget: (context, url, error) => Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                child: Icon(Icons.person_outline, size: iconSize),
              ),
            ),
    );
  }
}
