part of 'employee_bloc.dart';

@immutable
abstract class EmployeeEvent extends Equatable {
  const EmployeeEvent();
}

class LoadEmployees extends EmployeeEvent {
  final String? name;
  const LoadEmployees({
    this.name,
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
