import 'package:confess/model/company_model/company_model.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

Logger logger = Logger();
ValueNotifier<List<CompanyModel>> companyList = ValueNotifier<List<CompanyModel>>([]);
