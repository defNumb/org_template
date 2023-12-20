import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:org_template/pages/landing_page.dart';
import 'package:path_provider/path_provider.dart';
import 'blocs/blocs/authentication/authentication_bloc.dart';
import 'blocs/cubits/app_theme/theme_mode_cubit.dart';
import 'blocs/cubits/page_provider/page_provider_cubit.dart';
import 'services/authentication.dart';
import 'utils/const.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
// Open the database and store the reference.
  await Hive.initFlutter();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        // authentication repository
        RepositoryProvider<AuthenticationService>(
          create: (BuildContext context) => AuthenticationService(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          // Page provider cubit
          BlocProvider<PageProviderCubit>(
            create: (BuildContext context) => PageProviderCubit(),
          ),
          // theme mode cubit
          BlocProvider<ThemeModeCubit>(
            create: (BuildContext context) => ThemeModeCubit(),
          ),
          // authentication bloc
          BlocProvider<AuthenticationBloc>(
            create: (BuildContext context) =>
                AuthenticationBloc(context.read<AuthenticationService>()),
          ),
        ],
        child: BlocBuilder<ThemeModeCubit, ThemeModeState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: context.watch<ThemeModeCubit>().state.themeModeState,
              title: 'Inventory System Template',
              home: const LandingPage(),
            );
          },
        ),
      ),
    );
  }
}
