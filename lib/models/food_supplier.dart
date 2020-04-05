import 'package:vege_line/models/food_category.dart';
import 'package:vege_line/models/food_item.dart';

class FoodSupplier{
  var supplierId;
  String supplierName;
  String profileImagePath;
  String contact;
  String location;
  String description;
  List<Category> foodCategories;
  var rating;
  List<FoodItem> foodItems;

  FoodSupplier({this.supplierId,this.supplierName,this.profileImagePath,this.contact,this.location,this.description,this.foodCategories,this.rating,this.foodItems});

  FoodSupplier.supplierDetails({this.supplierId,this.supplierName,this.contact});
}