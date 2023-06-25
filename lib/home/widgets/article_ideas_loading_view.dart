import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ArticleIdeasLoadingView extends StatelessWidget {
  const ArticleIdeasLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (context, index) => Shimmer.fromColors(
        baseColor: Colors.grey.withOpacity(0.2),
        highlightColor: Colors.grey.withOpacity(0.1),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.grey.withOpacity(0.5),
          ),
          margin: const EdgeInsets.all(8.0),
          height: 70,
        ),
      ),
    );
  }
}
