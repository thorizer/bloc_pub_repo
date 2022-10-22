import 'package:flutter/material.dart';
//import 'package:logger/logger.dart';

const kPrimaryColor = Color.fromARGB(255, 85, 141, 180);
const kDisabledColor = Color.fromARGB(255, 170, 170, 170);
const kBackgroundColor = Color(0XFFE5E5E5);
Color getColor(String status) {
  if (status == 'drive') {
    return Colors.green;
  } else if (status == 'stop') {
    return Colors.red;
  } else {
    return Colors.yellow;
  }
}

/* final logger = Logger(
        printer: PrettyPrinter(
        methodCount: 0,
        errorMethodCount: 5,
        lineLength: 50,
        colors: true,
        printEmojis: true,
        printTime: true,
 )); */

const Map<String, Color> assetColor = {
  'drive': Colors.green,
  'idle': Colors.yellow,
  'stop': Colors.red,
  'disabled': Colors.grey,
};

class TcfleetTheme {
  static const Color primaryColor = Color.fromARGB(255, 0, 121, 227);
  static const Color secondaryColor = Color.fromARGB(255, 51, 137, 182);
  static const Color color_01 = Color.fromARGB(160, 18, 71, 78);
  static const Color color_02 = Color.fromARGB(255, 61, 154, 230);
  static const Color color_03 = Color.fromARGB(255, 0, 118, 255);
  static const Color color_04 = Color.fromARGB(255, 0, 121, 226);
  static const Color color_05 = Color.fromARGB(255, 0, 101, 255);
  static const Color color_06 = Color.fromARGB(255, 0, 95, 225);
  static const Color color_07 = Color.fromARGB(255, 75, 97, 121);
  static const Color color_08 = Color.fromARGB(255, 75, 97, 121);
  static const Color color_09 = Color.fromARGB(255, 70, 89, 145);
  static const Color color_10 = Color.fromARGB(255, 51, 65, 106);
  static const Color color_11 = Color.fromARGB(255, 52, 66, 107);
  static const Color color_12 = Color.fromARGB(255, 52, 66, 107);
  static const Color color_13 = Color.fromARGB(255, 72, 72, 72);
  static const Color color_14 = Color.fromARGB(255, 33, 43, 54);
  static const Color color_15 = Color.fromARGB(255, 28, 36, 45);
  static const Color color_16 = Color.fromARGB(255, 33, 42, 68);
  static const Color color_17 = Color.fromARGB(255, 34, 43, 69);
  static const Color reactForground = Color.fromARGB(255, 33, 43, 54);
  static const Color reactBackground = Color.fromARGB(255, 22, 28, 36);
}

