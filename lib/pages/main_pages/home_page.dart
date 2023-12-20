import 'package:flutter/material.dart';
import 'package:org_template/components/home_components/recently_updated.dart';
import 'package:org_template/components/home_components/running_low.dart';
import 'package:org_template/components/home_components/stats_one.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color from theme
      color: Theme.of(context).colorScheme.background,
      child: const Column(
        children: [
          // empty space to make up for the appbar

          // three flexible rows with containers inside displaying the recently updated items and other various information
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 2,
                child: RecentlyUpdated(),
              ),
              Flexible(
                flex: 2,
                child: RunningLow(),
              ),
              Flexible(
                flex: 2,
                child: InventoryStatistics(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
