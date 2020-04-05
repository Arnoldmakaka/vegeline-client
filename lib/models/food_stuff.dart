import 'package:vege_line/models/food_category.dart';
import 'package:vege_line/models/food_item.dart';
import 'package:vege_line/models/food_review.dart';
import 'package:vege_line/models/food_supplier.dart';
import 'package:vege_line/screens/ui/home_side/food_category.dart';

final category1 = Category(
  categoryId: 1,
  categoryName: 'Grains',
  imagePath: 'assets/images/IMG-20200325-WA0017.jpg',
);

final category2 = Category(
  categoryId: 2,
  categoryName: 'Dairy',
  imagePath: 'assets/images/IMG-20200325-WA0019.jpg',
);

final category3 = Category(
  categoryId: 3,
  categoryName: 'Meats',
  imagePath: 'assets/images/IMG-20200325-WA0043.jpg'
);

final category4 = Category(
  categoryId: 4,
  categoryName: 'Fruits&Vegs',
  imagePath: 'assets/images/IMG-20200325-WA0051.jpg'
);

final category5 = Category(
  categoryId: 5,
  categoryName: 'Poultry',
  imagePath: 'assets/images/IMG-20200325-WA0045.jpg'
);

final category6 = Category(
  categoryId: 6,
  categoryName: 'Tubers',
  imagePath: 'assets/images/IMG-20200325-WA0053.jpg'
);

List<Category> foodCategories = [
  category1,
  category2,
  category3,
  category4,
  category5,
  category6,
];

final meats1 = FoodItem(
  foodId:1,
  foodName:'Beef',
  pricePerStandardMeasurementUnit:10000,
  supplier:FoodSupplier.supplierDetails(supplierId: 1, supplierName:'Kigozi Hans',contact: "0789402190"),
  reviews:[
    Reviews(
      reviewId:1,
      dateCreated:'21/12/2019',
      reviewText:'Too good to be true',
      foodItem: FoodItem.itemDetails(foodId: 1, foodName:'Beef'),
      userId: 3,
      userName: 'Muhumuza Carol',
      rating: 2.75,
      userImagePath: "assets/images/GEDC0900.jpg"
    ),
    Reviews(
      reviewId:2,
      dateCreated:'24/03/2020',
      reviewText:'I think the vendor should minimise the delivery time',
      foodItem: FoodItem.itemDetails(foodId: 1, foodName:'Beef'),
      userId: 3,
      userName: 'Agatha Nels',
      rating: 5.0,
      userImagePath: "assets/images/GEDC0900.jpg"
    ),
    Reviews(
      reviewId:1,
      dateCreated:'4/03/2020',
      reviewText:'Everyone this guy is the best!!!',
      foodItem: FoodItem.itemDetails(foodId: 1, foodName:'Beef'),
      userId: 3,
      userName: 'Mystic',
      rating: 3.5,
      userImagePath: "assets/images/GEDC0900.jpg"
    ),
  ],
  category: Category(categoryId:3,categoryName:'Meats'),
  imagePath: "assets/images/IMG-20200325-WA0040.jpg",
  numOfItems: 10
);

final meats2 = FoodItem(
  foodId:2,
  foodName:'Goat Ribs',
  pricePerStandardMeasurementUnit:15000,
  supplier:FoodSupplier.supplierDetails(supplierId: 1, supplierName:'Kigozi Hans',contact: "0789402190"),
  reviews:[
    Reviews(
      reviewId:4,
      dateCreated:'21/12/2019',
      reviewText:'Too good to be true',
      foodItem: FoodItem.itemDetails(foodId: 1, foodName:'Beef'),
      userId: 3,
      userName: 'Muhumuza Carol',
      rating: 4.5,
      userImagePath: "assets/images/GEDC0900.jpg"
    ),
    Reviews(
      reviewId:5,
      dateCreated:'24/03/2020',
      reviewText:'I think the vendor should minimise the delivery time',
      foodItem: FoodItem.itemDetails(foodId: 1, foodName:'Beef'),
      userId: 3,
      userName: 'Agatha Nels',
      rating: 1.0,
      userImagePath: "assets/images/GEDC0900.jpg"
    ),
    Reviews(
      reviewId:6,
      dateCreated:'4/03/2020',
      reviewText:'Everyone this guy is the best!!!',
      foodItem: FoodItem.itemDetails(foodId: 1, foodName:'Beef'),
      userId: 3,
      userName: 'Mystic',
      rating: 5.0,
      userImagePath: "assets/images/GEDC0900.jpg"
    ),
  ],
  category: Category(categoryId:3,categoryName:'Meats'),
  imagePath: "assets/images/IMG-20200325-WA0039.jpg",
  numOfItems: 20
);

final meats3 = FoodItem(
  foodId:3,
  foodName:'Muchomo Skins',
  pricePerStandardMeasurementUnit:30000,
  supplier:FoodSupplier.supplierDetails(supplierId: 1, supplierName:'Kigozi Hans',contact: "0789402190"),
  reviews:[
    Reviews(
      reviewId:7,
      dateCreated:'21/12/2019',
      reviewText:'Too good to be true',
      foodItem: FoodItem.itemDetails(foodId: 1, foodName:'Beef'),
      userId: 3,
      userName: 'Muhumuza Carol',
      rating: 2.5,
      userImagePath:"assets/images/GEDC0900.jpg"
    ),
    Reviews(
      reviewId:8,
      dateCreated:'24/03/2020',
      reviewText:'I think the vendor should minimise the delivery time',
      foodItem: FoodItem.itemDetails(foodId: 1, foodName:'Beef'),
      userId: 3,
      userName: 'Agatha Nels',
      rating: 3.5,
      userImagePath: "assets/images/GEDC0900.jpg"
    ),
    Reviews(
      reviewId:9,
      dateCreated:'4/03/2020',
      reviewText:'Everyone this guy is the best!!!',
      foodItem: FoodItem.itemDetails(foodId: 1, foodName:'Beef'),
      userId: 3,
      userName: 'Mystic',
      rating: 1.0,
      userImagePath: "assets/images/GEDC0900.jpg"
    ),
  ],
  category: Category(categoryId:3,categoryName:'Meats'),
  imagePath: "assets/images/IMG-20200325-WA0043.jpg",
  numOfItems: 5
);

