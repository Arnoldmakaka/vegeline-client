import 'package:vege_line/models/food_item.dart';

class Reviews{
  var reviewId;
  String dateCreated;
  String reviewText;
  FoodItem foodItem;
  var userId;
  String userName;
  double rating;
  String userImagePath;

  Reviews({this.reviewId,this.dateCreated,this.reviewText,this.foodItem,this.userId,this.userName,this.rating,this.userImagePath});
}