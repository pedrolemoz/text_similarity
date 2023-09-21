import '../automaton/levenshtein_automaton.dart';

class TextSimilarity {
  const TextSimilarity();

  Set<String> similarities({
    required String input,
    required List<String> candidates,
    int distance = 1,
    Set<String>? customAlphabet,
  }) {
    final matchingStrings = <String>{};

    final inputAutomaton = LevenshteinAutomaton(
      input: input,
      distance: distance,
      customAlphabet: customAlphabet,
    );

    for (final string in candidates) {
      if (inputAutomaton.evaluate(string)) {
        matchingStrings.add(string);
      }
    }

    return matchingStrings;
  }
}
