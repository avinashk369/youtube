import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:youtube/models/ServerError.dart';
import 'package:youtube/models/employee/employee_checkin.dart';
import 'package:youtube/models/employee/employee_model.dart';
import 'package:youtube/repository/employee_repositoryImpl.dart';
part 'employee_event.dart';
part 'employee_state.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  final EmployeeRepositoryImpl _employeeRepositoryImpl;

  EmployeeBloc(this._employeeRepositoryImpl) : super(EmployeeInitializing()) {
    on<LoadEmployees>((event, emit) => _loadEmployees(event, emit));
    on<LoadEmployeeDetail>((event, emit) => _loadEmployeeDetail(event, emit));
    on<LoadEmployeeCheckins>(
        (event, emit) => _loadEmployeeCheckins(event, emit));
  }
  int page = 1;
  // load employee checkins
  Future _loadEmployeeCheckins(
      LoadEmployeeCheckins event, Emitter<EmployeeState> emit) async {
    try {
      emit(EmployeeLoading());
      List<EmployeeCheckin> employeeCheckins =
          await _employeeRepositoryImpl.loadEmployeeCheckins(event.empId);
      emit(
        EmployeeCheckinsLoaded(employeeCheckins: employeeCheckins),
      );
    } on ServerError catch (e) {
      emit(EmployeeError(message: e.getErrorMessage()));
    } catch (e) {
      emit(EmployeeError(message: e.toString()));
    }
  }

  //load employees
  Future _loadEmployees(
      LoadEmployees event, Emitter<EmployeeState> emit) async {
    try {
      final state = this.state;
      if (state is EmployeeInitializing) {
        List<EmployeeModel> employees =
            await _employeeRepositoryImpl.loadEmployees(page, 10, event.name);
        emit(EmployeeLoaded(employees: employees));
      }
      if (state is EmployeeLoaded) {
        List<EmployeeModel> employees =
            await _employeeRepositoryImpl.loadEmployees(page++, 10, event.name);
        emit(EmployeeLoaded(employees: state.employees + employees));
      }
    } on ServerError catch (e) {
      emit(EmployeeError(message: e.getErrorMessage()));
    } catch (e) {
      emit(EmployeeError(message: e.toString()));
    }
  }

  //load employee detail
  Future _loadEmployeeDetail(
      LoadEmployeeDetail event, Emitter<EmployeeState> emit) async {
    emit(EmployeeLoading());
    try {
      EmployeeModel employeeModel =
          await _employeeRepositoryImpl.loadEmployeeDetail(event.empId);

      emit(EmployeeDetailLoaded(employee: employeeModel));
    } on ServerError catch (e) {
      emit(EmployeeError(message: e.getErrorMessage()));
    } catch (e) {
      emit(EmployeeError(message: e.toString()));
    }
  }
}
