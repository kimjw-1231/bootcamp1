import 'monster.dart';

class Character {
  String name;
  int hp;
  int attack;
  int defense;

  Character(this.name, this.hp, this.attack, this.defense);

  void attackMonster(Monster monster) {
    int damage = (attack - monster.defense).clamp(0, attack);
    monster.hp -= damage;
    print('$name이(가) ${monster.name}에게 $damage의 피해를 입혔습니다!');
  }

  void defend(int recoverAmount) {
    hp += recoverAmount;
    print('$name이(가) 방어하여 체력을 $recoverAmount 회복했습니다!');
  }

  void showStatus() {
    print('$name - 체력: $hp, 공격력: $attack, 방어력: $defense');
  }
}
