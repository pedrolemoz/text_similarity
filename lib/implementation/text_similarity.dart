import '../automaton/levenshtein_automaton.dart';

/// Application of Levenshtein's Automaton to find similarities between a String and a set of known words.
class TextSimilarity {
  const TextSimilarity();

  /// This method returns a `Set<String>` of candidates accepted by the generated Levenshtein's Automaton for the input.
  Set<String> similarities({
    required String input,
    required List<String> candidates,
    int distance = 1,
    Set<String>? customAlphabet,
  }) {
    final inputAutomaton = LevenshteinAutomaton(
      input: input,
      distance: distance,
      customAlphabet: customAlphabet,
    );

    return candidates.where(inputAutomaton.evaluate).toSet();
  }
}