class ColorThemeMatch {
  //match1
  static const Color m1_01 = Color.fromARGB(255, 46, 53, 98);
  static const Color m1_02 = Color.fromARGB(255, 163, 134, 237);
  //match2
  static const Color m2_01 = Color.fromARGB(255, 37, 44, 75);
  static const Color m2_02 = Color.fromARGB(255, 50, 63, 120);
  static const Color m2_03 = Color.fromARGB(255, 116, 129, 255);
  //match3
  static const Color m3_00 = Color.fromARGB(255, 35, 58, 90);
  static const Color m3_01 = Color.fromARGB(255, 36, 69, 116);
  static const Color m3_02 = Color.fromARGB(255, 28, 46, 73);
  static const Color m3_03 = Color.fromARGB(255, 64, 94, 248);
  static const Color m3_04 = Color.fromARGB(255, 61, 90, 240);
  static const Color m3_05 = Color.fromARGB(255, 84, 109, 242);
  static const Color m3_06 = Color.fromARGB(255, 97, 120, 241);
  //match4
  static const Color m4_01 = Color.fromARGB(255, 116, 118, 129);
  static const Color m4_02 = Color.fromARGB(255, 44, 50, 57);
  static const Color m4_03 = Color.fromARGB(255, 51, 61, 71);
  //match5
  static const Color m5_00 = Color.fromARGB(255, 213, 200, 189);
  static const Color m5_01 = Color.fromARGB(255, 245, 243, 242);
  static const Color m5_02 = Color.fromARGB(255, 191, 188, 182);
  static const Color m5_03 = Color.fromARGB(255, 130, 116, 108);
  //match6
  static const Color m6_01 = Color.fromARGB(255, 68, 31, 117);
  static const Color m6_02 = Color.fromARGB(255, 84, 40, 137);
  static const Color m6_03 = Color.fromARGB(255, 35, 11, 72);
  static const Color m6_04 = Color.fromARGB(255, 48, 18, 88);
  static const Color m6_05 = Color.fromARGB(255, 83, 40, 134);
  static const Color m6_06 = Color.fromARGB(255, 254, 173, 96);
  static const Color m6_07 = Color.fromARGB(255, 81, 67, 123);
  //match7
  static const Color m7_01 = Color.fromARGB(255, 49, 58, 63);
  static const Color m7_02 = Color.fromARGB(255, 21, 26, 32);
  static const Color m7_03 = Color.fromARGB(255, 60, 153, 231);
  static const Color m7_04 = Color.fromARGB(255, 52, 74, 115);
  static const Color m7_05 = Color.fromARGB(255, 40, 49, 64);
  static const Color m7_06 = Color.fromARGB(255, 72, 97, 241);
  static const Color m7_07 = Color.fromARGB(26, 255, 255, 255);
  static const Color m7_08 = Color.fromARGB(255, 141, 197, 247);
  static const Color m7_09 = Colors.blueAccent;
  static const Color m7_10 = Color.fromARGB(255, 130, 182, 33);
  static const Color m7_11 = Color.fromARGB(78, 140, 192, 42);
  static const Color m7_12 = Color.fromARGB(255, 252, 198, 16);
  static const Color m7_13 = Color.fromARGB(62, 238, 225, 49);
  static const Color m7_14 = Color.fromARGB(255, 239, 61, 7);
  static const Color m7_15 = Color.fromARGB(52, 255, 99, 52);
  static const Color m7_16 = Color.fromARGB(255, 154, 154, 154);
  static const Color m7_17 = Color.fromARGB(52, 255, 255, 255);
  static const Color m7_18 = Color.fromARGB(255, 175, 241, 52);
  static const Color m7_19 = Color.fromARGB(255, 255, 225, 52);
  //match8
  static const Color m8_01 = Color.fromARGB(255, 16, 20, 30);
  static const Color m8_02 = Color.fromARGB(255, 34, 37, 47);
  static const Color m8_03 = Color.fromARGB(146, 64, 63, 65);
  static const Color m8_04 = Color.fromARGB(108, 4, 24, 48);
  static const Color m8_05 = Color.fromARGB(47, 119, 246, 255);
  //sensors background
  static const Color m9_01 = Color.fromARGB(221, 184, 252, 248);
  static const Color m9_02 = Color.fromARGB(106, 145, 144, 123);
  static const Color m9_03 = Color.fromARGB(62, 238, 225, 49);
  static const Color m9_04 = Color.fromARGB(106, 255, 183, 88);
  static const Color m9_05 = Color.fromARGB(220, 189, 237, 250);
  static const Color m9_06 = Color.fromARGB(171, 125, 177, 30);
  static const Color m9_07 = Color.fromARGB(255, 219, 223, 233);
  static const Color m9_08 = Color.fromARGB(110, 255, 99, 52);
  static const Color m9_09 = Color.fromARGB(192, 95, 196, 243);
  static const Color m9_10 = Color.fromARGB(255, 160, 152, 128);
  static const Color m9_11 = Color.fromARGB(197, 202, 179, 207);
  static const Color m9_12 = Color.fromARGB(197, 210, 248, 210);
  static const Color m9_13 = Color.fromARGB(155, 247, 245, 161);
  static const Color m9_14 = Color.fromARGB(204, 255, 255, 255);
  static const Color m9_15 = Color.fromARGB(255, 255, 255, 255);
  static const Color m9_16 = Color.fromARGB(255, 255, 254, 220);
  // sensor foreground
  static const Color m10_01 = Color.fromARGB(255, 7, 126, 126);
  static const Color m10_02 = Color.fromARGB(106, 94, 93, 87);
  static const Color m10_03 = Color.fromARGB(75, 238, 225, 49);
  static const Color m10_04 = Color.fromARGB(206, 219, 138, 72);
  static const Color m10_05 = Color.fromARGB(255, 54, 153, 199);
  static const Color m10_06 = Color.fromARGB(62, 19, 80, 80);
  static const Color m10_07 = Color.fromARGB(255, 55, 106, 182);
  static const Color m10_08 = Color.fromARGB(118, 228, 57, 5);
  static const Color m10_09 = Color.fromARGB(95, 13, 78, 109);
  static const Color m10_10 = Color.fromARGB(255, 66, 59, 50);
  static const Color m10_11 = Color.fromARGB(255, 144, 47, 189);
  static const Color m10_12 = Color.fromARGB(255, 39, 133, 16);
  static const Color m10_13 = Color.fromARGB(255, 145, 133, 32);
  static const Color m10_14 = Color.fromARGB(255, 49, 147, 212);
  static const Color m10_15 = Color.fromARGB(255, 100, 99, 92);
  static const Color m10_16 = Color.fromARGB(255, 253, 228, 0);
  // sensor text color
  static const Color m11_01 = Color.fromARGB(255, 255, 255, 255);
  static const Color m11_02 = Color.fromARGB(255, 160, 255, 82);
  static const Color m11_03 = Color.fromARGB(255, 255, 242, 129);
  static const Color m11_04 = Color.fromARGB(255, 255, 255, 255);
  static const Color m11_05 = Color.fromARGB(255, 255, 255, 255);
  static const Color m11_06 = Color.fromARGB(255, 255, 223, 79);
  static const Color m11_07 = Color.fromARGB(255, 255, 255, 255);
  static const Color m11_08 = Color.fromARGB(255, 255, 255, 255);
  static const Color m11_09 = Color.fromARGB(255, 255, 255, 255);
  static const Color m11_10 = Color.fromARGB(255, 212, 197, 152);
  static const Color m11_11 = Color.fromARGB(255, 255, 255, 255);
  static const Color m11_12 = Color.fromARGB(255, 255, 255, 255);
  static const Color m11_13 = Color.fromARGB(255, 252, 233, 159);
  static const Color m11_14 = Color.fromARGB(255, 254, 255, 255);
  static const Color m11_15 = Color.fromARGB(255, 245, 232, 180);
  static const Color m11_16 = Color.fromARGB(255, 0, 0, 0);
  // sensor border color
  static const Color m12_01 = Color.fromARGB(255, 2, 0, 124);
  static const Color m12_02 = Color.fromARGB(78, 140, 192, 42);
  static const Color m12_03 = Color.fromARGB(78, 140, 192, 42);
  static const Color m12_04 = Color.fromARGB(255, 128, 40, 0);
  static const Color m12_05 = Color.fromARGB(255, 54, 153, 199);
  static const Color m12_06 = Color.fromARGB(129, 32, 46, 7);
  static const Color m12_07 = Color.fromARGB(255, 0, 39, 124);
  static const Color m12_08 = Color.fromARGB(78, 140, 192, 42);
  static const Color m12_09 = Color.fromARGB(78, 140, 192, 42);
  static const Color m12_10 = Color.fromARGB(255, 36, 31, 15);
  static const Color m12_11 = Color.fromARGB(255, 63, 0, 88);
  static const Color m12_12 = Color.fromARGB(255, 0, 61, 3);
  static const Color m12_13 = Color.fromARGB(255, 133, 99, 27);
  static const Color m12_14 = Color.fromARGB(78, 140, 192, 42);
  static const Color m12_15 = Color.fromARGB(255, 197, 189, 174);
  static const Color m12_16 = Color.fromARGB(255, 150, 140, 0);
}

