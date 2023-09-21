import '../text_similarity.dart';

/// Extension to simplify the usage of `TextSimilarity` class.
extension TextSimilarityExtension on String {
  /// This method returns a `Set<String>` of candidates accepted by the generated Levenshtein's Automaton for the input.
  Set<String> similarities({
    required List<String> candidates,
    int distance = 1,
  }) {
    const textSimilarity = TextSimilarity();
    return textSimilarity.similarities(
      input: this,
      candidates: candidates,
      distance: distance,
    );
  }
}
