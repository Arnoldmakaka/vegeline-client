import 'package:vege_line/models/food_category.dart';
import 'package:vege_line/models/food_review.dart';
import 'package:vege_line/models/food_supplier.dart';

class FoodItem{
  final foodId;
  String foodName;
  int pricePerStandardMeasurementUnit;
  FoodSupplier supplier;
  List<Reviews> reviews;
  Category category;
  String imagePath;
  int numOfItems;

  FoodItem({this.foodId, this.foodName, this.pricePerStandardMeasurementUnit, this.supplier, this.reviews, this.category, this.imagePath,this.numOfItems});
  FoodItem.itemDetails({this.foodId,this.foodName});
}