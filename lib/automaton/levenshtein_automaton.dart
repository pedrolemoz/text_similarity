import 'package:automata_theory/automatons.dart';

class LevenshteinAutomaton {
  late EpsilonNFA _eNFA;
  final Set<String>? customAlphabet;

  LevenshteinAutomaton({
    required String input,
    required int distance,
    this.customAlphabet,
  }) {
    _eNFA = _generateAutomaton(input, distance);
  }

  bool evaluate(String input) => _eNFA.evaluate(input);

  EpsilonNFA _generateAutomaton(String input, int distance) {
    final columns = input.length + 1;
    final rows = distance + 1;
    final matrixOfStates = <List<NonDeterministicState>>[];

    for (var i = 0; i < rows; i++) {
      final row = <NonDeterministicState>[];
      for (var j = 0; j < columns; j++) {
        final state = NonDeterministicState(name: 'q[$i][$j]');
        row.add(state);
      }
      matrixOfStates.add(row);
    }

    matrixOfStates[0][0].isInitial = true;

    final states = <NonDeterministicState>{};

    for (var row = 0; row < rows; row++) {
      for (var column = 0; column < columns; column++) {
        final currentState = matrixOfStates[row][column];
        NonDeterministicState? nextState;
        NonDeterministicState? bottomState;
        NonDeterministicState? diagonalState;
        String? currentInput;

        final hasInput = column < input.length;
        final hasNextState = column + 1 < columns;
        final hasBottomState = row + 1 < rows;
        final hasDiagonalState = hasNextState && hasBottomState;

        final allTransitionsAreEnabled = hasDiagonalState;
        final onlyBottomTransitionIsEnabled = !hasNextState && hasBottomState;
        final onlyNextTransitionIsEnabled = hasNextState && !hasBottomState;

        if (hasInput) {
          currentInput = input[column];
        }

        if (hasNextState) {
          nextState = matrixOfStates[row][column + 1];
        }

        if (hasBottomState) {
          bottomState = matrixOfStates[row + 1][column];
        }

        if (hasDiagonalState) {
          diagonalState = matrixOfStates[row + 1][column + 1];
        }

        if (allTransitionsAreEnabled) {
          currentState.setTransition(
            (input) => {
              if (currentInput != null && currentInput == input) nextState!,
              bottomState!,
              diagonalState!,
            },
          );
        } else if (onlyNextTransitionIsEnabled) {
          currentState.setTransition(
            (input) => {
              if (currentInput != null && currentInput == input) nextState!,
            },
          );
        } else if (onlyBottomTransitionIsEnabled) {
          currentState
            ..isFinal = true
            ..setTransition((input) => {bottomState!});
        } else {
          currentState
            ..isFinal = true
            ..setTransition((input) => {});
        }

        states.add(currentState);
      }
    }

    return EpsilonNFA(
      states: states,
      alphabet: customAlphabet ?? alphabet,
    );
  }
}
