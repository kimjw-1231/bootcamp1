import 'dart:io';
import 'monster.dart';
impomrt 'dart:math';

class Character {
  String name;
  int health;
  int attackPower;
  int defensePower;

  Character(this.name, this.health, this.attackPower, this.defensePower);

  void attackMonster(Monster monster) {
    int damage = (attackPower - monster.defensePower).clamp(0, attackPower);
    monster.health -= damage;
    print('$name이(가) ${monster.name}에게 $damage의 피해를 입혔습니다!');
  }

  void defend() {
    health += 5;
    print('$name이(가) 방어하여 체력을 5 회복했습니다!');
  }

  void showStatus() {
    print('$name - 체력: $health, 공격력: $attackPower, 방어력: $defensePower');
  }
}
