import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id; // Changed sId to int
  final String title; // Changed name to title
  final String image;
  final double price; // Changed int to double
  final String description;
  final String category;
  final Map<String, dynamic> rating;

  Product({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.description,
    required this.category,
    required this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'], // Changed sId to id
      title: json['title'], // Changed name to title
      image: json['image'],
      price: (json['price'] as num).toDouble(), // Changed int to double
      description: json['description'],
      category: json['category'],
      rating: json['rating'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'id': id, // Changed sId to id
      'title': title, // Changed name to title
      'image': image,
      'price': price,
      'description': description,
      'category': category,
      'rating': rating,
    };
    return data;
  }

  @override
  List<Object?> get props =>
      [id, title, image, price, description, category, rating];
}
