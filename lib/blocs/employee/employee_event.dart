part of 'employee_bloc.dart';

@immutable
abstract class EmployeeEvent extends Equatable {
  const EmployeeEvent();
}

class LoadEmployees extends EmployeeEvent {
  final String? name;
  final bool isSearching;
  const LoadEmployees({
    this.name,
    this.isSearching = false,
  });
  @override
  List<Object> get props => [];
}

class LoadEmployeeDetail extends EmployeeEvent {
  final String empId;
  const LoadEmployeeDetail({
    required this.empId,
  });
  @override
  List<Object> get props => [];
}

class LoadEmployeeCheckins extends EmployeeEvent {
  final String empId;
  const LoadEmployeeCheckins({
    required this.empId,
  });
  @override
  List<Object> get props => [];
}

// delete employee
class DeleteEmployee extends EmployeeEvent {
  final EmployeeModel employeeModel;
  const DeleteEmployee({
    required this.employeeModel,
  });

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
