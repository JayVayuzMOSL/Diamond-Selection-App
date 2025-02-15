import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:kgk_diamonds_group_app/core/constants/app_constants.dart';
import 'package:kgk_diamonds_group_app/core/themes/app_styles.dart';
import 'package:path_provider/path_provider.dart';

import 'application/cart/cart_cubit.dart';
import 'application/filter/filter_cubit.dart';
import 'application/result/result_cubit.dart';
import 'config/dependencies.dart';
import 'config/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize dependencies (like local storage, repositories, etc.)
  await setupDependencies();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => sl<CartCubit>()..loadCart()),
            BlocProvider(create: (_) => sl<ResultCubit>()),
            BlocProvider(create: (_) => sl<FilterCubit>()),
          ],
          child: MaterialApp(
            theme: AppTheme.lightTheme,
            themeMode: ThemeMode.system,
            scaffoldMessengerKey: scaffoldMessengerKey,
            title: 'Diamond Selection App',
            initialRoute: AppRoutes.homePage,
            onGenerateRoute: AppRoutes.generateRoute,
          ),
        );
      },
    );
  }
}
