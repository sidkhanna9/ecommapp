import 'package:meta/meta.dart';

class Product {
  Product({
    @required this.id,
    @required this.name,
    @required this.avatar,
    @required this.description,
    @required this.features,
    @required this.rating,
    @required this.images,
  });

  final String id;
  final String name;
  final String avatar;
  final String description;
  final String features;
  final String rating;
  final List<Images> images;
}

class Images {
  Images({
    @required this.title,
    @required this.thumbnail,
  });

  final String title;
  final String thumbnail;
}