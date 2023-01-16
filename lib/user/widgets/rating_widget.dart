import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

RatingWidget ratingWidget() {
  return RatingWidget(
    full: const Icon(Icons.star, color: Colors.orange),
    half: const Icon(
      Icons.star_half,
      color: Colors.orange,
    ),
    empty: const Icon(
      Icons.star_outline,
      color: Colors.orange,
    ),
  );
}
