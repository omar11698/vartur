import 'package:flutter/material.dart';
import 'package:vartur_assignment/constants/assets.dart';
import 'package:vartur_assignment/data/response_model.dart';

class ImageView extends StatelessWidget {
  final ImageFromApi imageModel;
  const ImageView({super.key, required this.imageModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(imageModel.title)),
      body: Center(
        child: Image.network(
          '${imageModel.imageUrl}',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                    : null,
              ),
            
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return  Center(
              child: Image.asset(Assets.assetsBrokenImage,)
            );
          },
        ),
      ),
    );
  }
}
