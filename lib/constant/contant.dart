import 'dart:math';

import 'package:confess/model/company_model/company_model.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

Logger logger = Logger();
ValueNotifier<List<CompanyModel>> companyList = ValueNotifier<List<CompanyModel>>([]);

String generateUID() {
  const randomChars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  const randStringLength = 20;
  final random = Random();

  return List.generate(randStringLength, (index) {
    return randomChars[random.nextInt(randomChars.length)];
  }).join();
}
