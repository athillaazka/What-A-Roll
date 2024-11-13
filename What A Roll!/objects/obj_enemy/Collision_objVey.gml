// obj_enemy Collision Event with objVey

// Store enemy and player instances globally
global.enemy_instance = id;
global.player_instance = other.id;

// Store player stats
global.player_hp = other.hp;
global.player_attack_mod = other.attack_mod;

// Store enemy stats
global.enemy_hp = hp;
global.enemy_attack_mod = attack_mod;

// Transition to battle room
room_goto(rm_battle);
