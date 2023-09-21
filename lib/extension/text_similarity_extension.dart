import '../text_similarity.dart';

extension TextSimilarityExtension on String {
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
