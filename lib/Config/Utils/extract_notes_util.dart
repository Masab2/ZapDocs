import 'package:intl/intl.dart';

class ExtractNotesUtil {
  static Map<String, dynamic> extractHeadingsAndContent(String summary) {
    final lines = summary.split('\n');
    final Map<String, dynamic> result = {
      'Title': '',
      'Key Points': <String>[],
      'Conclusion': '',
    };

    String? currentKey;
    List<String> keyTakeawayList = [];
    StringBuffer conclusionContent = StringBuffer();

    for (final line in lines) {
      final trimmedLine = line.trim();

      if (trimmedLine.startsWith('Title:')) {
        result['Title'] = trimmedLine.replaceFirst('Title:', '').trim();
        currentKey = null;
        continue;
      }

      if (trimmedLine.startsWith('Key Points:')) {
        currentKey = 'Key Points';
        continue;
      }

      if (trimmedLine.startsWith('Conclusion:')) {
        if (currentKey == 'Key Points') {
          result['Key Points'] = keyTakeawayList;
        }
        currentKey = 'Conclusion';
        conclusionContent.clear();
        conclusionContent
            .writeln(trimmedLine.replaceFirst('Conclusion:', '').trim());
        continue;
      }

      if (currentKey == 'Key Points' && trimmedLine.startsWith('- ')) {
        keyTakeawayList.add(trimmedLine.substring(2).trim());
      } else if (currentKey == 'Conclusion') {
        conclusionContent.writeln(trimmedLine);
      }
    }

    if (currentKey == 'Key Points') {
      result['Key Points'] = keyTakeawayList;
    } else if (currentKey == 'Conclusion') {
      result['Conclusion'] = conclusionContent.toString().trim();
    }

    return result;
  }

  static String getDocumentTypeLabel(String docType) {
    switch (docType.toLowerCase()) {
      case '.pdf':
        return 'PDF Document';
      case '.doc':
      case '.docx':
        return 'Word Document';
      case '.ppt':
      case '.pptx':
        return 'PowerPoint Presentation';
      default:
        return 'Unknown Document Type';
    }
  }

  // Function For format Date
  static String formatDate(String date) {
    final dateTime = DateTime.parse(date).toLocal();
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inSeconds < 60) {
      return 'Just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d ago';
    } else {
      return DateFormat('MMM d').format(dateTime);
    }
  }
}
