import 'package:app1/models/popular_model.dart';
import 'package:flutter/material.dart';

class ItemPopularMovie extends StatelessWidget {
  ItemPopularMovie({super.key, required this.popularModel});
  PopularModel? popularModel;

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
        fit: BoxFit.cover,
        placeholder: const AssetImage('assets/load.gif'),
        image: NetworkImage(
            'https://image.tmdb.org/t/p/w500/${popularModel!.posterPath}'));
  }
}
