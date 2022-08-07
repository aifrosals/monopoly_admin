class RegexUtils {
  static List<String?> getColors(String colorsString) {
    var colorsMatcher = RegExp(
      r'#(([0-9a-fA-F]{2}){3,4}|([0-9a-fA-F]){3,4})',
    );
    List<String?> colors =
        colorsMatcher.allMatches(colorsString).map((e) => e.group(0)).toList();
    return colors;
  }
}
