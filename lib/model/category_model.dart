class CategoryModel{
  String name;
  String url;

  CategoryModel({required this.name,required this.url});

  static List<CategoryModel> generate(){
    return [
      CategoryModel(name: 'Cocoa', url: 'assets/categories_image/Cocoa.jpg'),
      CategoryModel(name: 'Ordinary \nDrink', url: 'assets/categories_image/Ordinary_Drink.jpg'),
      CategoryModel(name: 'Shake', url: 'assets/categories_image/Shake.jpg'),
      CategoryModel(name: 'Shot', url: 'assets/categories_image/Shot.jpg'),
      CategoryModel(name: 'Cocktail', url: 'assets/categories_image/Cocktail.jpg'),
    ];
  }
}