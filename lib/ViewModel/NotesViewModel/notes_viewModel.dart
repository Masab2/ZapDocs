import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zapdocs/Config/Routes/route_name.dart';
import 'package:zapdocs/Config/Utils/extract_notes_util.dart';
import 'package:zapdocs/Config/Utils/utils.dart';
import 'package:zapdocs/Model/GetAllNotesModel/get_all_notes_model.dart';
import 'package:zapdocs/Repository/NotesRepo/notes_http_repo.dart';
import 'package:zapdocs/Repository/NotesRepo/notes_repo.dart';
import 'package:zapdocs/ViewModel/FilePickerViewModel/file_picker_viewModel.dart';
import 'package:zapdocs/data/Response/api_response.dart';

class NotesViewmodel with ChangeNotifier {
  final NotesRepo _repo = NotesHttpRepo();

  // Loading
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void generateNotes(file, BuildContext context) async {
    setLoading(true);
    await _repo.generateNotes(file).then((value) {
      setLoading(false);
      Provider.of<FilePickerViewmodel>(context, listen: false).clearFile();
      getAllNotesApi();
      var data =
          ExtractNotesUtil.extractHeadingsAndContent(value.content ?? "");
      Navigator.pushNamed(context, RouteNames.notesView, arguments: {
        "Notes": data,
        "docType": value.docType ?? "",
      });
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.showCustomSnackBar(context, error.toString(), "Error");
    });
  }

  ApiResponse<GetAllNotesModel> apiResponse = ApiResponse.notStarted();

  List<NotesDataList> allNotes = [];
  List<NotesDataList> filteredNotes = [];

  void setApiResponse(ApiResponse<GetAllNotesModel> response) {
    apiResponse = response;
    allNotes = apiResponse.data?.data ?? [];
    filteredNotes = allNotes;
    notifyListeners();
  }

  void getAllNotesApi() async {
    try {
      setApiResponse(ApiResponse.loading());
      await _repo.getAllNotesApi().then((value) {
        setApiResponse(ApiResponse.completed(value));
      }).onError((error, stackTrace) {
        setApiResponse(ApiResponse.error(error.toString()));
      });
    } catch (e) {
      setApiResponse(ApiResponse.error(e.toString()));
    }
  }

  final TextEditingController searchController = TextEditingController();
  final List<String> filterOptions = ['All', 'Word Document', 'PowerPoint Presentation', 'PDF Document'];
  String _selectedFilter = 'All';

  String get selectedFilter => _selectedFilter;

  void setFilter(String value) {
    _selectedFilter = value;
    filterNotesByFilter();
    notifyListeners();
  }

  

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void clearSearch() {
    searchController.clear();
    notifyListeners();
  }

  // Filtered Notes According to the search query
  void filterNotes(String query) {
    filteredNotes = allNotes.where((note) {
      final titleMatch = note.title.toLowerCase().contains(query.toLowerCase());
      final contentMatch =
          note.content.toLowerCase().contains(query.toLowerCase());
      return titleMatch || contentMatch;
    }).toList();
    notifyListeners();
  }

  // Filtered Notes According to the selected filter
  void filterNotesByFilter() {
    if (_selectedFilter == 'All') {
      filteredNotes = allNotes;
    } else {
      filteredNotes = allNotes.where((note) {
        return ExtractNotesUtil.getDocumentTypeLabel(note.docType) == _selectedFilter;
      }).toList();
    }
    notifyListeners();
  }
}
