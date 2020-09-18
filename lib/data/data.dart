import 'package:Wallpaper/model/categories_model.dart';

List<CategoriesModel> getCategories() {
  List<CategoriesModel> categories = new List();
  CategoriesModel categorieModel = new CategoriesModel();

   categorieModel.imgUrl =
      "https://images.pexels.com/photos/417074/pexels-photo-417074.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  categorieModel.categoriesName = "Nature";
  categories.add(categorieModel);
  categorieModel = new CategoriesModel();

  //
  categorieModel.imgUrl =
      "https://images.pexels.com/photos/46798/the-ball-stadion-football-the-pitch-46798.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  categorieModel.categoriesName = "Sports";
  categories.add(categorieModel);
  categorieModel = new CategoriesModel();

  //
  categorieModel.imgUrl =
      "https://images.pexels.com/photos/704320/pexels-photo-704320.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categorieModel.categoriesName = "Wild Life";
  categories.add(categorieModel);
  categorieModel = new CategoriesModel();

  //
  categorieModel.imgUrl =
      "https://images.pexels.com/photos/466685/pexels-photo-466685.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categorieModel.categoriesName = "City";
  categories.add(categorieModel);
  categorieModel = new CategoriesModel();

  //
  categorieModel.imgUrl =
      "https://images.pexels.com/photos/841135/pexels-photo-841135.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  categorieModel.categoriesName = "Fitness";

  categories.add(categorieModel);
  categorieModel = new CategoriesModel();

  //
  categorieModel.imgUrl =
      "https://images.pexels.com/photos/1183992/pexels-photo-1183992.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  categorieModel.categoriesName = "Art";
  categories.add(categorieModel);
  categorieModel = new CategoriesModel();

  //
  categorieModel.imgUrl =
      "https://images.pexels.com/photos/404190/pexels-photo-404190.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  categorieModel.categoriesName = "Cars";
  categories.add(categorieModel);
  categorieModel = new CategoriesModel();

  return categories;
}