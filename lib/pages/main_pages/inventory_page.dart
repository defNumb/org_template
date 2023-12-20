import 'package:flutter/material.dart';
import 'package:org_template/components/inventory_components/inventory_list.dart';

class InventoryPage extends StatefulWidget {
  const InventoryPage({super.key});

  @override
  State<InventoryPage> createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: Center(
        child: Row(
          children: <Widget>[
            // First Column - Buttons
            Expanded(
              flex: 1,
              child: Column(
                children: <Widget>[
                  // Add your buttons here
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Button 1'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Button 2'),
                  ),
                  // Add more buttons as needed
                ],
              ),
            ),
            // Second Column - Container with Search and List
            Expanded(
              flex: 4,
              child: Column(
                children: <Widget>[
                  // Title
                  const Text(
                    'Inventory',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 0,
                        color: Theme.of(context).canvasColor,
                        child: Column(
                          children: [
                            /*  SEARCH BOX */
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: 600,
                                child: TextField(
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Theme.of(context).brightness ==
                                            Brightness.light
                                        ? Colors.white
                                        : Theme.of(context).canvasColor,
                                    labelText: 'Search',
                                    border: const OutlineInputBorder(),
                                  ),
                                ),
                              ),
                            ),
                            // ROW with titles for the inventory list like: Item, Quantity, Price, etc.
                            IntrinsicHeight(
                              child: Card(
                                elevation: 0,
                                color: Theme.of(context).primaryColor,
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        'Item Name',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          height: 3,
                                        ),
                                      ),
                                    ),
                                    VerticalDivider(
                                      color: Colors.grey,
                                      thickness: 1,
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        'Quantity',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          height: 3,
                                        ),
                                      ),
                                    ),
                                    VerticalDivider(
                                      color: Colors.grey,
                                      thickness: 1,
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Price',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            height: 3),
                                      ),
                                    ),
                                    VerticalDivider(
                                      color: Colors.grey,
                                      thickness: 1,
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Total',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          height: 3,
                                        ),
                                      ),
                                    ),
                                    VerticalDivider(
                                      color: Colors.grey,
                                      thickness: 1,
                                      indent: 10,
                                      endIndent: 10,
                                    ),
                                    // empty space for the edit and delete buttons
                                    Expanded(
                                      child: SizedBox(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const ItemListView(),
                            // LIST
                          ],
                        ),
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
  }
}
