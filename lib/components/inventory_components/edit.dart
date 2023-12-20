import 'package:flutter/material.dart';

import '../../models/item.dart';

void showEditItemDialog(BuildContext context, Item item) {
  TextEditingController nameController = TextEditingController(text: item.name);
  TextEditingController quantityController = TextEditingController(
    text: item.quantity.toString(),
  );
  TextEditingController descriptionController =
      TextEditingController(text: item.description);
  TextEditingController categoryController = TextEditingController(
    text: item.category,
  );
  TextEditingController priceController =
      TextEditingController(text: item.price.toString());
  TextEditingController imageController = TextEditingController(
    text: item.image,
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Edit Item'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: quantityController,
              decoration: const InputDecoration(labelText: 'Quantity'),
              keyboardType: TextInputType.number,
            ),
            // description
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            // category
            TextField(
              controller: categoryController,
              decoration: const InputDecoration(labelText: 'Category'),
            ),
            // price
            TextField(
              controller: priceController,
              decoration: const InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.number,
            ),
            // image
            TextField(
              controller: imageController,
              decoration: const InputDecoration(labelText: 'Image'),
            ),
            // the following fields are not editable just display
            // dateAdded
            Text(
              'Date Added: ${item.dateAdded}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            // dateUpdated
            Text(
              'Date Updated: ${item.dateUpdated}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            // whoUpdated
            Text(
              'Who Updated: ${item.whoUpdated}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Save'),
            onPressed: () {
              Navigator.of(context).pop();
              // You might want to setState or update your list here
            },
          ),
        ],
      );
    },
  );
}
