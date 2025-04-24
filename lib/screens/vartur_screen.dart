import 'package:flutter/material.dart';
import 'package:vartur_assignment/data/api.dart';
import 'package:vartur_assignment/constants/assets.dart';
import 'package:vartur_assignment/screens/image_view.dart';
import 'package:vartur_assignment/data/response_model.dart';

class VarturScreen extends StatelessWidget {
  const VarturScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Vartur')),
      body: FutureBuilder<List<ImageFromApi>>(
        future: getImages(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final List<ImageFromApi> images = snapshot.data ?? [];
            return ListView.builder(
              itemCount: images.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(images[index].title ?? ''),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => ImageView(imageModel: images[index]),
                      ),
                    );
                  },
                  subtitle: Image.network(
                    images[index].thumbnailUrl ?? '',
                    fit: BoxFit.cover,
                    width: 100,
                    height: 100,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(Assets.assetsBrokenImage);
                    },
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value:
                              loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      (loadingProgress.expectedTotalBytes ?? 1)
                                  : null,
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
