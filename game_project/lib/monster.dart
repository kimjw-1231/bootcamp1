import 'dart:math';
import 'character.dart';

class Monster {
  String name;
  int hp;
  int attack;
  int defense = 0;

  Monster(this.name, this.hp, int maxattack)
    : attack = Random().nextInt(maxattack) + 1;

  void attackCharacter(Character character) {
    int damage = max(1, attack - character.defense);
    character.hp -= damage;
    print('$name이(가) ${character.name}에게 $damage의 피해를 입혔습니다. ');
  }

  void showStatus() {
    print('$name - 체력 : $hp, 공격력 : $attack');
  }
}
