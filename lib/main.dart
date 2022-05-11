import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube/repository/employee_repositoryImpl.dart';
import 'package:youtube/utils/utils.dart';

import 'routes/route_constants.dart';
import 'routes/route_generator.dart';
import 'styles/custom_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Paint.enableDithering = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => EmployeeRepositoryImpl(),
        ),
      ],
      child: MaterialApp(
        title: appName,
        initialRoute: homeRoute,
        onGenerateRoute: RouteGenerator.generateRoute,
        debugShowCheckedModeBanner: false,
        theme: CustomTheme.lightTheme,
      ),
    );
  }
}
