part of 'employee_bloc.dart';

@immutable
abstract class EmployeeEvent extends Equatable {
  const EmployeeEvent();
}

class LoadEmployees extends EmployeeEvent {
  const LoadEmployees();
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
