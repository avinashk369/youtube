import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:youtube/models/employee/employee_model.dart';
import 'package:youtube/styles/styles.dart';

class EmployeeCard extends StatelessWidget {
  const EmployeeCard(
      {Key? key,
      required this.employeeModel,
      required this.onTap,
      required this.onDelete})
      : super(key: key);
  final EmployeeModel employeeModel;
  final Function(EmployeeModel employeeModel) onTap;
  final Function(EmployeeModel employeeModel) onDelete;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(employeeModel),
      child: Card(
        color: Colors.grey[50],
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 70,
                width: 70,
                child: Card(
                  elevation: 0,
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: employeeModel.avatar!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      employeeModel.name!,
                      style: kLabelStyleBold,
                    ),
                    Text(employeeModel.email!),
                    Text(employeeModel.phone!),
                  ],
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              IconButton(
                onPressed: () => onDelete(employeeModel),
                icon: const Icon(Icons.delete),
              )
            ],
          ),
        ),
      ),
    );
  }
}
