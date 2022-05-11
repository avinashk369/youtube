import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube/models/employee/employee_model.dart';
import 'package:youtube/repository/employee_repositoryImpl.dart';
import 'package:youtube/screens/employee/employee_checkin_card.dart';
import 'package:youtube/screens/loading_ui.dart';
import 'package:youtube/styles/styles.dart';
import 'package:youtube/utils/theme_constants.dart';

import '../../blocs/employee/employeebloc.dart';

class EmployeeDetail extends StatefulWidget {
  const EmployeeDetail({Key? key, required this.employeeModel})
      : super(key: key);
  final EmployeeModel employeeModel;

  @override
  State<EmployeeDetail> createState() => _EmployeeDetailState();
}

class _EmployeeDetailState extends State<EmployeeDetail> {
  late ScrollController _controller;
  bool silverCollapsed = false;
  String myTitle = "";
  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(() {
      if (_controller.offset > MediaQuery.of(context).size.height * .2 &&
          !_controller.position.outOfRange) {
        if (!silverCollapsed) {
          setState(() {
            myTitle = widget.employeeModel.name!;
            silverCollapsed = true;
          });
        }
      }
      if (_controller.offset <= MediaQuery.of(context).size.height * .2 &&
          !_controller.position.outOfRange) {
        if (silverCollapsed) {
          setState(() {
            myTitle = "";
            silverCollapsed = false;
          });
        }
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EmployeeBloc(context.read<EmployeeRepositoryImpl>())
        ..add(LoadEmployeeCheckins(empId: widget.employeeModel.id!)),
      child: Scaffold(
        body: CustomScrollView(
          controller: _controller,
          slivers: [
            SliverAppBar(
              expandedHeight: MediaQuery.of(context).size.height * .28,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  myTitle,
                  style: kLabelStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
                collapseMode: CollapseMode.pin,
                background: CachedNetworkImage(
                  imageUrl: widget.employeeModel.avatar!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      widget.employeeModel.name!,
                      style: kLabelStyleBold.copyWith(
                        fontSize: 22,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Employee checkins",
                      style: kLabelStyleBold.copyWith(
                        color: primaryLight,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  BlocBuilder<EmployeeBloc, EmployeeState>(
                      builder: (context, state) {
                    if (state is EmployeeLoading) return LoadingUI();
                    if (state is EmployeeError) return Text(state.message);
                    if (state is EmployeeCheckinsLoaded) {
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) => EmployeeCheckinCard(
                                employeeCheckin: state.employeeCheckins[index],
                              ),
                          itemCount: state.employeeCheckins.length);
                    }
                    return const SizedBox.shrink();
                  }),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      "More data can be displayed here as per the requirements",
                      style: kLabelStyleBold.copyWith(
                        color: primaryLight,
                        fontSize: 12,
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
