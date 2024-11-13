// obj_enemy Collision Event with objVey

// Store enemy and player instances globally
global.enemy_instance = id; // Not used anymore, can be removed if unnecessary
global.player_instance = other.id;

// Store player stats
global.player_hp = other.hp;
global.player_attack_mod = other.attack_mod;

// Store enemy stats
global.enemy_hp = hp;
global.enemy_attack_damage = attack_damage; // Corrected from attack_mod to attack_damage

// Transition to battle room
room_goto(rm_battle);
