class Vendor {
  final String image;
  final String offerText;
  final String category;

  Vendor(
      {required this.image, required this.offerText, required this.category});
  factory Vendor.fromJson(Map<String, dynamic> json) {
    return Vendor(
        image: json['image'],
        offerText: json['offerText'],
        category: json['category']);
  }
}
