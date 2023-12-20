import 'package:flutter/material.dart';

import '../../models/item.dart';
import 'edit.dart';

class ItemListView extends StatefulWidget {
  const ItemListView({super.key});

  @override
  State<ItemListView> createState() => _ItemListViewState();
}

class _ItemListViewState extends State<ItemListView> {
  // TEST LIST
  List<Item> items = [
    Item(
      id: 1,
      name: 'Item 1',
      description: 'This is item 1',
      category: 'Category 1',
      quantity: '1',
      price: '1.00',
      image: '',
      dateAdded: '1/1/2021',
      dateUpdated: '1/1/2021',
      whoUpdated: 'User 1',
    ),
    Item(
      id: 2,
      name: 'Item 2',
      description: 'This is item 2',
      category: 'Category 2',
      quantity: '2',
      price: '2.00',
      image: '',
      dateAdded: '2/2/2021',
      dateUpdated: '2/2/2021',
      whoUpdated: 'User 2',
    ),
    Item(
      id: 3,
      name: 'Item 3',
      description: 'This is item 3',
      category: 'Category 3',
      quantity: '3',
      price: '3.00',
      image: '',
      dateAdded: '3/3/2021',
      dateUpdated: '3/3/2021',
      whoUpdated: 'User 3',
    ),
    Item(
      id: 4,
      name: 'Item 4',
      description: 'This is item 4',
      category: 'Category 4',
      quantity: '4',
      price: '4.00',
      image: '',
      dateAdded: '4/4/2021',
      dateUpdated: '4/4/2021',
      whoUpdated: 'User 4',
    ),
    Item(
      id: 6,
      name: 'Item 5',
      description: 'This is item 5',
      category: 'Category 5',
      quantity: '5',
      price: '5.00',
      image: '',
      dateAdded: '5/5/2021',
      dateUpdated: '5/5/2021',
      whoUpdated: 'User 5',
    ),
    Item(
      id: 7,
      name: 'Item 6',
      description: 'This is item 6',
      category: 'Category 6',
      quantity: '6',
      price: '6.00',
      image: '',
      dateAdded: '6/6/2021',
      dateUpdated: '6/6/2021',
      whoUpdated: 'User 6',
    ),
    Item(
      id: 8,
      name: 'Item 7',
      description: 'This is item 7',
      category: 'Category 7',
      quantity: '7',
      price: '7.00',
      image: '',
      dateAdded: '7/7/2021',
      dateUpdated: '7/7/2021',
      whoUpdated: 'User 7',
    ),
  ];
  // END TEST LIST

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        itemCount: items.length, // Number of items in your list
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey.withOpacity(0.3)),
              ),
            ),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      items[index].name,
                      style: const TextStyle(
                        height: 2,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const VerticalDivider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                  Expanded(
                    child: Text(
                      items[index].quantity,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const VerticalDivider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                  Expanded(
                    child: Text(
                      items[index].price,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const VerticalDivider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                  const Expanded(
                    child: Text(
                      'Total',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const VerticalDivider(
                    color: Colors.grey,
                    thickness: 1,
                    indent: 10,
                    endIndent: 10,
                  ),
                  // at the end of each row, add a button to edit, delete, etc.
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Tooltip(
                          message: 'Edit',
                          child: IconButton(
                            onPressed: () {
                              showEditItemDialog(context, items[index]);
                            },
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        Tooltip(
                          message: 'Delete',
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
