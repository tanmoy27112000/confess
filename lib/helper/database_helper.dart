import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:confess/model/confession_model/confession_model.dart';
import 'package:confess/model/tag_model/tag_model.dart';
import 'package:flutter/material.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper _instance = DatabaseHelper._privateConstructor();
  static DatabaseHelper get instance => _instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;

  //collection name
  final confessionCollection = 'confessions';

  final tagsCollection = 'tags';

  ValueNotifier<int> confessionList = ValueNotifier<int>(0);

  Future<List<ConfessionModel>> getAllConfession() async {
    final result = await db.collection(confessionCollection).orderBy('createdAt', descending: true).get();

    if (result.docs.isEmpty) {
      return [];
    } else {
      confessionList.value = result.docs.length;
      return result.docs.map((e) => ConfessionModel.fromJson(e.data())).toList();
    }
  }

  void getRealtimeConfessionCount() {
    db.collection(confessionCollection).snapshots().listen((event) {
      confessionList.value = event.docs.length;
    });
  }

  Future<void> addConfession({
    required String text,
    required int gender,
    required String age,
    required String name,
    required String uid,
    required List<String> tags,
  }) async {
    await db.collection(confessionCollection).add(
      // documentId: ID.unique(),
      {
        'confession': text,
        'gender': gender,
        'createdAt': Timestamp.now(),
        'age': int.parse(age),
        'likes': 0,
        'email': '',
        'name': name,
        'uid': uid,
        'tags': tags,
      },
    );
  }

  Future<List<TagModel>> getTags({String? search}) async {
    try {
      if (search == null || search.trim().length < 3) {
        return [];
      }
      final query = db.collection(tagsCollection);
      // .where(fieldName, isLessThan: '${search}z');

      final result = await query.get();

      if (result.docs.isEmpty) {
        return [];
      } else {
        return result.docs
            .map((e) => TagModel.fromJson(e.data()))
            .where((e) => e.tagName.toLowerCase().contains(search.trim().toLowerCase()))
            .toList();
      }
    } catch (e, st) {
      log(e.toString(), stackTrace: st);
      log(st.toString());
      return [];
    }
  }

  // Future<void> createCompanyData(List<Map<String, dynamic>> csvDataList) async {
  //   for (final element in csvDataList) {
  //     try {
  //       await databases.createDocument(
  //         databaseId: confessionDB,
  //         collectionId: companyCollection,
  //         // documentId: ID.unique(),
  //         data: {
  //           'name': element['name'],
  //           'domain': element['domain'],
  //           'startingYear': element['year founded'],
  //           'industry': element['industry'],
  //         },
  //       );
  //     } catch (e) {
  //       print(e);
  //     }
  //   }
  // }

  // Future<List<CompanyModel>> getCompanyData() async {
  // final result = await databases.listDocuments(
  //   databaseId: confessionDB,
  //   collectionId: companyCollection,
  //   queries: [Query.limit(100)],
  // );

  // if (result.documents.isEmpty) {
  //   return [];
  // } else {
  //   return result.documents
  //       .map(
  //         (e) => CompanyModel(
  //           id: e.$id,
  //           name: e.data['name'] as String,
  //           domain: e.data['domain'] as String,
  //           startingYear: e.data['startingYear'] as double,
  //           industry: e.data['industry'] as String,
  //         ),
  //       )
  //       .toList();
  // }
  // }
}