enum SensorEnum {
  engineTemp(
      orderIndex: 2,
      family: 'analogic',
      name: '',
      altName: 'ENGINE_TEMP',
      iconName: 'assets/images/sensors/enginetemp.png',
      background: ColorThemeMatch.m9_01,
      foreground: ColorThemeMatch.m10_01,
      textColor: ColorThemeMatch.m11_01,
      borderColor: ColorThemeMatch.m12_01,
      sensorHeight: 40,
      backTextColor: false),
  fuelLevel(
      orderIndex: 3,
      family: 'analogic',
      name: 'fuelLevel',
      altName: 'FUEL_LEVEL',
      iconName: 'assets/images/sensors/fuellevel.png',
      background: ColorThemeMatch.m9_02,
      foreground: ColorThemeMatch.m10_02,
      textColor: ColorThemeMatch.m11_02,
      borderColor: ColorThemeMatch.m12_02,
      sensorHeight: 38,
      backTextColor: true),
  fuelUsed(
      orderIndex: 4,
      family: 'analogic',
      name: 'fuelUsed',
      altName: 'FUEL_USED',
      iconName: 'assets/images/sensors/fuelused.png',
      background: ColorThemeMatch.m9_03,
      foreground: ColorThemeMatch.m10_03,
      textColor: ColorThemeMatch.m11_03,
      borderColor: ColorThemeMatch.m12_03,
      sensorHeight: 38,
      backTextColor: true),
  gas(
      orderIndex: 5,
      family: 'analogic',
      name: 'gas',
      altName: 'GAS',
      iconName: 'assets/images/sensors/gas.png',
      background: ColorThemeMatch.m9_04,
      foreground: ColorThemeMatch.m10_04,
      textColor: ColorThemeMatch.m11_04,
      borderColor: ColorThemeMatch.m12_04,
      sensorHeight: 38,
      backTextColor: true),
  humidity(
      orderIndex: 6,
      family: 'analogic',
      name: 'humidity',
      altName: 'HUMIDITY',
      iconName: 'assets/images/sensors/humidity.png',
      background: ColorThemeMatch.m9_05,
      foreground: ColorThemeMatch.m10_05,
      textColor: ColorThemeMatch.m11_05,
      borderColor: ColorThemeMatch.m12_05,
      sensorHeight: 40,
      backTextColor: false),
  odometer(
      orderIndex: 7,
      family: 'analogic',
      name: 'odometer',
      altName: 'ODOMETER',
      iconName: 'assets/images/sensors/odometer.png',
      background: ColorThemeMatch.m9_06,
      foreground: ColorThemeMatch.m10_06,
      textColor: ColorThemeMatch.m11_06,
      borderColor: ColorThemeMatch.m12_06,
      sensorHeight: 40,
      backTextColor: true),
  pressure(
      orderIndex: 8,
      family: 'analogic',
      name: 'pressure',
      altName: 'PRESSURE',
      iconName: 'assets/images/sensors/pressure.png',
      background: ColorThemeMatch.m9_07,
      foreground: ColorThemeMatch.m10_07,
      textColor: ColorThemeMatch.m11_07,
      borderColor: ColorThemeMatch.m12_07,
      sensorHeight: 40,
      backTextColor: false),
  rpm(
      orderIndex: 9,
      family: 'analogic',
      name: 'rpm',
      altName: 'RPM',
      iconName: 'assets/images/sensors/rpm.png',
      background: ColorThemeMatch.m9_08,
      foreground: ColorThemeMatch.m10_08,
      textColor: ColorThemeMatch.m11_08,
      borderColor: ColorThemeMatch.m12_08,
      sensorHeight: 40,
      backTextColor: true),
  temperature(
      orderIndex: 10,
      family: 'analogic',
      name: 'temperature',
      altName: 'TEMPERATURE',
      iconName: 'assets/images/sensors/temperature.png',
      background: ColorThemeMatch.m9_09,
      foreground: ColorThemeMatch.m10_09,
      textColor: ColorThemeMatch.m11_09,
      borderColor: ColorThemeMatch.m12_09,
      sensorHeight: 40,
      backTextColor: true),