final grains1 = FoodItem(
  foodId:4,
  foodName:'Rice',
  pricePerStandardMeasurementUnit:30000,
  supplier:FoodSupplier.supplierDetails(supplierId: 1, supplierName:'Kigozi Hans',contact: "0789402190"),
  reviews:[
    Reviews(
      reviewId:10,
      dateCreated:'21/12/2019',
      reviewText:'Too good to be true',
      foodItem: FoodItem.itemDetails(foodId: 1, foodName:'Beef'),
      userId: 3,
      userName: 'Muhumuza Carol',
      rating: 5.0,
      userImagePath: "assets/images/GEDC0900.jpg"
    ),
    Reviews(
      reviewId:11,
      dateCreated:'24/03/2020',
      reviewText:'I think the vendor should minimise the delivery time',
      foodItem: FoodItem.itemDetails(foodId: 1, foodName:'Beef'),
      userId: 3,
      userName: 'Agatha Nels',
      rating: 0.5,
      userImagePath: "assets/images/GEDC0900.jpg"
    ),
    Reviews(
      reviewId:12,
      dateCreated:'4/03/2020',
      reviewText:'Everyone this guy is the best!!!',
      foodItem: FoodItem.itemDetails(foodId: 1, foodName:'Beef'),
      userId: 3,
      userName: 'Mystic',
      rating: 4.5,
      userImagePath: "assets/images/GEDC0900.jpg"
    ),
  ],
  category: Category(categoryId:1,categoryName:'Meats'),
  imagePath: "assets/images/IMG-20200325-WA0043.jpg",
  numOfItems: 10
);

final dairy1 = FoodItem(
  foodId:5,
  foodName:'Milk',
  pricePerStandardMeasurementUnit:1200,
  supplier:FoodSupplier.supplierDetails(supplierId: 2, supplierName:'Igamba Tom',contact: "0789402190"),
  reviews:[
    Reviews(
      reviewId:10,
      dateCreated:'21/12/2019',
      reviewText:'Too good to be true',
      foodItem: FoodItem.itemDetails(foodId: 1, foodName:'Beef'),
      userId: 3,
      userName: 'Muhumuza Carol',
      rating: 5.0,
      userImagePath: "assets/images/GEDC0900.jpg"
    ),
    Reviews(
      reviewId:11,
      dateCreated:'24/03/2020',
      reviewText:'I think the vendor should minimise the delivery time',
      foodItem: FoodItem.itemDetails(foodId: 1, foodName:'Beef'),
      userId: 3,
      userName: 'Agatha Nels',
      rating: 0.5,
      userImagePath: "assets/images/GEDC0900.jpg"
    ),
    Reviews(
      reviewId:12,
      dateCreated:'4/03/2020',
      reviewText:'Everyone this guy is the best!!!',
      foodItem: FoodItem.itemDetails(foodId: 1, foodName:'Beef'),
      userId: 3,
      userName: 'Mystic',
      rating: 4.5,
      userImagePath: "assets/images/GEDC0900.jpg"
    ),
  ],
  category: Category(categoryId:2,categoryName:'Dairy'),
  imagePath: "assets/images/IMG-20200325-WA0019.jpg",
  numOfItems: 10
);

final vendor1 = FoodSupplier(
  supplierId: 1,
  supplierName: "Kigozi Hans",
  profileImagePath: "assets/images/GEDC0900.jpg",
  contact: "0749501904",
  location: "Nakasero Market",
  description: "We are a fresh rib meat enterprise that believe in lorem ipsum it is what not for all.",
  foodCategories: [
    Category(
      categoryId: 1,
      categoryName: "Grains"
    ),
    Category(
      categoryId: 3,
      categoryName: "Meats"
    ),
    Category(
      categoryId: 5,
      categoryName: "Poultry"
    ),
  ],
  rating: 4.5,
  foodItems: [
    meats1,
    grains1,
    meats2
  ],
);

final vendor2 = FoodSupplier(
  supplierId: 2,
  supplierName: "Igamba Tom",
  profileImagePath: "assets/images/GEDC0900.jpg",
  contact: "0749501904",
  location: "Owino market",
  description: "We are a fresh rib meat enterprise that believe in lorem ipsum it is what not for all.",
  foodCategories: [
    Category(
      categoryId: 2,
      categoryName: "Dairy"
    ),
    Category(
      categoryId: 3,
      categoryName: "Meats"
    ),
    Category(
      categoryId: 5,
      categoryName: "Poultry"
    ),
  ],
  rating: 3.5,
  foodItems: [
    dairy1,
    grains1,
    meats2
  ],
);

final vendors = [vendor1,vendor2];

final meats = [
  meats1,
  meats2,
  meats3
];

final dairys = [dairy1];

final grains = [grains1];

final foodItems = [
  meats,
  grains,
  dairys
];