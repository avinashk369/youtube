import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube/blocs/employee/employeebloc.dart';
import 'package:youtube/routes/route_constants.dart';
import 'package:youtube/screens/employee/employee_card.dart';
import 'package:youtube/screens/loading_ui.dart';
import 'package:youtube/styles/styles.dart';
import 'package:youtube/utils/theme_constants.dart';

import 'custom_appbar.dart';
import 'custom_input.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late ScrollController scrollController;

  bool isSearching = false;
  bool reachedEnd = false;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (isScrollAtBottom() && !reachedEnd) {
      context.read<EmployeeBloc>().add(const LoadEmployees(isSearching: false));
    }
  }

  bool isScrollAtBottom() {
    if (scrollController.position.atEdge) {
      return scrollController.position.pixels != 0;
    }
    return false;
  }

  @override
  void dispose() {
    scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //added floating action button to apply filter
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryLight,
        onPressed: () {},
        child: const Icon(
          Icons.filter_list,
          color: secondaryLight,
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          controller: scrollController,
          slivers: [
            SliverAppBar(
              expandedHeight: kToolbarHeight * 2,
              automaticallyImplyLeading: false,
              floating: true,
              pinned: true,
              snap: false,
              elevation: 0,
              bottom: SearchBar(
                onSearch: ((searchText) {
                  isSearching = true;
                  context.read<EmployeeBloc>().add(
                        LoadEmployees(
                          name: searchText.trim(),
                          isSearching: isSearching,
                        ),
                      );
                }),
              ),
              flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Column(
                    children: const [
                      CustomAppBar(
                        title: 'Home',
                      ),
                    ],
                  )),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  BlocBuilder<EmployeeBloc, EmployeeState>(
                    builder: (context, state) {
                      if (state is EmployeeLoaded) {
                        reachedEnd = state.hasReachedMax;
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return index >= state.employees.length
                                ? const LoadingUI()
                                : EmployeeCard(
                                    employeeModel: state.employees[index],
                                    onTap: (employeeModel) {
                                      Navigator.of(context).pushNamed(empDetail,
                                          arguments: employeeModel);
                                    },
                                  );
                          },
                          itemCount: state.employees.length +
                              (state.hasReachedMax ? 0 : 1),
                        );
                      }
                      if (state is EmployeeInitializing) {
                        return const LoadingUI();
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
      ),
    );
  }
}

class SearchBar extends StatelessWidget implements PreferredSizeWidget {
  final Function(String searchText) onSearch;
  const SearchBar({
    Key? key,
    required this.onSearch,
  })  : preferredSize = const Size.fromHeight(kAppBarHeight),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    TextEditingController search = TextEditingController();
    return Container(
      height: kToolbarHeight,
      color: Colors.white,
      child: Builder(builder: (context) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: CustomInput(
                  textController: search,
                  hintText: 'Search Employee',
                  onChanged: (v) {},
                ),
              ),
            ),
            InkWell(
              onTap: () => search.text.isEmpty ? null : onSearch(search.text),
              child: Container(
                width: 48,
                height: 48,
                margin: const EdgeInsets.only(right: 5),
                decoration: BoxDecoration(
                  color: primaryLight,
                  borderRadius: BorderRadius.circular(3),
                ),
                child: const Icon(
                  Icons.search,
                  color: secondaryLight,
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  @override
  final Size preferredSize;
}
