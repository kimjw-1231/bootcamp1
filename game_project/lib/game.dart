import 'dart:io';
import 'character.dart';
import 'monster.dart';
import 'file_manager.dart';
import 'dart:math';

class Game {
  Character character;
  List<Monster> monsters = [];
  int defeatMonsters = 0;

    Game() 
      : character = loadCharacterStats(),
        monsters = loadMonsterStats();

  void startGame() {
    print('게임을 시작합니다! ');
    character.showStatus();

    while (character.hp > 0 && monsters.isNotEmpty) {
      Monster monster = getRandomMonster();
      battle(monster);

      if(character.hp <= 0) {
        print('게임 오버! ${character.name}이(가) 패배했습니다.');
        saveResult(character, '패배');
        return;
      }

      defeatMonsters++;
      if(defeatMonsters >= monsters.length) {
        print('축하합니다! 모든 몬스터를 물리쳤습니다! ');
        saveResult(character, '승리');
        return;
      }

      print('다음 몬스터와 대결하시겠습니까? (y/n)');
      String? response = stdin.readLineSync();
      if (response?.toLowerCase() != 'y') {
        saveResult(character, '중단');
        return;
      }
    }
  }

    void battle(Monster monster) {
      print('\n새로운 몬스터가 나타났습니다! ');
      monster.showStatus();

      while (character.hp > 0 && monster.hp > 0) {
        print('\n${character.name}의 턴');
        print('행동을 선택하세요 : 공격(1), 방어(2)');

        String? action = stdin.readLineSync();
        if (action == '1') {
          character.attackMonster(monster);
        } else if (action == '2') {
          int recoverAmount = monster.attack ~/4;
          character.defend(recoverAmount);
        } else {
          print('잘못된 입력입니다. 다시 선택하세요. ');
          continue;
        }

        if(monster.hp > 0) {
          print('\n${monster.name}의 턴');
          monster.attackCharacter(character);
          character.showStatus();
          monster.showStatus();

        } else {
          print('${monster.name}을(를) 물리쳤습니다\n ');
          monsters.remove(monster);
          return;
        }
      }
    }
  
  Monster getRandomMonster() {
    return monsters[Random().nextInt(monsters.length)];
  }
}
