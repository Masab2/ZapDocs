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
}