  doorStatus(
      orderIndex: 11,
      family: 'binary',
      name: 'doorStatus',
      altName: 'DOOR_STATUS',
      iconName: 'assets/images/sensors/doorstatus.png',
      iconNameOff: 'assets/images/sensors/doorstatusoff.png',
      statusOn: 'CLOSED',
      statusOff: 'OPENED',
      background: ColorThemeMatch.m9_10,
      foreground: Color.fromARGB(255, 122, 99, 67),
      textColor: Color.fromARGB(255, 238, 224, 184),
      borderColor: ColorThemeMatch.m12_10,
      sensorHeight: 38,
      backTextColor: false),
  cabineStatus(
      orderIndex: 12,
      family: 'binary',
      name: 'cabineStatus',
      altName: 'CABINE_STATUS',
      iconName: 'assets/images/sensors/cabinestatus.png',
      iconNameOff: 'assets/images/sensors/cabinestatusoff.png',
      statusOn: 'OPENED',
      statusOff: 'CLOSED',
      background: ColorThemeMatch.m9_11,
      foreground: ColorThemeMatch.m10_11,
      textColor: ColorThemeMatch.m11_11,
      borderColor: ColorThemeMatch.m12_11,
      sensorHeight: 38,
      backTextColor: false),
  missionStatus(
      orderIndex: 13,
      family: 'binary',
      name: 'missionStatus',
      altName: 'MISSION_STATUS',
      iconName: 'assets/images/sensors/missionstatus.png',
      iconNameOff: 'assets/images/sensors/missionstatusoff.png',
      statusOn: 'ENABLED',
      statusOff: 'DISABLED',
      background: ColorThemeMatch.m9_12,
      foreground: ColorThemeMatch.m10_12,
      textColor: ColorThemeMatch.m11_12,
      borderColor: ColorThemeMatch.m12_12,
      sensorHeight: 38,
      backTextColor: false),
  oilStatus(
      orderIndex: 14,
      family: 'binary',
      name: 'oilStatus',
      altName: 'OIL_STATUS',
      iconName: 'assets/images/sensors/oilstatus.png',
      iconNameOff: 'assets/images/sensors/oilstatusoff.png',
      statusOn: 'LIT',
      statusOff: 'OFF',
      background: Color.fromARGB(232, 253, 252, 193),
      foreground: Color.fromARGB(255, 188, 190, 71),
      textColor: Color.fromARGB(255, 58, 54, 5),
      borderColor: ColorThemeMatch.m12_13,
      sensorHeight: 40,
      backTextColor: false),
  refrigerationStatus(
      orderIndex: 15,
      family: 'binary',
      name: 'refrigerationStatus',
      altName: 'REFRIGERATION_STATUS',
      iconName: 'assets/images/sensors/refrigerationstatus.png',
      iconNameOff: 'assets/images/sensors/refrigerationstatusoff.png',
      statusOn: 'ENABLED',
      statusOff: 'DISABLED',
      background: ColorThemeMatch.m9_14,
      foreground: ColorThemeMatch.m10_14,
      textColor: ColorThemeMatch.m11_14,
      borderColor: ColorThemeMatch.m12_14,
      sensorHeight: 38,
      backTextColor: false),
  spinningStatus(
      orderIndex: 16,
      family: 'binary',
      name: 'spinningStatus',
      altName: 'SPINNING_STATUS',
      iconName: 'assets/images/sensors/spinningstatus.png',
      iconNameOff: 'assets/images/sensors/spinningstatusoff.png',
      statusOn: 'SPINNING',
      statusOff: 'STOP',
      background: ColorThemeMatch.m9_15,
      foreground: ColorThemeMatch.m10_15,
      textColor: ColorThemeMatch.m11_15,
      borderColor: Color.fromARGB(255, 83, 70, 46),
      sensorHeight: 38,
      backTextColor: false),
  taxiStatus(
      orderIndex: 17,
      family: 'binary',
      name: 'taxiStatus',
      altName: 'TAXI_STATUS',
      iconName: 'assets/images/sensors/taxistatus.png',
      iconNameOff: 'assets/images/sensors/taxistatusoff.png',
      statusOn: 'AVAILABLE',
      statusOff: 'OCCUPIED',
      background: ColorThemeMatch.m9_16,
      foreground: ColorThemeMatch.m10_16,
      textColor: ColorThemeMatch.m11_16,
      borderColor: ColorThemeMatch.m12_16,
      sensorHeight: 40,
      backTextColor: true);

