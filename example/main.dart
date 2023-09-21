import 'dart:io';

import 'package:text_similarity/extension/text_similarity_extension.dart';

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
void main(List<String> args) {
  if (args.isEmpty) {
    stdout.writeln('You must write an argument');
    return;
  }

  final command = args.first;

  final similarities = command.similarities(candidates: commands);

  if (similarities.isEmpty) {
    stdout.writeln('No similar commands found');
    return;
  }

  stdout.writeln('$command is similar to:');
  for (final command in similarities) {
    stdout.writeln('\t$command');
  }
}
