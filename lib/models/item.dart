import 'package:hive/hive.dart';
part 'item.g.dart';

/* 
CLASS DESCRIPTION: 

*/
@HiveType(typeId: 0)
class Item extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final String category;
  @HiveField(4)
  final String quantity;
  @HiveField(5)
  final String price;
  @HiveField(6)
  final String? image;
  @HiveField(7)
  final String dateAdded;
  @HiveField(8)
  final String dateUpdated;
  @HiveField(9)
  final String whoUpdated;
  Item({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.quantity,
    required this.price,
    this.image,
    required this.dateAdded,
    required this.dateUpdated,
    required this.whoUpdated,
  });

  // FACTORY METHODS
  //Initial Item
  factory Item.initial() {
    return Item(
      id: 0,
      name: '',
      description: '',
      category: '',
      quantity: '',
      price: '',
      image: '',
      dateAdded: '',
      dateUpdated: '',
      whoUpdated: '',
    );
  }

  // COMODITY SETTINGS
  bool get stringify => true;
}
