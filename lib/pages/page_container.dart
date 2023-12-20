import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:org_template/pages/main_pages/home_page.dart';
import 'package:org_template/pages/main_pages/inventory_page.dart';
import 'package:org_template/pages/main_pages/settings_page.dart';

import '../blocs/cubits/app_theme/theme_mode_cubit.dart';
import '../blocs/cubits/page_provider/page_provider_cubit.dart';

class PageContainer extends StatefulWidget {
  const PageContainer({super.key});

  @override
  State<PageContainer> createState() => _PageContainerState();
}

class _PageContainerState extends State<PageContainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        // background color from the theme
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        elevation: 0,

        // this title will hold the user name and the date and timeW
        title: const Text(
          'Welcome, User!',
          style: TextStyle(
            fontSize: 18,
            // color from theme
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.home),
            tooltip: 'Home Page',
            onPressed: () {
              // when the home button is pressed, the pageItem state is set to home
              context.read<PageProviderCubit>().switchPage(PageItem.home);
            },
          ),
          IconButton(
            icon: const Icon(Icons.inventory),
            tooltip: 'Inventory Page',
            onPressed: () {
              // when the inventory button is pressed, the pageItem state is set to inventory
              context.read<PageProviderCubit>().switchPage(PageItem.inventory);
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Settings Page',
            onPressed: () {
              // when the settings button is pressed, the pageItem state is set to settings
              context.read<PageProviderCubit>().switchPage(PageItem.settings);
            },
          ),
          // SWITCH BUTTON FOR TESTING ONLY : CHANGE THEME FROM LIGHT TO DARK
          IconButton(
            icon: const Icon(Icons.brightness_6),
            tooltip: 'Switch Theme',
            onPressed: () {
              // when the settings button is pressed, the pageItem state is set to settings
              context.read<ThemeModeCubit>().switchTheme();
            },
          ),
        ],
      ),
      body: SafeArea(
        child: BlocBuilder<PageProviderCubit, PageProviderState>(
          builder: (context, state) {
            // switch method checking for the current state of the pageItem provider and
            // returning the appropriate page
            switch (state.pageItem) {
              case PageItem.home:
                return const MyHomePage();
              case PageItem.inventory:
                return const InventoryPage();
              case PageItem.settings:
                return const SettingsPage();
              default:
                return const Placeholder();
            }
          },
        ),
      ),
    );
  }
}
