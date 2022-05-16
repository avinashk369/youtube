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
  List<Object> get props => [message];
}

class EmployeeLoaded extends EmployeeState {
  final List<EmployeeModel> employees;
  final bool hasReachedMax;
  const EmployeeLoaded({
    required this.employees,
    this.hasReachedMax = false,
  });

// this  copy with is used to copy the state and add the new data
  EmployeeLoaded copyWith({
    List<EmployeeModel>? employees,
    bool? hasReachedMax,
  }) {
    return EmployeeLoaded(
      employees: employees ?? this.employees,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [employees, hasReachedMax];
}

class EmployeeDetailLoaded extends EmployeeState {
  @override
  final EmployeeModel employee;

  const EmployeeDetailLoaded({required this.employee});

  @override
  List<Object> get props => [employee];
}

class EmployeeCheckinsLoaded extends EmployeeState {
  @override
  final List<EmployeeCheckin> employeeCheckins;

  const EmployeeCheckinsLoaded({required this.employeeCheckins});

  @override
  List<Object> get props => [employeeCheckins];
}

class EmployeeDeleted extends EmployeeState {
  final String message;
  EmployeeDeleted({required this.message});
  @override
  List<Object> get props => [];
}
