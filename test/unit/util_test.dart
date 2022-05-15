import 'package:flutter_test/flutter_test.dart';
import 'package:youtube/utils/utility.dart';

void main() {
  group('Utility functions', () {
    test('Get elapsed hour', () {
      //takes param in seconds and calculate the diff. and return the hour
      int diffHr = Utility.elapsedHr(4200, 600);
      expect(diffHr, 1);
    });

    // test('Get date time from string date', () {
    //   DateTime genDate =
    //       Utility.generateDateTimeFromString("2021-05-24 13:05:33 AM");
    //   expect(genDate, DateTime(2021, 05, 24, 13, 05, 33, 000));
    // });

    test('Get duration in HMS string', () {
      String dateTimeVal =
          Utility.printDurationHMS(const Duration(seconds: 121));
      expect(dateTimeVal, "00h:02m:01s");
    });

    test("Get duration in HM string", () {
      String hmString = Utility.printDurationHM(const Duration(seconds: 121));
      expect(hmString, "00h:02m");
    });
  });
}
