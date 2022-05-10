import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube/blocs/employee/employeebloc.dart';
import 'package:youtube/routes/route_constants.dart';
import 'package:youtube/screens/employee/employee_card.dart';
import 'package:youtube/screens/loading_ui.dart';
import 'package:youtube/styles/styles.dart';
import 'package:youtube/utils/theme_constants.dart';

import 'custom_appbar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Home',
      ),
      //added floating action button to apply filter
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryLight,
        onPressed: () {},
        child: const Icon(
          Icons.filter_list,
          color: secondaryLight,
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                BlocBuilder<EmployeeBloc, EmployeeState>(
                  builder: (context, state) {
                    if (state is EmployeeLoaded) {
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => EmployeeCard(
                                employeeModel: state.employees[index],
                                onTap: (employeeModel) {
                                  Navigator.of(context).pushNamed(empDetail,
                                      arguments: employeeModel);
                                },
                              ),
                          itemCount: state.employees.length);
                    }
                    if (state is EmployeeLoading) {
                      return LoadingUI();
                    }
                    if (state is EmployeeError) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          state.message,
                          style: kLabelStyleBold.copyWith(color: redColor),
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
