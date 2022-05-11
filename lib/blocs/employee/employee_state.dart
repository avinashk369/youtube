part of 'employee_bloc.dart';

@immutable
abstract class EmployeeState extends Equatable {
  const EmployeeState();
}

class EmployeeInitializing extends EmployeeState {
  @override
  List<Object> get props => [];
}

class EmployeeLoading extends EmployeeState {
  @override
  List<Object> get props => [];
}

class Loading extends EmployeeState {
  final List<EmployeeModel> employees;
  const Loading({
   required this.employees,
  });
  @override
  List<Object> get props => [];
}

class EmployeeError extends EmployeeState {
  String message;
  EmployeeError({required this.message});
  @override
  // TODO: implement props
  List<Object> get props => [message];
}

class EmployeeLoaded extends EmployeeState {
  @override
  // TODO: implement props
  final List<EmployeeModel> employees;

  const EmployeeLoaded({required this.employees});

  @override
  // TODO: implement props
  List<Object> get props => [employees];
}

class EmployeeDetailLoaded extends EmployeeState {
  @override
  // TODO: implement props
  final EmployeeModel employee;

  const EmployeeDetailLoaded({required this.employee});

  @override
  // TODO: implement props
  List<Object> get props => [employee];
}

class EmployeeCheckinsLoaded extends EmployeeState {
  @override
  // TODO: implement props
  final List<EmployeeCheckin> employeeCheckins;

  const EmployeeCheckinsLoaded({required this.employeeCheckins});

  @override
  // TODO: implement props
  List<Object> get props => [employeeCheckins];
}
