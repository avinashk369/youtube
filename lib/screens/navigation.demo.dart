import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube/blocs/employee/employeebloc.dart';
import 'package:youtube/blocs/navigation/navigation.bloc.dart';
import 'package:youtube/models/navigation/navigation.items.dart';
import 'package:youtube/repository/employee_repositoryImpl.dart';

class NavigationDemo extends StatelessWidget {
  const NavigationDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NavigationBloc>(
          create: (context) => NavigationBloc(),
        ),
        BlocProvider<EmployeeBloc>(
          create: (context) => EmployeeBloc(
            context.read<EmployeeRepositoryImpl>(),
          )..add(
              const LoadEmployees(isSearching: false),
            ),
        ),
      ],
      child: Scaffold(
        //extendBody: true,
        body: BlocBuilder<NavigationBloc, int>(
          builder: (context, state) {
            return IndexedStack(
              index: state,
              children: [
                NavigationItems.items[0].page,
                NavigationItems.items[1].page,
              ],
            );
          },
        ),
        bottomNavigationBar: BlocBuilder<NavigationBloc, int>(
          builder: (context, state) {
            return ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(5.0),
                topRight: Radius.circular(5.0),
              ),
              child: NavigationBarTheme(
                data: NavigationBarThemeData(
                  indicatorColor: Colors.deepPurpleAccent,
                  labelTextStyle: MaterialStateProperty.all(
                    const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                ),
                child: NavigationBar(
                  backgroundColor: Colors.grey[100],
                  height: 60,
                  labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
                  selectedIndex: state,
                  animationDuration: const Duration(seconds: 1),
                  onDestinationSelected: (int index) {
                    context.read<NavigationBloc>().changeNavigation(index);
                  },
                  destinations: [
                    for (final tabItem in NavigationItems.items)
                      NavigationDestination(
                        icon: tabItem.icon,
                        label: tabItem.title,
                        selectedIcon: tabItem.selectedIcon,
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
