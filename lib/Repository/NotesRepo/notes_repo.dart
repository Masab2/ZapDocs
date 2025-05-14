import 'dart:io';

import 'package:zapdocs/Model/GetAllNotesModel/get_all_notes_model.dart';
import 'package:zapdocs/Model/NotesModel/notes_model.dart';

abstract class NotesRepo {
  Future<NotesModel> generateNotes(File file);
  Future<GetAllNotesModel> getAllNotesApi();
}
