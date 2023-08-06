import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:confess/constant/snackbar.dart';
import 'package:confess/helper/appwrite_helper.dart';
import 'package:confess/model/company_model/company_model.dart';
import 'package:flutter/material.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper _instance = DatabaseHelper._privateConstructor();
  static DatabaseHelper get instance => _instance;

  String confessionDB = '64bc2bf6ee8e4c2af294';
  String confessionCollection = '64bc2c040bbc16e8bc6a';
  String companyCollection = '64c57d0506af10f9b24e';
  Databases databases = Databases(AppwriteHelper.instance.client);
  final realtime = Realtime(AppwriteHelper.instance.client);

  ValueNotifier<int> confessionList = ValueNotifier<int>(0);

  Future<List<Document>> getAllConfession() async {
    final result = await databases.listDocuments(
      databaseId: confessionDB,
      collectionId: confessionCollection,
      queries: [Query.orderDesc('createdOn')],
    );

    if (result.documents.isEmpty) {
      return [];
    } else {
      confessionList.value = result.documents.length;
      return result.documents;
    }
  }

  void getRealtimeConfessionCount() {
    final subscription = realtime.subscribe(
      ['databases.$confessionDB.collections.$confessionCollection.documents.create'],
    );

    subscription.stream.listen((response) {
      getDocumentCount();
      Ksnackbar.instance.showNewConfession(
        title: response.payload['confession'] as String,
      );
    });
  }

  void unsubscribe() {
    unsubscribe();
  }

  Future<void> getDocumentCount() async {
    await getAllConfession();
  }

  Future<void> addConfession({
    required String text,
    required String gender,
  }) async {
    await databases.createDocument(
      databaseId: confessionDB,
      collectionId: confessionCollection,
      documentId: ID.unique(),
      data: {
        'confession': text,
        'gender': gender,
        'createdOn': DateTime.now().toIso8601String(),
      },
    );
  }

  Future<void> createCompanyData(List<Map<String, dynamic>> csvDataList) async {
    for (final element in csvDataList) {
      try {
        await databases.createDocument(
          databaseId: confessionDB,
          collectionId: companyCollection,
          documentId: ID.unique(),
          data: {
            'name': element['name'],
            'domain': element['domain'],
            'startingYear': element['year founded'],
            'industry': element['industry'],
          },
        );
      } catch (e) {
        print(e);
      }
    }
  }

  Future<List<CompanyModel>> getCompanyData() async {
    final result = await databases.listDocuments(
      databaseId: confessionDB,
      collectionId: companyCollection,
      queries: [Query.limit(100)],
    );

    if (result.documents.isEmpty) {
      return [];
    } else {
      return result.documents
          .map(
            (e) => CompanyModel(
              id: e.$id,
              name: e.data['name'] as String,
              domain: e.data['domain'] as String,
              startingYear: e.data['startingYear'] as double,
              industry: e.data['industry'] as String,
            ),
          )
          .toList();
    }
  }
}
