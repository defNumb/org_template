import 'package:flutter/material.dart';
import '../../utils/const.dart';

class RunningLow extends StatefulWidget {
  const RunningLow({super.key});

  @override
  State<RunningLow> createState() => _RunningLowState();
}

class _RunningLowState extends State<RunningLow> {
  bool isScrolled = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        constraints: const BoxConstraints(
          maxHeight: 300,
          maxWidth: 400,
          minHeight: 300,
          minWidth: 300,
        ),
        height: deviceHeight(context) * 0.3,
        width: deviceWidth(context) * 0.3,
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.grey
                  : Colors.transparent,
              spreadRadius: 0,
              blurRadius: 3,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Title container with conditional shadow
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                boxShadow: isScrolled
                    ? [
                        BoxShadow(
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.transparent
                                  : Colors.black,
                          spreadRadius: 0,
                          blurRadius: 3,
                          offset: const Offset(0, 2),
                        ),
                      ]
                    : [],
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(10)),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Running Low',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'See All',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            // Listview with NotificationListener
            Expanded(
              child: NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification notification) {
                  if (notification.metrics.pixels > 0 && !isScrolled) {
                    setState(() {
                      isScrolled = true;
                    });
                  } else if (notification.metrics.pixels <= 0 && isScrolled) {
                    setState(() {
                      isScrolled = false;
                    });
                  }
                  return true;
                },
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.only(top: index == 0 ? 10 : 0.0),
                      child: ListTile(
                        leading: const Icon(
                          Icons.inventory,
                        ),
                        title: Text(
                          'Item Name $index',
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        subtitle: const Text(
                          'Item Description',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
