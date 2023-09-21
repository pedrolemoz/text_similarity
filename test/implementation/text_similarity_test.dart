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
            final similatiries = 'l'.similarities(candidates: commands);
            expect(similatiries, {'ls'});
          },
        );

        test(
          'Should return the expected Set<String> when the command is "l" using distance 2',
          () {
            final similatiries = 'l'.similarities(
              candidates: commands,
              distance: 2,
            );
            expect(
              similatiries,
              {'ls', 'cd', 'mv', 'cp', 'rm', 'ps', 'df', 'cal', 'dd'},
            );
          },
        );

        test(
          'Should return the expected Set<String> when the command is "ls" using distance 1',
          () {
            final similatiries = 'ls'.similarities(candidates: commands);
            expect(similatiries, {'ls', 'ps'});
          },
        );

        test(
          'Should return the expected Set<String> when the command is "ls" using distance 2',
          () {
            final similatiries = 'ls'.similarities(
              candidates: commands,
              distance: 2,
            );
            expect(
              similatiries,
              {'ls', 'cd', 'mv', 'cp', 'rm', 'less', 'ssh', 'ps', 'df', 'dd'},
            );
          },
        );
      });

      group('cat', () {
        test(
          'Should return the expected Set<String> hen the command is "c" using distance 1',
          () {
            final similatiries = 'c'.similarities(candidates: commands);
            expect(similatiries, {'cd', 'cp'});
          },
        );

        test(
          'Should return the expected Set<String> when the command is "c" using distance 2',
          () {
            final similatiries = 'c'.similarities(
              candidates: commands,
              distance: 2,
            );
            expect(
              similatiries,
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
            final similatiries = 'ca'.similarities(candidates: commands);
            expect(similatiries, {'cd', 'cp', 'cat', 'cal'});
          },
        );

        test(
          'Should return the expected Set<String> when the command is "ca" using distance 2',
          () {
            final similatiries = 'ca'.similarities(
              candidates: commands,
              distance: 2,
            );
            expect(
              similatiries,
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
            final similatiries = 'cat'.similarities(candidates: commands);
            expect(similatiries, {'cat', 'cal'});
          },
        );

        test(
          'Should return the expected Set<String> when the command is "cat" using distance 2',
          () {
            final similatiries = 'cat'.similarities(
              candidates: commands,
              distance: 2,
            );
            expect(
              similatiries,
              {'cd', 'cp', 'cat', 'man', 'tar', 'cmp', 'cal'},
            );
          },
        );
      });

      group('mkdir', () {
        test(
          'Should return the expected Set<String> when the command is "m" using distance 1',
          () {
            final similatiries = 'm'.similarities(candidates: commands);
            expect(similatiries, {'mv', 'rm'});
          },
        );

        test(
          'Should return the expected Set<String> when the command is "m" using distance 2',
          () {
            final similatiries = 'm'.similarities(
              candidates: commands,
              distance: 2,
            );
            expect(
              similatiries,
              {'ls', 'cd', 'mv', 'cp', 'rm', 'man', 'cmp', 'ps', 'df', 'dd'},
            );
          },
        );

        test(
          'Should return the expected Set<String> when the command is "mk" using distance 1',
          () {
            final similatiries = 'mk'.similarities(candidates: commands);
            expect(similatiries, {'mv'});
          },
        );

        test(
          'Should return the expected Set<String> when the command is "mk" using distance 2',
          () {
            final similatiries = 'mk'.similarities(
              candidates: commands,
              distance: 2,
            );
            expect(
              similatiries,
              {'ls', 'cd', 'mv', 'cp', 'rm', 'man', 'cmp', 'ps', 'df', 'dd'},
            );
          },
        );

        test(
          'Should return the expected Set<String> when the command is "mkd" using distance 1',
          () {
            final similatiries = 'mkd'.similarities(candidates: commands);
            expect(similatiries, <String>{});
          },
        );

        test(
          'Should return the expected Set<String> when the command is "mkd" using distance 2',
          () {
            final similatiries = 'mkd'.similarities(
              candidates: commands,
              distance: 2,
            );
            expect(
              similatiries,
              {'pwd', 'cd', 'mkdir', 'mv', 'man', 'dd'},
            );
          },
        );

        test(
          'Should return the expected Set<String> when the command is "mkdi" using distance 1',
          () {
            final similatiries = 'mkdi'.similarities(candidates: commands);
            expect(similatiries, {'mkdir'});
          },
        );

        test(
          'Should return the expected Set<String> when the command is "mkdi" using distance 2',
          () {
            final similatiries = 'mkdi'.similarities(
              candidates: commands,
              distance: 2,
            );
            expect(similatiries, {'mkdir'});
          },
        );

        test(
          'Should return the expected Set<String> when the command is "mkdir" using distance 1',
          () {
            final similatiries = 'mkdir'.similarities(candidates: commands);
            expect(similatiries, {'mkdir'});
          },
        );

        test(
          'Should return the expected Set<String> when the command is "mkdir" using distance 2',
          () {
            final similatiries = 'mkdir'.similarities(
              candidates: commands,
              distance: 2,
            );
            expect(similatiries, {'mkdir'});
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
          final similatiries = 'c'.similarities(candidates: commands);
          expect(similatiries, <String>{});
        },
      );

      test(
        'Should return the expected Set<String> when the command is "c" using distance 2',
        () {
          final similatiries = 'c'.similarities(
            candidates: commands,
            distance: 2,
          );
          expect(similatiries, {'mv', 'rm'});
        },
      );

      test(
        'Should return the expected Set<String> when the command is "cl" using distance 1',
        () {
          final similatiries = 'cl'.similarities(candidates: commands);
          expect(similatiries, <String>{});
        },
      );

      test(
        'Should return the expected Set<String> when the command is "cl" using distance 2',
        () {
          final similatiries = 'cl'.similarities(
            candidates: commands,
            distance: 2,
          );
          expect(similatiries, {'mv', 'rm'});
        },
      );

      test(
        'Should return the expected Set<String> when the command is "clo" using distance 1',
        () {
          final similatiries = 'clo'.similarities(candidates: commands);
          expect(similatiries, <String>{});
        },
      );

      test(
        'Should return the expected Set<String> when the command is "clo" using distance 2',
        () {
          final similatiries = 'clo'.similarities(
            candidates: commands,
            distance: 2,
          );
          expect(similatiries, {'clone', 'log'});
        },
      );

      test(
        'Should return the expected Set<String> when the command is "clon" using distance 1',
        () {
          final similatiries = 'clon'.similarities(candidates: commands);
          expect(similatiries, {'clone'});
        },
      );

      test(
        'Should return the expected Set<String> when the command is "clon" using distance 2',
        () {
          final similatiries = 'clon'.similarities(
            candidates: commands,
            distance: 2,
          );
          expect(similatiries, {'clone', 'log'});
        },
      );

      test(
        'Should return the expected Set<String> when the command is "clone" using distance 1',
        () {
          final similatiries = 'clone'.similarities(candidates: commands);
          expect(similatiries, {'clone'});
        },
      );

      test(
        'Should return the expected Set<String> when the command is "clone" using distance 2',
        () {
          final similatiries = 'clone'.similarities(
            candidates: commands,
            distance: 2,
          );
          expect(similatiries, {'clone'});
        },
      );
    });
  });
}
