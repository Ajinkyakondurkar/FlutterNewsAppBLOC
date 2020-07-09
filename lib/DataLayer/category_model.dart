class CategoryModel{
  String categoryName;
  String imageUrl;
  CategoryModel.fromJson(Map json)
      :categoryName = json['categoryName'],
        imageUrl = json['imageUrl'];
}