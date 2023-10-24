import 'dart:convert';
import 'package:flutter/services.dart';

import '../screens/models/notifications/notifications.dart';

class Services {
  double calculateVAT(double productPrice, double vatRate) {
    if (productPrice <= 0 || vatRate <= 0) {
      return 0.0;
    }

    double vatAmount = productPrice * (vatRate / 100);

    return double.parse(vatAmount.toStringAsFixed(2));
  }

  Future<List<NotificationModel>> loadNotifications() async {
    final jsonString = await rootBundle.loadString(
        'assets/jsonfiles/notifications.json'); // Replace with the path to your JSON file

    final List<dynamic> jsonList = json.decode(jsonString);
    final List<NotificationModel> notifications =
        jsonList.map((json) => NotificationModel.fromJson(json)).toList();

    return notifications;
  }
}
