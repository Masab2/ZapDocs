import 'dart:developer';
import 'dart:io';

import 'package:zapdocs/Config/App/app_url.dart';
import 'package:zapdocs/Model/NotesModel/notes_model.dart';
import 'package:zapdocs/Repository/NotesRepo/notes_repo.dart';
import 'package:zapdocs/Services/LocalStorage/local_storage.dart';
import 'package:zapdocs/data/Network/network_api_service.dart';

class NotesHttpRepo implements NotesRepo {
  final _api = NetworkApiService();
  final LocalStorage _localStorage = LocalStorage();
  @override
  Future<NotesModel> generateNotes(File file) async {
    final userId = await _localStorage.readValue("id");
    Map<String, dynamic> data = {
      'file': file,
      'userId': userId,
    };
    log(data.toString());
    final response = await _api.getPostApiResponse(AppUrl.generateNotes, data, true);
    return NotesModel.fromJson(response);
  }
}