  const SensorEnum(
      {required this.orderIndex,
      required this.family,
      required this.name,
      required this.altName,
      required this.iconName,
      required this.background,
      required this.foreground,
      required this.textColor,
      required this.borderColor,
      required this.sensorHeight,
      this.statusOn,
      this.statusOff,
      this.iconNameOff,
      required this.backTextColor});

  final int orderIndex;
  final String family;
  final String name;
  final String altName;
  final String iconName;
  final Color background;
  final Color foreground;
  final Color textColor;
  final Color borderColor;
  final String? statusOn;
  final String? statusOff;
  final String? iconNameOff;
  final double sensorHeight;
  final bool backTextColor;

  @override
  String toString() {
    return 'SensorAnalogic{orderIndex: $orderIndex, family: $family, iconName: $iconName, background: $background, foreground: $foreground, statusOn: $statusOn, statusOff: $statusOff, iconNameOff: $iconNameOff}';
  }
}

const ColorFilter greyscale = ColorFilter.matrix(<double>[
  0.2126,
  0.7152,
  0.0722,
  0,
  0,
  0.2126,
  0.7152,
  0.0722,
  0,
  0,
  0.2126,
  0.7152,
  0.0722,
  0,
  0,
  0,
  0,
  0,
  1,
  0,
]);
