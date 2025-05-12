import 'dart:io';

import 'package:zapdocs/Model/NotesModel/notes_model.dart';

abstract class NotesRepo {
  Future<NotesModel> generateNotes(File file);
}
