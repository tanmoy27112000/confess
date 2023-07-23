import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:confess/constant/snackbar.dart';
import 'package:confess/helper/appwrite_helper.dart';
import 'package:flutter/material.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper _instance = DatabaseHelper._privateConstructor();
  static DatabaseHelper get instance => _instance;

  String confessionDB = '64bc2bf6ee8e4c2af294';
  String confessionCollection = '64bc2c040bbc16e8bc6a';
  Databases databases = Databases(AppwriteHelper.instance.client);
  final realtime = Realtime(AppwriteHelper.instance.client);

  ValueNotifier<int> confessionList = ValueNotifier<int>(0);

  Future<List<Document>> getAllConfession() async {
    final result = await databases.listDocuments(
      databaseId: confessionDB,
      collectionId: confessionCollection,
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
      ['databases.$confessionDB.collections.$confessionCollection.documents'],
    );

    subscription.stream.listen((response) {
      getDocumentCount();
      Ksnackbar.instance
          .showNewConfession(title: response.payload['confession'] as String);
    });
  }

  void unsubscribe() {
    unsubscribe();
  }

  Future<void> getDocumentCount() async {
    await getAllConfession();
  }
}
