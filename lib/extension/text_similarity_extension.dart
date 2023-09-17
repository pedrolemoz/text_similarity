import '../text_similarity.dart';

extension TextSimilarityExtension on String {
  Set<String> getSimilarStrings({
    required List<String> candidates,
    int distance = 1,
  }) {
    const textSimilarity = TextSimilarity();
    return textSimilarity.getSimilarStrings(
      input: this,
      candidates: candidates,
      distance: distance,
    );
  }
}
