import 'package:test/test.dart';
import 'package:text_similarity/text_similarity.dart';

void main() {
  group(
    'Text similarity for linux commands',
    () {
      const commands = [
        'ls',
        'pwd',
        'cd',
        'mkdir',
        'mv',
        'cp',
        'rm',
        'touch',
        'cat',
        'clear',
        'echo',
        'less',
        'man',
        'uname',
        'whoami',
        'tar',
        'grep',
        'head',
        'tail',
        'diff',
        'cmp',
        'comm',
        'sort',
        'export',
        'zip',
        'unzip',
        'ssh',
        'service',
        'ps',
        'kill',
        'killall',
        'df',
        'mount',
        'chmod',
        'chown',
        'ifconfig',
        'traceroute',
        'wget',
        'ufw',
        'iptables',
        'sudo',
        'cal',
        'alias',
        'dd',
        'whereis',
        'source',
        'whatis',
        'top',
        'useradd',
        'usermod',
        'passwd',
      ];

      group('ls', () {
        test(
          'Should return the expected Set<String> when the command is "l" using distance 1',
          () {
            final similarCommands = 'l'.getSimilarStrings(candidates: commands);
            expect(similarCommands, {'ls'});
          },
        );

        test(
          'Should return the expected Set<String> when the command is "l" using distance 2',
          () {
            final similarCommands = 'l'.getSimilarStrings(
              candidates: commands,
              distance: 2,
            );
            expect(
              similarCommands,
              {'ls', 'cd', 'mv', 'cp', 'rm', 'ps', 'df', 'cal', 'dd'},
            );
          },
        );

        test(
          'Should return the expected Set<String> when the command is "ls" using distance 1',
          () {
            final similarCommands =
                'ls'.getSimilarStrings(candidates: commands);
            expect(similarCommands, {'ls', 'ps'});
          },
        );

        test(
          'Should return the expected Set<String> when the command is "ls" using distance 2',
          () {
            final similarCommands = 'ls'.getSimilarStrings(
              candidates: commands,
              distance: 2,
            );
            expect(
              similarCommands,
              {'ls', 'cd', 'mv', 'cp', 'rm', 'less', 'ssh', 'ps', 'df', 'dd'},
            );
          },
        );
      });

      group('cat', () {
        test(
          'Should return the expected Set<String> hen the command is "c" using distance 1',
          () {
            final similarCommands = 'c'.getSimilarStrings(candidates: commands);
            expect(similarCommands, {'cd', 'cp'});
          },
        );

        test(
          'Should return the expected Set<String> when the command is "c" using distance 2',
          () {
            final similarCommands = 'c'.getSimilarStrings(
              candidates: commands,
              distance: 2,
            );
            expect(
              similarCommands,
              {
                'ls',
                'cd',
                'mv',
                'cp',
                'rm',
                'cat',
                'cmp',
                'ps',
                'df',
                'cal',
                'dd',
              },
            );
          },
        );

        test(
          'Should return the expected Set<String> when the command is "ca" using distance 1',
          () {
            final similarCommands =
                'ca'.getSimilarStrings(candidates: commands);
            expect(similarCommands, {'cd', 'cp', 'cat', 'cal'});
          },
        );

        test(
          'Should return the expected Set<String> when the command is "ca" using distance 2',
          () {
            final similarCommands = 'ca'.getSimilarStrings(
              candidates: commands,
              distance: 2,
            );
            expect(
              similarCommands,
              {
                'ls',
                'cd',
                'mv',
                'cp',
                'rm',
                'cat',
                'man',
                'tar',
                'cmp',
                'ps',
                'df',
                'cal',
                'dd',
              },
            );
          },
        );

        test(
          'Should return the expected Set<String> when the command is "cat" using distance 1',
          () {
            final similarCommands =
                'cat'.getSimilarStrings(candidates: commands);
            expect(similarCommands, {'cat', 'cal'});
          },
        );

        test(
          'Should return the expected Set<String> when the command is "cat" using distance 2',
          () {
            final similarCommands = 'cat'.getSimilarStrings(
              candidates: commands,
              distance: 2,
            );
            expect(
              similarCommands,
              {'cd', 'cp', 'cat', 'man', 'tar', 'cmp', 'cal'},
            );
          },
        );
      });

      group('mkdir', () {
        test(
          'Should return the expected Set<String> when the command is "m" using distance 1',
          () {
            final similarCommands = 'm'.getSimilarStrings(candidates: commands);
            expect(similarCommands, {'mv', 'rm'});
          },
        );

        test(
          'Should return the expected Set<String> when the command is "m" using distance 2',
          () {
            final similarCommands = 'm'.getSimilarStrings(
              candidates: commands,
              distance: 2,
            );
            expect(
              similarCommands,
              {'ls', 'cd', 'mv', 'cp', 'rm', 'man', 'cmp', 'ps', 'df', 'dd'},
            );
          },
        );

        test(
          'Should return the expected Set<String> when the command is "mk" using distance 1',
          () {
            final similarCommands =
                'mk'.getSimilarStrings(candidates: commands);
            expect(similarCommands, {'mv'});
          },
        );

        test(
          'Should return the expected Set<String> when the command is "mk" using distance 2',
          () {
            final similarCommands = 'mk'.getSimilarStrings(
              candidates: commands,
              distance: 2,
            );
            expect(
              similarCommands,
              {'ls', 'cd', 'mv', 'cp', 'rm', 'man', 'cmp', 'ps', 'df', 'dd'},
            );
          },
        );

        test(
          'Should return the expected Set<String> when the command is "mkd" using distance 1',
          () {
            final similarCommands =
                'mkd'.getSimilarStrings(candidates: commands);
            expect(similarCommands, <String>{});
          },
        );

        test(
          'Should return the expected Set<String> when the command is "mkd" using distance 2',
          () {
            final similarCommands = 'mkd'.getSimilarStrings(
              candidates: commands,
              distance: 2,
            );
            expect(
              similarCommands,
              {'pwd', 'cd', 'mkdir', 'mv', 'man', 'dd'},
            );
          },
        );

        test(
          'Should return the expected Set<String> when the command is "mkdi" using distance 1',
          () {
            final similarCommands =
                'mkdi'.getSimilarStrings(candidates: commands);
            expect(similarCommands, {'mkdir'});
          },
        );

        test(
          'Should return the expected Set<String> when the command is "mkdi" using distance 2',
          () {
            final similarCommands = 'mkdi'.getSimilarStrings(
              candidates: commands,
              distance: 2,
            );
            expect(similarCommands, {'mkdir'});
          },
        );

        test(
          'Should return the expected Set<String> when the command is "mkdir" using distance 1',
          () {
            final similarCommands =
                'mkdir'.getSimilarStrings(candidates: commands);
            expect(similarCommands, {'mkdir'});
          },
        );

        test(
          'Should return the expected Set<String> when the command is "mkdir" using distance 2',
          () {
            final similarCommands = 'mkdir'.getSimilarStrings(
              candidates: commands,
              distance: 2,
            );
            expect(similarCommands, {'mkdir'});
          },
        );
      });
    },
  );

  group('Text similarity for git commands', () {
    const commands = [
      'clone',
      'init',
      'add',
      'mv',
      'restore',
      'rm',
      'bisect',
      'diff',
      'grep',
      'log',
      'show',
      'status',
      'branch',
      'commit',
      'merge',
      'rebase',
      'reset',
      'switch',
      'fetch',
      'pull',
      'push',
    ];

    group('clone', () {
      test(
        'Should return the expected Set<String> when the command is "c" using distance 1',
        () {
          final similarCommands = 'c'.getSimilarStrings(candidates: commands);
          expect(similarCommands, <String>{});
        },
      );

      test(
        'Should return the expected Set<String> when the command is "c" using distance 2',
        () {
          final similarCommands = 'c'.getSimilarStrings(
            candidates: commands,
            distance: 2,
          );
          expect(similarCommands, {'mv', 'rm'});
        },
      );

      test(
        'Should return the expected Set<String> when the command is "cl" using distance 1',
        () {
          final similarCommands = 'cl'.getSimilarStrings(candidates: commands);
          expect(similarCommands, <String>{});
        },
      );

      test(
        'Should return the expected Set<String> when the command is "cl" using distance 2',
        () {
          final similarCommands = 'cl'.getSimilarStrings(
            candidates: commands,
            distance: 2,
          );
          expect(similarCommands, {'mv', 'rm'});
        },
      );

      test(
        'Should return the expected Set<String> when the command is "clo" using distance 1',
        () {
          final similarCommands = 'clo'.getSimilarStrings(candidates: commands);
          expect(similarCommands, <String>{});
        },
      );

      test(
        'Should return the expected Set<String> when the command is "clo" using distance 2',
        () {
          final similarCommands = 'clo'.getSimilarStrings(
            candidates: commands,
            distance: 2,
          );
          expect(similarCommands, {'clone', 'log'});
        },
      );

      test(
        'Should return the expected Set<String> when the command is "clon" using distance 1',
        () {
          final similarCommands =
              'clon'.getSimilarStrings(candidates: commands);
          expect(similarCommands, {'clone'});
        },
      );

      test(
        'Should return the expected Set<String> when the command is "clon" using distance 2',
        () {
          final similarCommands = 'clon'.getSimilarStrings(
            candidates: commands,
            distance: 2,
          );
          expect(similarCommands, {'clone', 'log'});
        },
      );

      test(
        'Should return the expected Set<String> when the command is "clone" using distance 1',
        () {
          final similarCommands =
              'clone'.getSimilarStrings(candidates: commands);
          expect(similarCommands, {'clone'});
        },
      );

      test(
        'Should return the expected Set<String> when the command is "clone" using distance 2',
        () {
          final similarCommands = 'clone'.getSimilarStrings(
            candidates: commands,
            distance: 2,
          );
          expect(similarCommands, {'clone'});
        },
      );
    });
  });
}
