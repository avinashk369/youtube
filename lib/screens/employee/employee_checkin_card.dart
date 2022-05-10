import 'package:flutter/material.dart';
import 'package:youtube/models/employee/employee_checkin.dart';
import 'package:youtube/styles/styles.dart';

class EmployeeCheckinCard extends StatelessWidget {
  const EmployeeCheckinCard({Key? key, required this.employeeCheckin})
      : super(key: key);
  final EmployeeCheckin employeeCheckin;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[50],
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 5,
            ),
            Text(
              employeeCheckin.purpose!,
              style: kLabelStyleBold,
            ),
            const SizedBox(
              height: 5,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Location: ',
                    style: kLabelStyleBold,
                  ),
                  TextSpan(
                    text: employeeCheckin.location!,
                    style: kLabelStyle,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(employeeCheckin.checkin!.substring(0, 10)),
          ],
        ),
      ),
    );
  }
}
