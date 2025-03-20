import 'dart:io';
import 'character.dart';
import 'monster.dart';

Character loadCharacterStats() {
  try {
    final file = File('characters.txt');
    final contents = file.readAsStringSync();
    final stats = contents.split(',');
    if (stats.length != 3) throw FormatException('잘못된 캐릭터 데이터 형식');

    int hp = int.parse(stats[0]);
    int attack = int.parse(stats[1]);
    int defense = int.parse(stats[2]);

    print('캐릭터의 이름을 입력하세요 : ');
    String name = stdin.readLineSync() ?? '';

    while (!RegExp(r'^[a-zA-Z가-힣]+$').hasMatch(name)) {
      print('잘못된 이름입니다. 한글 또는 영문자로 다시 입력하세요 : ');
      name = stdin.readLineSync() ?? '';
    }

      return Character(name, hp, attack, defense);
  } catch(e) {
    print('캐릭터 데이터를 불러오는 데 실패했습니다 : $e');
    exit(1);
  }
}

  List<Monster> loadMonsterStats() {
    List<Monster> monsterList = [];
    try {
      final file = File('monsters.txt');
      final lines = file.readAsLinesSync();
      for (var line in lines) {
        var data = line.split(',');
        if (data.length != 3) continue;
        monsterList.add(Monster(data[0], int.parse(data[1]), int.parse(data[2])));
      } 
    } catch(e) {
      print('몬스터 데이터를 불러오는 데 실패했습니다 : $e');
      exit(1);
    }
    return monsterList;
  }

  void saveResult(Character character, String result) {
    print('결과를 저장하시겠습니까? (y/n)');
    String? response = stdin.readLineSync();
    if (response?.toLowerCase() == 'y') {
      File('result.txt').writeAsStringSync(
        '${character.name}, 체력 : ${character.hp}, 결과 : $result');
      print('결과가 저장되었습니다. ');
    }

  }